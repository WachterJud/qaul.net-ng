// Copyright (c) 2021 Open Community Project Association https://ocpa.ch
// This software is published under the AGPLv3 license.

//! # Discovered user table
//! 
//! This table contains all users known to this node.

use libp2p::{
    PeerId,
    identity::PublicKey,
};
use prost::Message;
use serde::{Serialize, Deserialize};
use state::Storage;
use std::collections::BTreeMap;
use std::sync::RwLock;

use crate::node;
use crate::rpc::Rpc;

/// Import protobuf message definition generated by 
/// the rust module prost-build.
pub mod proto { include!("qaul.rpc.users.rs"); }

/// mutable state of users table
static USERS: Storage<RwLock<Users>> = Storage::new();

/// implementation of all known users for routing references
pub struct Users {
    pub users: BTreeMap<PeerId, User>,
}

impl Users {
    /// Initialize the router::users::Users module
    /// this module is automatically initialized
    /// when the router module is initialized
    pub fn init() {
        {
            // create users table and save it to state
            let users = Users { users: BTreeMap::new() };
            USERS.set(RwLock::new(users));
        }

        // fill with locally registered users
        for user in node::user_accounts::UserAccounts::get_user_info() {
            Self::add(user.id, user.key, user.name.clone(), false, false);
        }
    }

    /// add a new user to the users list
    pub fn add( id: PeerId, key: PublicKey, name: String, verified: bool, blocked: bool ) {
        let mut users = USERS.get().write().unwrap();
        users.users.insert( id, User { id, key, name, verified, blocked } );
    }

    /// add a new user to the users list, and check whether the 
    /// User ID matches the public key
    pub fn add_with_check( id: PeerId, key: PublicKey, name: String ) {
        // check if user is valid
        if id != key.clone().into_peer_id() { 
            return 
        }

        let mut users = USERS.get().write().unwrap();

        // check if user already exists
        if users.users.contains_key(&id) {
            return
        }
        users.users.insert( id, User { id, key, name, verified: false, blocked: false } );
    }

    /// get the public key of a known user
    pub fn get_pub_key( user_id: &PeerId ) -> Option<PublicKey> {
        let store = USERS.get().read().unwrap();
        let result = store.users.get(user_id);
        match result {
            Some(user) => Some(user.key.clone()),
            None => None
        }
    }

    /// create and send the user info table for the
    /// RouterInfo message which is sent regularly to neighbours
    pub fn get_user_info_table() -> UserInfoTable {
        let store = USERS.get().read().unwrap();
        let mut users = Vec::new();
        for (_id, value) in &store.users {
            users.push(UserInfo {
                id: value.id.to_bytes(),
                key: value.key.clone().into_protobuf_encoding(),
                name: value.name.clone(),
            });
        }
        UserInfoTable(users)
    }

    /// add new users from the received bytes of a UserInfoTable
    pub fn add_user_info_table(users: UserInfoTable) {
        // loop through it and add it to the users list
        for value in users.0.iter() {
            let id_result = PeerId::from_bytes(&value.id);
            let key_result = PublicKey::from_protobuf_encoding(&value.key);

            if let (Ok(id), Ok(key)) = (id_result, key_result) {
                Self::add_with_check(
                    id,
                    key,
                    value.name.clone()
                );
            }
        }
    }

    /// Process incoming RPC request messages
    pub fn rpc(data: Vec<u8>) {
        match proto::Users::decode(&data[..]) {
            Ok(users) => {
                match users.message {
                    Some(proto::users::Message::UserRequest(_user_request)) => {
                        // get users store
                        let users = USERS.get().read().unwrap();
        
                        // fill them into the list
                        let mut user_list = proto::UserList {
                            user: Vec::new(),
                        };
                        for (id, user) in &users.users {
                            // get RPC key values
                            let (key_type, key_base58) = Self::get_protobuf_public_key(user.key.clone());
        
                            // create user entry message
                            let user_entry = proto::UserEntry {
                                name: user.name.clone(),
                                id: id.to_bytes(),
                                id_base58: id.to_base58(),
                                key: user.key.clone().into_protobuf_encoding(),
                                key_type,
                                key_base58,
                                connectivity: 0,
                                verified: user.verified,
                                blocked: user.blocked,
                            };
        
                            // add entry to list
                            user_list.user.push(user_entry);
                        }
        
                        // create message
                        let proto_message = proto::Users{
                            message: Some(proto::users::Message::UserList(
                                user_list)),
                        };
        
                        // encode message
                        let mut buf = Vec::with_capacity(proto_message.encoded_len());
                        proto_message.encode(&mut buf).expect("Vec<u8> provides capacity as needed");
        
                        // send message
                        Rpc::send_message(buf, crate::rpc::proto::Modules::Users.into(), "".to_string(), Vec::new() );
                    },
                    Some(proto::users::Message::UserUpdate(updated_user)) => {
                        log::info!("UserUpdate protobuf RPC message");
        
                        // create user id from bytes
                        if let Ok(user_id) = PeerId::from_bytes(&updated_user.id) {
                            // get users store
                            let mut users = USERS.get().write().unwrap();
        
                            // search for user in list and update entry
                            match users.users.get_mut(&user_id) {
                                Some(user_result) => {
                                    let user = User {
                                        id: user_id,
                                        key: user_result.key.clone(),
                                        name: user_result.name.clone(),
                                        verified: updated_user.verified,
                                        blocked: updated_user.blocked,
                                    };
        
                                    *user_result = user;
                                },
                                None => log::error!("updated user is unknown: {}", user_id.to_base58())
                            }
                        } else {
                            log::error!("PeerId couldn't be created");
                        }
                    },
                    _ => {},
                }
            },
            Err(error) => {
                log::error!("{:?}", error);
            },
        }
    }

    /// create the qaul RPC definitions of a public key
    /// 
    /// Returns a tuple with the key type & the base58 encoded
    /// (key_type: String, key_base58: String)
    fn get_protobuf_public_key(key: PublicKey) -> (String, String) {
        // extract values
        let key_type: String;
        let key_base58: String;

        match key {
            PublicKey::Ed25519(key) => {
                key_type = "Ed25519".to_owned();
                key_base58 = bs58::encode(key.encode()).into_string();
            }
            _ => {
                key_type = "UNDEFINED".to_owned();
                key_base58 = "UNDEFINED".to_owned();
            }
        }

        (key_type, key_base58)
    }
}


pub struct User {
    pub id: PeerId,
    pub key: PublicKey,
    pub name: String,
    pub verified: bool,
    pub blocked: bool,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub struct UserInfo {
    pub id: Vec<u8>,
    pub key: Vec<u8>,
    pub name: String,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
pub struct UserInfoTable(pub Vec<UserInfo>);

// Copyright (c) 2021 Open Community Project Association https://ocpa.ch
// This software is published under the AGPLv3 license.

//! # Qaul DTN Service
//!
//! The DTN service sends and receives DTN messages into the network.
//! They should reach everyone in the network.

use libp2p::PeerId;
use prost::Message;
use sled_extensions::{bincode::Tree, DbExt};
use state::InitCell;
use std::fmt;
use std::{convert::TryInto, sync::RwLock};

use super::messaging::{proto, MessagingServiceType};
use crate::node::user_accounts::{UserAccount, UserAccounts};
use crate::rpc::Rpc;
use crate::storage::configuration::Configuration;
use crate::storage::database::DataBase;

/// Import protobuf message definition generated by
/// the rust module prost-build.
pub mod proto_rpc {
    include!("qaul.rpc.dtn.rs");
}
/// DTN message entry new_sig => {org_sig, size}
/// This structure is used to update stroage node state(used size and message count)
#[derive(serde::Serialize, serde::Deserialize, Clone)]
pub struct DtnMessageEntry {
    // orignal DTN message signature
    pub org_sig: Vec<u8>,
    // DTN payload size (bytes)
    pub size: u32,
}

/// dtn storage state
#[derive(Clone)]
pub struct DtnStorageState {
    // Repacked and pending DTN message count
    pub message_counts: u32,
    // Current used size
    pub used_size: u64,
    // DTN message table ref
    pub db_ref: Tree<DtnMessageEntry>,
    // DTN message id table ref (org_dtn_sig => new_dtn_sig)
    // This is used to prevent dup DTN message incoming
    pub db_ref_id: Tree<Vec<u8>>,
}

/// mutable state of storge
pub static STORAGESTATE: InitCell<RwLock<DtnStorageState>> = InitCell::new();

/// qaul Delayed
///
pub struct Dtn {}

impl Dtn {
    /// init function
    /// Read dtn message table and initialize strage state
    pub fn init() {
        let db = DataBase::get_node_db();

        // open trees
        let dtn_messages: Tree<DtnMessageEntry> = db.open_bincode_tree("dtn-messages").unwrap();
        let db_ref_id: Tree<Vec<u8>> = db.open_bincode_tree("dtn-messages-ids").unwrap();

        //calc current used size
        let mut used_size: u64 = 0;
        for entry in dtn_messages.iter() {
            if let Ok((_, ent)) = entry {
                used_size = used_size + (ent.size as u64);
            }
        }
        let storage_state = DtnStorageState {
            message_counts: dtn_messages.len() as u32,
            used_size,
            db_ref: dtn_messages,
            db_ref_id: db_ref_id,
        };

        STORAGESTATE.set(RwLock::new(storage_state));
    }

    /// Convert Group ID from String to Binary
    fn id_string_to_bin(id: String) -> Result<Vec<u8>, String> {
        // check length
        if id.len() < 52 {
            return Err("Group ID not long enough".to_string());
        }

        // convert input
        match bs58::decode(id).into_vec() {
            Ok(id_bin) => Ok(id_bin),
            Err(e) => {
                let err = fmt::format(format_args!("{}", e));
                Err(err)
            }
        }
    }

    /// Get storage node user id
    pub fn get_storage_user(user_id: &PeerId) -> Option<PeerId> {
        let user_profile;
        match Configuration::get_user(user_id.to_string()) {
            Some(user_prof) => {
                user_profile = user_prof.clone();
            }
            None => {
                log::error!("dtn module: user profile no exists");
                return None;
            }
        }

        for user in &user_profile.storage.users {
            match Self::id_string_to_bin(user.clone()) {
                Ok(v) => match PeerId::from_bytes(&v) {
                    Ok(id) => {
                        return Some(id.clone());
                    }
                    _ => {}
                },
                _ => {}
            }
        }
        None
    }

    /// process DTN message by role as stroage node
    fn process_storage_node_message(
        user_account: &UserAccount,
        receiver_id: &PeerId,
        org_sig: &Vec<u8>,
        dtn_payload: &Vec<u8>,
    ) -> (i32, i32) {
        let mut storage_state = STORAGESTATE.get().write().unwrap();

        // check already received
        if storage_state.db_ref_id.contains_key(org_sig).unwrap() {
            return (
                super::messaging::proto::dtn_response::ResponseType::Accepted
                    .try_into()
                    .unwrap(),
                super::messaging::proto::dtn_response::Reason::None
                    .try_into()
                    .unwrap(),
            );
        }

        let user_profile;
        match Configuration::get_user(user_account.id.to_string()) {
            Some(user_prof) => {
                user_profile = user_prof.clone();
            }
            None => {
                log::error!("dtn module: user profile no exists");
                return (
                    super::messaging::proto::dtn_response::ResponseType::Rejected
                        .try_into()
                        .unwrap(),
                    super::messaging::proto::dtn_response::Reason::UserNotAccepted
                        .try_into()
                        .unwrap(),
                );
            }
        }

        // check storage
        let new_size = storage_state.used_size + (dtn_payload.len() as u64);
        let total_limit = (user_profile.storage.size_total as u64) * 1024 * 1024;
        if new_size > total_limit {
            return (
                super::messaging::proto::dtn_response::ResponseType::Rejected
                    .try_into()
                    .unwrap(),
                super::messaging::proto::dtn_response::Reason::OverallQuota
                    .try_into()
                    .unwrap(),
            );
        }

        // repack message and send
        let payload = super::messaging::proto::EnvelopPayload {
            payload: Some(super::messaging::proto::envelop_payload::Payload::Dtn(
                dtn_payload.clone(),
            )),
        };

        let envelop = super::messaging::proto::Envelope {
            sender_id: user_account.id.to_bytes(),
            receiver_id: receiver_id.to_bytes(),
            payload: payload.encode_to_vec(),
        };

        if let Ok(signature) = user_account.keys.sign(&envelop.encode_to_vec()) {
            // save dtn message entry
            storage_state.message_counts = storage_state.message_counts + 1;
            storage_state.used_size = new_size;

            if let Err(_e) = storage_state.db_ref.insert(
                signature.clone(),
                DtnMessageEntry {
                    org_sig: org_sig.clone(),
                    size: dtn_payload.len() as u32,
                },
            ) {
                log::error!("dnt entry storing error!");
            } else {
                if let Err(_e) = storage_state.db_ref.flush() {
                    log::error!("dnt entry flushing error!");
                }
            }

            // save message id
            if let Err(_e) = storage_state
                .db_ref_id
                .insert(org_sig.clone(), signature.clone())
            {
                log::error!("dtn id db storing error!");
            } else {
                if let Err(_e) = storage_state.db_ref_id.flush() {
                    log::error!("dtn id db flushing error!");
                }
            }

            let container = super::messaging::proto::Container {
                signature: signature.clone(),
                envelope: Some(envelop),
            };
            super::messaging::Messaging::save_unconfirmed_message(
                MessagingServiceType::DtnStored,
                &vec![],
                receiver_id,
                &container,
                true,
            );
        }

        (
            super::messaging::proto::dtn_response::ResponseType::Accepted
                .try_into()
                .unwrap(),
            super::messaging::proto::dtn_response::Reason::None
                .try_into()
                .unwrap(),
        )
        // update storage state
    }

    /// this function is called when receive DTN response
    pub fn on_dtn_response(dtn_response: &super::messaging::proto::DtnResponse) {
        // check if storage node case
        let mut state = STORAGESTATE.get().write().unwrap();
        if state.db_ref.contains_key(&dtn_response.signature).unwrap() {
            // update storage node state
            let entry = state.db_ref.get(&dtn_response.signature).unwrap().unwrap();
            if state.used_size > entry.size as u64 {
                state.used_size = state.used_size + (entry.size as u64);
            } else {
                state.used_size = 0;
            }
            if state.message_counts > 0 {
                state.message_counts = state.message_counts - 1;
            }

            // remove entry
            if let Err(_) = state.db_ref.remove(&dtn_response.signature) {
                log::error!("remove storage node entry error!");
            } else {
                if let Err(_) = state.db_ref.flush() {
                    log::error!("remove storage node entry flush error!");
                }
            }

            if let Err(_) = state.db_ref_id.remove(&entry.org_sig) {
                log::error!("remove storage node id entry error!");
            } else {
                if let Err(_) = state.db_ref_id.flush() {
                    log::error!("remove storage node id entry flush error!");
                }
            }
        }
    }

    /// prtocess DTN messages from network
    pub fn net(user_id: &PeerId, sender_id: &PeerId, signature: &Vec<u8>, dtn_payload: &Vec<u8>) {
        if let Some(user_account) = UserAccounts::get_by_id(*user_id) {
            match proto::Container::decode(&dtn_payload[..]) {
                Ok(container) => {
                    let envelope = container.envelope.as_ref().unwrap();

                    let mut res: (i32, i32) = (
                        super::messaging::proto::dtn_response::ResponseType::Accepted
                            .try_into()
                            .unwrap(),
                        super::messaging::proto::dtn_response::Reason::None
                            .try_into()
                            .unwrap(),
                    );

                    //if container.envelope.receiver_id
                    if let Ok(receiver_id) = PeerId::from_bytes(&envelope.receiver_id) {
                        if receiver_id == *user_id {
                            // by process geneal message, the confirm message is transfered to the original sender.
                            super::messaging::process::MessagingProcess::process_received_message(
                                user_account.clone(),
                                container,
                            );
                        } else {
                            res = Self::process_storage_node_message(
                                &user_account,
                                &receiver_id,
                                signature,
                                dtn_payload,
                            );
                        }

                        // we send DTN response message
                        let dnt_response = super::messaging::proto::DtnResponse {
                            response_type: res.0,
                            reason: res.1,
                            signature: signature.clone(),
                        };
                        let send_message = proto::Messaging {
                            message: Some(proto::messaging::Message::DtnResponse(dnt_response)),
                        };
                        if let Err(_) = super::messaging::Messaging::pack_and_send_message(
                            &user_account,
                            sender_id,
                            send_message.encode_to_vec(),
                            MessagingServiceType::DtnStored,
                            &Vec::new(),
                            false,
                        ) {
                            log::error!("send dtn message error!");
                        }
                    }
                }
                _ => {}
            }
        }
    }

    /// process commands from RPC
    pub fn rpc(data: Vec<u8>, user_id: Vec<u8>) {
        // create peer ID from bytes
        let my_user_id;
        match PeerId::from_bytes(&user_id) {
            Ok(peer_id) => my_user_id = peer_id,
            Err(e) => {
                log::error!("invalid user id: {}", e);
                return;
            }
        }

        match proto_rpc::Dtn::decode(&data[..]) {
            Ok(dtn) => match dtn.message {
                Some(proto_rpc::dtn::Message::DtnStateRequest(_req)) => {
                    let state = STORAGESTATE.get().read().unwrap();
                    let unconfirmed = super::messaging::UNCONFIRMED.get().read().unwrap();
                    let unconfrimed_len = unconfirmed.unconfirmed.len();

                    let proto_message = proto_rpc::Dtn {
                        message: Some(proto_rpc::dtn::Message::DtnStateResponse(
                            proto_rpc::DtnStateResponse {
                                used_size: state.used_size,
                                dtn_message_count: state.message_counts,
                                unconfirmed_count: unconfrimed_len as u32,
                            },
                        )),
                    };

                    // send message
                    Rpc::send_message(
                        proto_message.encode_to_vec(),
                        crate::rpc::proto::Modules::Dtn.into(),
                        "".to_string(),
                        Vec::new(),
                    );
                }
                Some(proto_rpc::dtn::Message::DtnConfigRequest(_req)) => {
                    match Configuration::get_user(my_user_id.to_string()) {
                        Some(user_profile) => {
                            let mut users: Vec<Vec<u8>> = Vec::new();
                            // create users list
                            for user in user_profile.storage.users {
                                // convert string to bytes id
                                match bs58::decode(user).into_vec() {
                                    Ok(user_id) => users.push(user_id),
                                    Err(e) => log::error!(
                                        "invalid bs58 DTN storage user configuration: {}",
                                        e
                                    ),
                                }
                            }

                            // create message
                            let proto_message = proto_rpc::Dtn {
                                message: Some(proto_rpc::dtn::Message::DtnConfigResponse(
                                    proto_rpc::DtnConfigResponse {
                                        total_size: user_profile.storage.size_total,
                                        users: users,
                                    },
                                )),
                            };

                            // send message
                            Rpc::send_message(
                                proto_message.encode_to_vec(),
                                crate::rpc::proto::Modules::Dtn.into(),
                                "".to_string(),
                                Vec::new(),
                            );
                        }
                        None => {
                            log::error!("user profile does not exists");
                        }
                    }
                }
                Some(proto_rpc::dtn::Message::DtnAddUserRequest(req)) => {
                    let mut status = true;
                    let mut message: String = "".to_string();

                    match Configuration::get_user(my_user_id.to_string()) {
                        Some(user_profile) => {
                            // CHANGE: save it to user account and not to configuration directly

                            // convert binary data to user string
                            let user_id_string;
                            match PeerId::from_bytes(&req.user_id) {
                                Ok(user_id) => user_id_string = user_id.to_base58(),
                                Err(e) => {
                                    log::error!("configuration error reading account it: {}", e);
                                    return;
                                }
                            }

                            // check if already exist
                            for user in &user_profile.storage.users {
                                if *user == user_id_string {
                                    status = false;
                                    message = "User already exist".to_string();
                                    break;
                                }
                            }
                            if status {
                                let mut opt = user_profile.storage.clone();
                                opt.users.push(user_id_string);
                                Configuration::update_user_storage(my_user_id.to_string(), &opt);
                                Configuration::save();
                            }

                            let proto_message = proto_rpc::Dtn {
                                message: Some(proto_rpc::dtn::Message::DtnAddUserResponse(
                                    proto_rpc::DtnAddUserResponse { status, message },
                                )),
                            };
                            // send message
                            Rpc::send_message(
                                proto_message.encode_to_vec(),
                                crate::rpc::proto::Modules::Dtn.into(),
                                "".to_string(),
                                Vec::new(),
                            );
                        }
                        None => {
                            log::error!("user profile does not exists");
                        }
                    }
                }
                Some(proto_rpc::dtn::Message::DtnRemoveUserRequest(req)) => {
                    let mut status = true;
                    let mut message: String = "".to_string();

                    match Configuration::get_user(my_user_id.to_string()) {
                        Some(user_profile) => {
                            // CHANGE: save it to user_account and not to configuration directly

                            // convert binary data to user string
                            let user_id_string;
                            match PeerId::from_bytes(&req.user_id) {
                                Ok(user_id) => user_id_string = user_id.to_base58(),
                                Err(e) => {
                                    log::error!("configuration error reading account it: {}", e);
                                    return;
                                }
                            }

                            // check if user storage exists
                            let mut idx: Option<usize> = None;
                            for i in 0..user_profile.storage.users.len() {
                                if *user_profile.storage.users.get(i).unwrap() == user_id_string {
                                    idx = Some(i);
                                    break;
                                }
                            }
                            match idx {
                                None => {
                                    status = false;
                                    message = "User does not exist".to_string();
                                }
                                _ => {}
                            }

                            if status {
                                let mut opt = user_profile.storage.clone();
                                opt.users.remove(idx.unwrap());
                                Configuration::update_user_storage(my_user_id.to_string(), &opt);
                                Configuration::save();
                            }

                            let proto_message = proto_rpc::Dtn {
                                message: Some(proto_rpc::dtn::Message::DtnRemoveUserResponse(
                                    proto_rpc::DtnRemoveUserResponse { status, message },
                                )),
                            };
                            // send message
                            Rpc::send_message(
                                proto_message.encode_to_vec(),
                                crate::rpc::proto::Modules::Dtn.into(),
                                "".to_string(),
                                Vec::new(),
                            );
                        }
                        None => {
                            log::error!("user profile does not exists");
                        }
                    }
                }
                Some(proto_rpc::dtn::Message::DtnSetTotalSizeRequest(req)) => {
                    match Configuration::get_user(my_user_id.to_string()) {
                        // CHANGE: save it in user profile, not to configuration directly.
                        Some(_user_profile) => {
                            Configuration::update_total_size(
                                my_user_id.to_string(),
                                req.total_size,
                            );
                            Configuration::save();

                            let proto_message = proto_rpc::Dtn {
                                message: Some(proto_rpc::dtn::Message::DtnSetTotalSizeResponse(
                                    proto_rpc::DtnSetTotalSizeResponse {
                                        status: true,
                                        message: "".to_string(),
                                    },
                                )),
                            };
                            // send message
                            Rpc::send_message(
                                proto_message.encode_to_vec(),
                                crate::rpc::proto::Modules::Dtn.into(),
                                "".to_string(),
                                Vec::new(),
                            );
                        }
                        None => {
                            log::error!("user profile does not exists");
                        }
                    }
                }
                _ => {
                    log::error!("Unhandled Protobuf DTN RPC message");
                }
            },
            Err(error) => {
                log::error!("{:?}", error);
            }
        }
    }
}

// Copyright (c) 2022 Open Community Project Association https://ocpa.ch
// This software is published under the AGPLv3 license.

//! # Qaul Group Service
//!
//! The Group service sends and receives messages and files into group members.
//! The Group messages carry on the Messaging service
//! Messaging(Group(GroupContainer(...)))

use libp2p::{
    PeerId,
};

use prost::Message;
use serde::{Deserialize, Serialize};
use sled_extensions::{bincode::Tree, DbExt};
use state::Storage;
use std::collections::BTreeMap;
use std::{
    convert::TryInto,
    sync::RwLock,
};
use crate::node::user_accounts::{UserAccount, UserAccounts};
use crate::rpc::Rpc;
use crate::storage::database::DataBase;
use crate::utilities::timestamp;
use super::chat::Chat;

use super::messaging::{proto, self};
use super::messaging::Messaging;

mod member;
use member::Member;

mod manage;
pub use manage::Manage;

mod message;
pub use message::GroupMessage;


/// Import protobuf message definition generated by
/// the rust module prost-build.
pub mod proto_rpc {
    include!("qaul.rpc.group.rs");
}
pub mod proto_net {
    include!("qaul.net.group.rs");
}

/// mutable state of all user groups
pub static GROUPSOFUSER: Storage<RwLock<GroupsOfUser>> = Storage::new();

/// Structure to management for groups.
#[derive(Clone)]
pub struct Groups {
    //DB reference 
    pub db_ref: Tree<Group>,
    // last group index
    pub last_group: u64,
    // id mapping group_id => index in DB
    pub group_ids: BTreeMap<Vec<u8>, u64>,
}


impl Groups{
    pub fn group_id_to_index(&self, group_id: &Vec<u8>) -> u64{        
        if self.group_ids.contains_key(group_id){
            return *self.group_ids.get(group_id).unwrap();
        }
        return 0;
    }    
}

/// Structure of user => groups mapping for storage
pub struct GroupsOfUser {
    pub groups_of_user: BTreeMap<Vec<u8>, Groups>,
}

/// Structure of group member
#[derive(Serialize, Deserialize, Clone)]
pub struct GroupMember {    
    // user id
    pub user_id: Vec<u8>,
    // role = 0 => member, 255 => admin
    pub role: u8,
    // joined at
    pub joined_at: u64,
    // state for future using
    pub state: u8,
    // last message index
    pub last_message_index: u32,
}

/// Structure of Group
#[derive(Serialize, Deserialize, Clone)]
pub struct Group {
    // group id
    pub id: Vec<u8>,
    // group name
    pub name: String,
    // is direct chat group
    pub is_direct_chat: bool,
    // created at
    pub created_at: u64,
    // creator id
    pub creator_id: Vec<u8>,
    // members
    pub members: BTreeMap<Vec<u8>, GroupMember>,
}

/// Group module to process transfer, receive and RPC commands
impl Group{
    /// get a group member
    pub fn get_member(&self, user_id: &Vec<u8>)-> Option<&GroupMember>{
        if self.members.contains_key(user_id){
            return self.members.get(user_id);
        }
        None
    }


    /// initialize group chat module
    pub fn init() {
        let groups_of_user = GroupsOfUser{
            groups_of_user: BTreeMap::new(),
        };
        GROUPSOFUSER.set(RwLock::new(groups_of_user));
    }
    /// group exist
    pub fn is_group_exist(user_id: &PeerId, group_id: &Vec<u8>) ->bool{
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        idx > 0
    }


    /// member exist
    pub fn is_group_member_exist(user_id: &PeerId, group_id: &Vec<u8>, member_id: &Vec<u8>) ->bool{
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        if idx == 0 {
            return false;
        }

        if let Ok(res) = user_groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(group) =>{
                    return group.members.contains_key(member_id);
                },
                _ =>{}
            }
        }
        false
    }
    
    /// get group member    
    pub fn get_group_member(user_id: &PeerId, group_id: &Vec<u8>, member_id: &Vec<u8>)-> Option<GroupMember>{
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        if idx == 0{
            return None;
        }
        if let Ok(res) = user_groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(group) =>{
                    if let Some(member) = group.members.get(member_id){
                        return Some(member.clone());
                    }
                },
                _ =>{

                }
            }
        }
        None
    }

    /// update group member
    pub fn update_group_member(user_id: &PeerId, group_id: &Vec<u8>, member: &GroupMember){
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        if idx == 0{
            return;
        }
        if let Ok(res) = user_groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(mut group) =>{
                    group.members.insert(member.user_id.clone(), member.clone());
                    // update DB
                    user_groups.db_ref.insert(&idx.to_be_bytes(), group);
                    user_groups.db_ref.flush();
                },
                _ =>{}
            }
        }
    }


    /// get group name
    pub fn get_group_name(user_id: &PeerId, group_id: &Vec<u8>) -> Option<String>{
        let groups = Self::get_groups_of_user(user_id);
        let idx = groups.group_id_to_index(group_id);
        if idx == 0{
            return None;
        }
        if let Ok(res) = groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(group) =>{
                    return Some(group.name.clone());
                },
                _ =>{

                }
            }
        }
        None        
    }

    /// update group name
    pub fn update_group_name(user_id: &PeerId, group_id: &Vec<u8>, name: String){
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        if idx == 0{
            return;
        }
        if let Ok(res) = user_groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(mut group) =>{
                    group.name = name.clone();
                    // update DB
                    user_groups.db_ref.insert(&idx.to_be_bytes(), group);
                },
                _ =>{}
            }
        }
    }

    /// get group
    pub fn get_group(user_id: &PeerId, group_id: &Vec<u8>)->Result<Group, String>{
        let user_groups = Self::get_groups_of_user(user_id);
        let idx = user_groups.group_id_to_index(group_id);
        if idx == 0{
            return Err("group no exists".to_string());
        }
        if let Ok(res) = user_groups.db_ref.get(&idx.to_be_bytes()){
            match res{
                Some(group) =>{
                    return Ok(group.clone());
                },
                _ =>{}
            }
        }
        Err("db error".to_string())
    }

    /// update user's groups
    pub fn update_groups_of_user(user_id: &PeerId, groups: Groups){
        let mut groups_of_user = GROUPSOFUSER.get().write().unwrap();
        groups_of_user.groups_of_user.insert(user_id.to_bytes(), groups);
    }

    /// get user's groups
    pub fn get_groups_of_user(user_id: &PeerId) ->Groups{
        let mut groups_of_user = GROUPSOFUSER.get().write().unwrap();
        if !groups_of_user.groups_of_user.contains_key(&user_id.to_bytes()){
            let new_groups_of_user = Self::create_groups_of_user(user_id);
            groups_of_user.groups_of_user.insert(user_id.to_bytes(), new_groups_of_user);            
        }
        let groups = groups_of_user.groups_of_user.get(&user_id.to_bytes()).unwrap();
        groups.clone()
    }


    /// create new user's groups from DB
    fn create_groups_of_user(user_id: &PeerId) -> Groups{
        let db = DataBase::get_user_db(user_id.clone());
        let tree: Tree<Group> = db.open_bincode_tree("groups").unwrap();

        // // get last key
        let last_group: u64;
        match tree.iter().last() {
            Some(Ok((ivec, _))) => {
                let i = ivec.to_vec();
                match i.try_into() {
                    Ok(arr) => {
                        last_group = u64::from_be_bytes(arr);
                    }
                    Err(e) => {
                        log::error!("couldn't convert ivec to u64: {:?}", e);
                        last_group = 0;
                    }    
                }
            },
            None => {
                last_group = 0;
            },
            Some(Err(e)) => {
                log::error!("Sled feed table error: {}", e);
                last_group = 0;
            }
        }

        let mut ids: BTreeMap<Vec<u8>, u64> =  BTreeMap::new();
        //initialize group_id mapping
        for res in tree.iter(){
            match res {
                Ok((idx, group)) => {
                    let index = idx.to_vec();
                    ids.insert(group.id, u64::from_be_bytes(index.try_into().unwrap()));
                },
                Err(e) => {
                    log::error!("Error retrieving feed message from data base: {}", e);
                }
            }
        }

        let groups = Groups{
            db_ref: tree,
            last_group,
            group_ids: ids,
        };
        groups
    }


    /// Send capsuled group message through messaging service
    pub fn send_group_message_through_message(user_account: &UserAccount, receiver:&PeerId, data: &Vec<u8>){
        let message_id =  Messaging::generate_message_id(&user_account.id);
        let conversation_id = messaging::ConversationId::from_peers(&user_account.id, &receiver).unwrap();
        let common_message = proto::CommonMessage{
            message_id: message_id.clone(),
            conversation_id: conversation_id.to_bytes(),
            sent_at: timestamp::Timestamp::get_timestamp(),            
            payload: Some(proto::common_message::Payload::GroupMessage(
                proto::GroupMessage {
                    content: data.clone(),
                }
            )),
        };

        let send_message = proto::Messaging {
            message: Some(proto::messaging::Message::CommonMessage(common_message.clone()))
        };

        // send message via messaging
        match Messaging::pack_and_send_message(user_account, &receiver, &send_message.encode_to_vec(), Some(&message_id), true){
            Ok(signature)=>{
                // save                 
                Chat::save_outgoing_message(&user_account.id, &receiver, &conversation_id, &message_id, &common_message.encode_to_vec(), 0);
            },
            Err(err)=>{
                log::error!("group message sending failed {}", err);
            }
        }

    }

    /// BroadCast group updated to all members
    fn post_group_update(my_user_id: &PeerId, group_id: &Vec<u8>){
        let groups = Self::get_groups_of_user(my_user_id);

        let group_idx = groups.group_id_to_index(group_id);
        if group_idx == 0{
            return;
        }

        let group = groups.db_ref.get(&group_idx.to_be_bytes()).unwrap().unwrap();

        //create group notify messge and post to all members        
        let mut members: Vec<proto_net::Member> = vec![];
        for m in group.members.values(){
            members.push(proto_net::Member{
                user_id: m.user_id.clone(),
                role: m.role as u32,
                state: m.state as u32,
                joined_at: m.joined_at,
                last_message_index: m.last_message_index,
            });
        }

        let notify = proto_net::GroupNotify {
            group_id: group_id.clone(),
            group_name: group.name.clone(),
            created_at: group.created_at,
            creator_id: group.creator_id.clone(),
            members,
        };    

        let send_message = proto::Messaging {
            message: Some(proto::messaging::Message::GroupNotifyMessage(
                proto::GroupNotifyMessage{
                    content: notify.encode_to_vec(),
                }
            ))
        };
        
        //broad cast to all group members
        if let Some(user_account) = UserAccounts::get_by_id(*my_user_id){
            for user_id in group.members.keys(){
                let receiver = PeerId::from_bytes(&user_id.clone()).unwrap();
                if receiver != *my_user_id{
                    if let Err(error) = Messaging::pack_and_send_message(&user_account, &receiver, &send_message.encode_to_vec(), None, false){
                        log::error!("send group notify error {}", error);
                    }
                }
            }
        }

    }

    /// Process group notify message from network
    pub fn on_notify(sender_id: &PeerId, receiver_id: &PeerId, data: &Vec<u8>){
        match proto_net::GroupNotify::decode(&data[..]){
            Ok(notify)=>{
                manage::Manage::on_group_notify(&sender_id.to_bytes(), &receiver_id.to_bytes(), &notify);                
            },
            _=>{
                log::error!("invalid group notify message");
            }
        }
    }

    /// Process incoming NET messages for group chat module
    pub fn net(sender_id: &PeerId, receiver_id: &PeerId, data: &Vec<u8>){
        //check receiver id is in users list
        let user;
        match UserAccounts::get_by_id(receiver_id.clone()) {
            Some(usr) => {
                user = usr;
            }
            None => {
                log::error!("no user id={}", receiver_id);
                return;
            }
        }

        match proto_net::GroupContainer::decode(&data[..]) {
            Ok(messaging) =>{
                match messaging.message{
                    Some(proto_net::group_container::Message::InviteMember(invite_member)) => {
                        log::info!("group::on_receive_invite");
                        Member::on_be_invited(&user, &sender_id, &receiver_id, &invite_member);
                    },
                    Some(proto_net::group_container::Message::Removed(_removed)) => {
                        log::info!("group::on_removed");
                    },
                    Some(proto_net::group_container::Message::ReplyInvite(reply_invite)) => {
                        log::info!("group::on_answered for invite");
                        if let Err(error) =  Member::on_reply_invite(&sender_id, &receiver_id, &reply_invite){
                            log::error!("group on_reply_invite error {}", error);
                        }else {
                            if reply_invite.accept{
                                Self::post_group_update(&user.id, &reply_invite.group_id);
                            }
                        }
                    },
                    None => {
                        log::error!("file share message from {} was empty", sender_id.to_base58())
                    },
                }
            },
            Err(e) => {
                log::error!(
                    "Error decoding FileSharing Message from {} to {}: {}",
                    sender_id.to_base58(),
                    receiver_id.to_base58(),
                    e
                );
            }
        }

    }

    /// Process incoming RPC request messages for group chat module
    pub fn rpc(data: Vec<u8>, user_id: Vec<u8>) {
        let my_user_id = PeerId::from_bytes(&user_id).unwrap();

        match proto_rpc::Group::decode(&data[..]) {
            Ok(group) => {
                match group.message {
                    Some(proto_rpc::group::Message::GroupCreateRequest(group_create_req)) => {
                        let id = Manage::create_new_group(&my_user_id, group_create_req.group_name.clone());
                        //make response
                        let proto_message = proto_rpc::Group {
                            message: Some(proto_rpc::group::Message::GroupCreateResponse(
                                proto_rpc::GroupCreateResponse {
                                    group_name: group_create_req.group_name.clone(),
                                    group_id: id,
                                },
                            )),
                        };

                        // encode message
                        let mut buf = Vec::with_capacity(proto_message.encoded_len());
                        proto_message
                            .encode(&mut buf)
                            .expect("Vec<u8> provides capacity as needed");

                        // send message
                        Rpc::send_message(
                            buf,
                            crate::rpc::proto::Modules::Group.into(),
                            "".to_string(),
                            Vec::new(),
                        );                    
                    },
                    Some(proto_rpc::group::Message::GroupRenameRequest(group_rename_req)) => {
                        if let Err(err) = Manage::rename_group(&my_user_id, &group_rename_req.group_id, group_rename_req.group_name.clone()){
                            log::error!("Rename group error, {}", err);
                        }else{
                            let proto_message = proto_rpc::Group {
                                message: Some(proto_rpc::group::Message::GroupCreateResponse(
                                    proto_rpc::GroupCreateResponse {
                                        group_name: group_rename_req.group_name.clone(),
                                        group_id: group_rename_req.group_id.clone(),
                                    },
                                )),
                            };
    
                            // encode message
                            let mut buf = Vec::with_capacity(proto_message.encoded_len());
                            proto_message
                                .encode(&mut buf)
                                .expect("Vec<u8> provides capacity as needed");
    
                            // send message
                            Rpc::send_message(
                                buf,
                                crate::rpc::proto::Modules::Group.into(),
                                "".to_string(),
                                Vec::new(),
                            );

                            //post updates
                            Self::post_group_update(&my_user_id, &group_rename_req.group_id);
                        }
                    },
                    Some(proto_rpc::group::Message::GroupInfoRequest(group_info_req)) => {
                        match Manage::group_info(&my_user_id, &group_info_req.group_id) {
                            Ok(res)=>{
                                let proto_message = proto_rpc::Group {
                                    message: Some(proto_rpc::group::Message::GroupInfoResponse(
                                        res
                                    )),
                                };        
                                // encode message
                                let mut buf = Vec::with_capacity(proto_message.encoded_len());
                                proto_message
                                    .encode(&mut buf)
                                    .expect("Vec<u8> provides capacity as needed");
        
                                // send message
                                Rpc::send_message(
                                    buf,
                                    crate::rpc::proto::Modules::Group.into(),
                                    "".to_string(),
                                    Vec::new(),
                                );    
                            },
                            Err(err) =>{
                                log::error!("Get group info error, {}", err);
                            }
                        }
                    },
                    Some(proto_rpc::group::Message::GroupListRequest(_group_list_req)) => {
                        let list = Manage::group_list(&my_user_id);
                        let proto_message = proto_rpc::Group {
                            message: Some(proto_rpc::group::Message::GroupListResponse(
                                list
                            )),
                        };        
                        // encode message
                        let mut buf = Vec::with_capacity(proto_message.encoded_len());
                        proto_message
                            .encode(&mut buf)
                            .expect("Vec<u8> provides capacity as needed");

                        // send message
                        Rpc::send_message(
                            buf,
                            crate::rpc::proto::Modules::Group.into(),
                            "".to_string(),
                            Vec::new(),
                        );
                    },
                    Some(proto_rpc::group::Message::GroupInviteMemberRequest(invite_req)) => {                       
                        if let Err(err) =  Member::invite(&my_user_id, &invite_req.group_id, &invite_req.user_id) {
                            log::error!("Get group info error, {}", err);
                        }
                    },
                    Some(proto_rpc::group::Message::GroupReplyInviteRequest(reply_req)) => {
                        if let Err(err) =  Member::reply_invite(&my_user_id, &reply_req.group_id, &reply_req.user_id, reply_req.accept) {
                            log::error!("Get group info error, {}", err);
                        }
                    },                   

                    Some(proto_rpc::group::Message::GroupRemoveMemberRequest(remove_req)) => {                       
                        if let Err(err) =  Member::remove(&my_user_id, &remove_req.group_id, &remove_req.user_id) {
                            log::error!("Get group info error, {}", err);
                        }else{
                            Self::post_group_update(&my_user_id, &remove_req.group_id);
                        }
                    },
                    Some(proto_rpc::group::Message::GroupSendRequest(send_req)) => {                       
                        if let Err(err) =  GroupMessage::send(&my_user_id, &send_req.group_id, send_req.message.clone()) {
                            log::error!("Get group send error, {}", err);
                        }
                    },                    
                    _ => {
                        log::error!("Unhandled Protobuf Group chat message");
                    }
                }
            }
            Err(error) => {
                log::error!("{:?}", error);
            }
        }
    }

}

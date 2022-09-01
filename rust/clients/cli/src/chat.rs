// Copyright (c) 2021 Open Community Project Association https://ocpa.ch
// This software is published under the AGPLv3 license.

//! # Chat Module Interactions
//! 
//! Request, display and send chat messages from CLI

use prost::Message;
use super::rpc::Rpc;
use std::fmt;

/// include generated protobuf RPC rust definition file
mod proto { include!("../../../libqaul/src/rpc/protobuf_generated/rust/qaul.rpc.chat.rs"); }
mod proto_message { include!("../../../libqaul/src/rpc/protobuf_generated/rust/qaul.net.messaging.rs"); }
mod proto_group { include!("../../../libqaul/src/rpc/protobuf_generated/rust/qaul.net.group.rs"); }

/// chat module function handling
pub struct Chat {}

impl Chat {
    /// CLI command interpretation
    /// 
    /// The CLI commands of feed module are processed here
    pub fn cli(command: &str) {
        match command {
            // send chat message
            cmd if cmd.starts_with("send ") => {
                // get conversation id
                let command_string = cmd.strip_prefix("send ").unwrap().to_string();
                let mut iter = command_string.split_whitespace();

                if let Some(conversation_id_str) = iter.next() {
                    // convert conversation id from string to binary version
                    let mut conversation_id=vec![];
                    match Self::id_string_to_bin(conversation_id_str.to_string()) {
                        Ok(v) => {
                            conversation_id = v.clone();                        
                        },
                        _ =>{
                            match Self::uuid_string_to_bin(conversation_id_str.to_string()){
                                Ok(v)=>{
                                    conversation_id = v.clone();
                                },
                                _=>{
                                    log::error!("invalid conversation id format");
                                }
                            }
                        }
                    }
                    // get message string
                    if let Some(message) = command_string.strip_prefix(conversation_id_str) {
                        // send message
                        Self::send_chat_message(conversation_id, message.to_string().trim().to_string());
                        println!("chat message sent [{}] {}", conversation_id_str, message);
                        return;
                    }
                    else {
                        log::error!("prefix '{}' not found", conversation_id_str);
                        return;
                    }
                }
                else {
                    log::error!("chat send command incorrectly formatted");
                }
            },
            // request chat overview
            cmd if cmd.starts_with("overview") => {
                match cmd.strip_prefix("overview ") {
                    Some(index_str) => {
                        if let Ok(index) = index_str.parse::<u64>() {
                            // request chat overview
                            Self::request_chat_overview(index);
                        }
                        else {
                            log::error!("chat overview index is not a valid number");
                        }
                    },
                    None => {
                        // request all messages
                        Self::request_chat_overview(0);
                    }
                }
            },
            // request chat conversation
            cmd if cmd.starts_with("conversation") => {
                match cmd.strip_prefix("conversation ") {
                    Some(command_str) => {
                        let command_string = command_str.to_string();
                        let mut iter = command_string.split_whitespace();
                        let mut conversation_id = Vec::new();
                        let mut last_index = 0;

                        // convert conversation id from string to binary version
                        if let Some(conversation_id_str) = iter.next() {
                            match Self::id_string_to_bin(conversation_id_str.to_string()) {
                                Ok(id) => {
                                    conversation_id = id;
                                },
                                Err(e) => {
                                    match Self::uuid_string_to_bin(conversation_id_str.to_string()){
                                        Ok(id) => {
                                            conversation_id = id;
                                        },
                                        _ =>{
                                            log::error!("invalid converstion id");
                                            return;        
                                        }        
                                    }
                                }
                            }
                        }

                        // convert last_received index string to number
                        if let Some(index_str) = iter.next() {
                            // option: get last_received
                            if let Ok(index) = index_str.parse::<u64>() {
                                last_index = index;
                            }
                            else {
                                log::error!("chat conversation index is not a valid number");
                                return;
                            }
                        }

                        // request chat conversation
                        Self::request_chat_conversation(conversation_id, last_index);
                    },
                    None => {
                        // request all messages
                        log::error!("chat conversation command not correctly formatted");
                    }
                }
            },
            // request group chat conversation
            cmd if cmd.starts_with("group") => {
                match cmd.strip_prefix("group ") {
                    Some(command_str) => {
                        let command_string = command_str.to_string();
                        let mut iter = command_string.split_whitespace();
                        let mut conversation_id = Vec::new();
                        let mut last_index = 0;

                        // convert conversation id from string to binary version
                        if let Some(conversation_id_str) = iter.next() {
                            match Self::id_string_to_bin(conversation_id_str.to_string()) {
                                Ok(id) => {
                                    conversation_id = id;
                                },
                                Err(e) => {
                                    log::error!("{}", e);
                                    return;
                                }
                            }
                        }

                        // convert last_received index string to number
                        if let Some(index_str) = iter.next() {
                            // option: get last_received
                            if let Ok(index) = index_str.parse::<u64>() {
                                last_index = index;
                            }
                            else {
                                log::error!("chat conversation index is not a valid number");
                                return;
                            }
                        }
                        // request chat conversation
                        Self::request_group_conversation(conversation_id, last_index);
                    },
                    None => {
                        // request all messages
                        log::error!("chat conversation command not correctly formatted");
                    }
                }
            },

            // unknown command
            _ => log::error!("unknown chat command"),
        }
    }

    /// Convert Conversation ID from String to Binary
    fn id_string_to_bin (id: String) -> Result<Vec<u8>, String> {
        // check length
        if id.len() < 52 {
            return Err("Conversation ID not long enough".to_string());
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

    /// Convert Conversation ID from String to Binary
    fn uuid_string_to_bin(id_str: String) -> Result<Vec<u8>, String> {            
        match uuid::Uuid::parse_str(id_str.as_str()) {
            Ok(id)=>{
                Ok(id.as_bytes().to_vec())
            },
            _=>{
                Err("invalid group id".to_string())
            }
        }
    }

    /// Create and send feed message via rpc
    fn send_chat_message(conversation_id: Vec<u8>, message_text: String) {
        // create feed send message
        let proto_message = proto::Chat {
            message: Some(proto::chat::Message::Send(
                proto::ChatMessageSend{
                    conversation_id,
                    content: message_text,
                }
            )),
        };

        // encode message
        let mut buf = Vec::with_capacity(proto_message.encoded_len());
        proto_message.encode(&mut buf).expect("Vec<u8> provides capacity as needed");

        // send message
        Rpc::send_message(buf, super::rpc::proto::Modules::Chat.into(), "".to_string());
    }

    /// Request chat overview via rpc
    /// 
    /// Provides an overview over all conversations with the amount
    /// of unread messages, and the last message.
    fn request_chat_overview(_last_index: u64) {
        // create feed list request message
        let proto_message = proto::Chat {
            message: Some(proto::chat::Message::OverviewRequest(
                proto::ChatOverviewRequest{
                }
            )),
        };

        // encode message
        let mut buf = Vec::with_capacity(proto_message.encoded_len());
        proto_message.encode(&mut buf).expect("Vec<u8> provides capacity as needed");

        // send message
        Rpc::send_message(buf, super::rpc::proto::Modules::Chat.into(), "".to_string());
    }

    /// Request chat conversation via rpc
    /// 
    /// This provides all chat messages of a specific conversation.
    /// The conversation is addressed via it's conversation id
    fn request_chat_conversation(conversation_id: Vec<u8>, last_index: u64) {
        // create feed list request message
        let proto_message = proto::Chat {
            message: Some(proto::chat::Message::ConversationRequest(
                proto::ChatConversationRequest{
                    conversation_id,
                    last_index,
                }
            )),
        };

        // encode message
        let mut buf = Vec::with_capacity(proto_message.encoded_len());
        proto_message.encode(&mut buf).expect("Vec<u8> provides capacity as needed");

        // send message
        Rpc::send_message(buf, super::rpc::proto::Modules::Chat.into(), "".to_string());
    }

    /// Request group chat conversation via rpc
    /// 
    /// This provides all chat messages of a specific conversation.
    /// The conversation is addressed via it's conversation id
    fn request_group_conversation(group_id: Vec<u8>, last_index: u64) {
        // create feed list request message
        let proto_message = proto::Chat {
            message: Some(proto::chat::Message::ChatGroupRequest(
                proto::ChatGroupRequest{
                    group_id,
                    last_index,
                }
            )),
        };

        // encode message
        let mut buf = Vec::with_capacity(proto_message.encoded_len());
        proto_message.encode(&mut buf).expect("Vec<u8> provides capacity as needed");

        // send message
        Rpc::send_message(buf, super::rpc::proto::Modules::Chat.into(), "".to_string());
    }

    /// Process received RPC message
    /// 
    /// Decodes received protobuf encoded binary RPC message
    /// of the feed module.
    pub fn rpc(data: Vec<u8>) {
        match proto::Chat::decode(&data[..]) {
            Ok(chat) => {
                match chat.message {
                    Some(proto::chat::Message::OverviewList(proto_overview)) => {
                        // Overview table
                        println!("");
                        println!("Conversations Overview");
                        println!("");
                        println!("[ CONVERSATION ID ] CONVERSATION NAME");
                        println!("  Unread Messages | Last Message Index | Last Timestamp | Last Message Content");
                        println!("");

                        // print all messages in the feed list
                        for message in proto_overview.overview_list {
                            println!{"[ {} ] {}", bs58::encode(message.conversation_id).into_string(), message.name};
                            print!("  {} | ", message.unread);
                            print!("{} | ", message.last_message_index);
                            print!("{} | ", message.last_message_at);
                            match proto::ChatMessageContent::decode(&message.content[..]) {
                                Ok(chat_message_content) =>{
                                    match chat_message_content.content{
                                        Some(proto::chat_message_content::Content::ChatContent(chat_content)) =>{
                                            println!("  {}", chat_content.content);
                                        },
                                        Some(proto::chat_message_content::Content::FileContent(file_content)) =>{
                                            println!("  {}, {} bytes", file_content.file_name, file_content.file_size);
                                            println!("  index: {}, id: {}", file_content.history_index, file_content.file_id);
                                            println!("  description: {}", file_content.file_descr);
                                        },
                                        Some(proto::chat_message_content::Content::GroupInviteContent(invite_content)) =>{                                            
                                            println!("  Group invite group id: {}, Name: {}", bs58::encode(invite_content.group_id).into_string(), invite_content.group_name);
                                            println!("      Created at: {}, Members: {}", invite_content.created_at, invite_content.member_count);    
                                        },
                                        Some(proto::chat_message_content::Content::GroupInviteReplyContent(reply_content)) =>{
                                            print!("  Reply group invite ");
                                            println!("      group id: {} Accept: {}", bs58::encode(reply_content.group_id).into_string(), reply_content.accept);
                                        },
                                        _ =>{
                                            log::error!("unknown ChatMessageContent");   
                                        }
                                    }
                                },
                                Err(e) => {
                                    log::error!("{:?}", e);
                                },                    
                            }                            
                            println!("");
                        }
                    }
                    Some(proto::chat::Message::ConversationList(proto_conversation)) => {
                        // Conversation table
                        println!("");
                        println!("Conversation [ {} ]", bs58::encode(proto_conversation.conversation_id).into_string()); 
                        println!("");
                        println!("No. | Status | Sent At | Sender ID");
                        println!("  [Message ID] Received At");
                        println!("  Message Content");
                        println!("");

                        // print all messages in the feed list
                        for message in proto_conversation.message_list {
                            print!{"{} | ", message.index};

                            match message.status {
                                0 => print!(".. | "),
                                1 => print!("✓. | "),
                                2 => print!("✓✓ | "),
                                _ => print!("   | "),
                            }

                            print!("{} | ", message.sent_at);
                            println!("{}", bs58::encode(message.sender_id).into_string());
                            println!(" [{}] {}", bs58::encode(message.message_id).into_string(), message.received_at);

                            match proto_message::CommonMessage::decode(&message.content[..]) {
                                Ok(common) =>{
                                    match common.payload{
                                        Some(proto_message::common_message::Payload::ChatMessage(chat_msg)) =>{
                                            println!("  {}", chat_msg.content);
                                        },
                                        // Some(proto_message::common_message::Payload::FileMessage(file_msg)) =>{
                                        //     // println!("  {}, {} bytes", file_content.file_name, file_content.file_size);
                                        //     // println!("  index: {}, id: {}", file_content.history_index, file_content.file_id);
                                        //     // println!("  description: {}", file_content.file_descr);
                                        // },
                                        Some(proto_message::common_message::Payload::GroupMessage(group_msg)) =>{
                                            if let Ok(msg) = proto_group::GroupContainer::decode(&group_msg.content[..]){
                                                match msg.message{
                                                    Some(proto_group::group_container::Message::InviteMember(invite)) =>{
                                                        let group_id = uuid::Uuid::from_bytes(invite.group_id.try_into().unwrap());
                                                        if message.status == 1{
                                                            print!(" Sent");
                                                        }else {
                                                            print!(" Received");
                                                        }                                                        
                                                        println!(" group invite group id: {}, Name: {}", group_id.to_string(), invite.group_name);
                                                        println!("      Created at: {}, Members: {}", invite.created_at, invite.members_count);
                                                    },
                                                    Some(proto_group::group_container::Message::ReplyInvite(reply_invite)) =>{
                                                        let group_id = uuid::Uuid::from_bytes(reply_invite.group_id.try_into().unwrap());
                                                        if message.status <= 1 {
                                                            print!("  Sent ");
                                                        }else{
                                                            print!("  Received ");
                                                        }
                                                        if reply_invite.accept{
                                                            print!("  group accept ");
                                                        }else{
                                                            print!("  group decline ");
                                                        }
                                                        println!("      group id: {}", group_id.to_string());
                                                    },
                                                    Some(proto_group::group_container::Message::Removed(removed)) =>{

                                                    },
                                                    _ =>{}
                                                }
                                            }                                           
                                            
                                        },
                                        _ =>{
                                            log::error!("unknown ChatMessageContent"); 
                                        }
                                    }
                                },
                                Err(e) => {
                                    log::error!("{:?}", e);
                                },                    
                            }

                            
                            println!("");
                        }
                    },

                    Some(proto::chat::Message::ChatGroupList(proto_conversation)) => {
                        // Conversation table
                        println!("");
                        println!("Group [ {} ]", bs58::encode(proto_conversation.group_id).into_string()); 
                        println!("No | Received At | Sender");
                        println!("  Message Content");
                        println!("");

                        // print all messages in the feed list
                        for message in proto_conversation.message_list {
                            print!{"{} | ", message.index};
                            print!("{} | ", message.sent_at);
                            println!("{}", bs58::encode(message.message_id).into_string());

                            match proto::ChatMessageContent::decode(&message.content[..]) {
                                Ok(chat_message_content) =>{
                                    match chat_message_content.content{
                                        Some(proto::chat_message_content::Content::ChatContent(chat_content)) =>{
                                            println!("  {}", chat_content.content);
                                        },
                                        _ =>{
                                            log::error!("unknown ChatMessageContent");   
                                        }
                                    }
                                },
                                Err(e) => {
                                    log::error!("{:?}", e);
                                },                    
                            }                            
                            println!("");
                        }
                    },

                    _ => {
                        log::error!("unprocessable RPC chat message");
                    },
                }    
            },
            Err(error) => {
                log::error!("{:?}", error);
            },
        }
    }
}
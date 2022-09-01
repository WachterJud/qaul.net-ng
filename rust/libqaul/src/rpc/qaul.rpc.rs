/// The main libqaul RPC message container.
/// All RPC messages from and to libqaul are packed 
/// into this container.
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct QaulRpc {
    /// which module to approach
    #[prost(enumeration="Modules", tag="1")]
    pub module: i32,
    /// can be used to identify responses
    #[prost(string, tag="2")]
    pub request_id: ::prost::alloc::string::String,
    /// authorisation
    /// binary user id
    #[prost(bytes="vec", tag="3")]
    pub user_id: ::prost::alloc::vec::Vec<u8>,
    /// the protobuf encoded binary message data
    /// which is passed to the module.
    #[prost(bytes="vec", tag="4")]
    pub data: ::prost::alloc::vec::Vec<u8>,
}
/// Identification to which module the message shall be 
/// handed to.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, ::prost::Enumeration)]
#[repr(i32)]
pub enum Modules {
    /// default value, when nothing is defined. 
    /// drop this message
    None = 0,
    /// RPC related messages
    /// such as authorisation etc.
    Rpc = 1,
    /// qaul modules
    Node = 2,
    Useraccounts = 3,
    Users = 4,
    Router = 5,
    Feed = 6,
    Connections = 7,
    Debug = 8,
    Chat = 9,
    Ble = 10,
    Fileshare = 11,
    Group = 12,
    Rtc = 13,
}
impl Modules {
    /// String value of the enum field names used in the ProtoBuf definition.
    ///
    /// The values are not transformed in any way and thus are considered stable
    /// (if the ProtoBuf definition does not change) and safe for programmatic use.
    pub fn as_str_name(&self) -> &'static str {
        match self {
            Modules::None => "NONE",
            Modules::Rpc => "RPC",
            Modules::Node => "NODE",
            Modules::Useraccounts => "USERACCOUNTS",
            Modules::Users => "USERS",
            Modules::Router => "ROUTER",
            Modules::Feed => "FEED",
            Modules::Connections => "CONNECTIONS",
            Modules::Debug => "DEBUG",
            Modules::Chat => "CHAT",
            Modules::Ble => "BLE",
            Modules::Fileshare => "FILESHARE",
            Modules::Group => "GROUP",
            Modules::Rtc => "RTC",
        }
    }
}

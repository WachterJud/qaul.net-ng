/// Cryptoservice sending container
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CryptoserviceContainer {
    #[prost(oneof = "cryptoservice_container::Message", tags = "1")]
    pub message: ::core::option::Option<cryptoservice_container::Message>,
}
/// Nested message and enum types in `CryptoserviceContainer`.
pub mod cryptoservice_container {
    #[allow(clippy::derive_partial_eq_without_eq)]
    #[derive(Clone, PartialEq, ::prost::Oneof)]
    pub enum Message {
        /// Second Handshake Message
        #[prost(message, tag = "1")]
        SecondHandshake(super::SecondHandshake),
    }
}
/// Second Handshake Message
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct SecondHandshake {
    /// confirm message ID of first handshake message
    #[prost(bytes = "vec", tag = "1")]
    pub signature: ::prost::alloc::vec::Vec<u8>,
    /// received at timestamp
    #[prost(uint64, tag = "2")]
    pub received_at: u64,
}

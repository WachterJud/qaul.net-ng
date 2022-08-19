///
//  Generated code. Do not modify.
//  source: services/messaging/messaging.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use containerDescriptor instead')
const Container$json = const {
  '1': 'Container',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    const {'1': 'envelope', '3': 2, '4': 1, '5': 11, '6': '.qaul.net.messaging.Envelope', '10': 'envelope'},
  ],
};

/// Descriptor for `Container`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List containerDescriptor = $convert.base64Decode('CglDb250YWluZXISHAoJc2lnbmF0dXJlGAEgASgMUglzaWduYXR1cmUSOAoIZW52ZWxvcGUYAiABKAsyHC5xYXVsLm5ldC5tZXNzYWdpbmcuRW52ZWxvcGVSCGVudmVsb3Bl');
@$core.Deprecated('Use envelopeDescriptor instead')
const Envelope$json = const {
  '1': 'Envelope',
  '2': const [
    const {'1': 'sender_id', '3': 1, '4': 1, '5': 12, '10': 'senderId'},
    const {'1': 'receiver_id', '3': 2, '4': 1, '5': 12, '10': 'receiverId'},
    const {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `Envelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopeDescriptor = $convert.base64Decode('CghFbnZlbG9wZRIbCglzZW5kZXJfaWQYASABKAxSCHNlbmRlcklkEh8KC3JlY2VpdmVyX2lkGAIgASgMUgpyZWNlaXZlcklkEhgKB3BheWxvYWQYAyABKAxSB3BheWxvYWQ=');
@$core.Deprecated('Use envelopPayloadDescriptor instead')
const EnvelopPayload$json = const {
  '1': 'EnvelopPayload',
  '2': const [
    const {'1': 'encrypted', '3': 1, '4': 1, '5': 11, '6': '.qaul.net.messaging.Encrypted', '9': 0, '10': 'encrypted'},
    const {'1': 'dtn', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'dtn'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `EnvelopPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List envelopPayloadDescriptor = $convert.base64Decode('Cg5FbnZlbG9wUGF5bG9hZBI9CgllbmNyeXB0ZWQYASABKAsyHS5xYXVsLm5ldC5tZXNzYWdpbmcuRW5jcnlwdGVkSABSCWVuY3J5cHRlZBISCgNkdG4YAiABKAxIAFIDZHRuQgkKB3BheWxvYWQ=');
@$core.Deprecated('Use encryptedDescriptor instead')
const Encrypted$json = const {
  '1': 'Encrypted',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Encrypted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encryptedDescriptor = $convert.base64Decode('CglFbmNyeXB0ZWQSEgoEZGF0YRgBIAEoDFIEZGF0YQ==');
@$core.Deprecated('Use dataDescriptor instead')
const Data$json = const {
  '1': 'Data',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 4, '10': 'nonce'},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDescriptor = $convert.base64Decode('CgREYXRhEhQKBW5vbmNlGAEgASgEUgVub25jZRISCgRkYXRhGAIgASgMUgRkYXRh');
@$core.Deprecated('Use messagingDescriptor instead')
const Messaging$json = const {
  '1': 'Messaging',
  '2': const [
    const {'1': 'confirmation_message', '3': 1, '4': 1, '5': 11, '6': '.qaul.net.messaging.Confirmation', '9': 0, '10': 'confirmationMessage'},
    const {'1': 'crypto_service', '3': 2, '4': 1, '5': 11, '6': '.qaul.net.messaging.CryptoService', '9': 0, '10': 'cryptoService'},
    const {'1': 'rtc_stream_message', '3': 3, '4': 1, '5': 11, '6': '.qaul.net.messaging.RtcStreamMessage', '9': 0, '10': 'rtcStreamMessage'},
    const {'1': 'group_notify_message', '3': 4, '4': 1, '5': 11, '6': '.qaul.net.messaging.GroupNotifyMessage', '9': 0, '10': 'groupNotifyMessage'},
    const {'1': 'common_message', '3': 5, '4': 1, '5': 11, '6': '.qaul.net.messaging.CommonMessage', '9': 0, '10': 'commonMessage'},
  ],
  '8': const [
    const {'1': 'message'},
  ],
};

/// Descriptor for `Messaging`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagingDescriptor = $convert.base64Decode('CglNZXNzYWdpbmcSVQoUY29uZmlybWF0aW9uX21lc3NhZ2UYASABKAsyIC5xYXVsLm5ldC5tZXNzYWdpbmcuQ29uZmlybWF0aW9uSABSE2NvbmZpcm1hdGlvbk1lc3NhZ2USSgoOY3J5cHRvX3NlcnZpY2UYAiABKAsyIS5xYXVsLm5ldC5tZXNzYWdpbmcuQ3J5cHRvU2VydmljZUgAUg1jcnlwdG9TZXJ2aWNlElQKEnJ0Y19zdHJlYW1fbWVzc2FnZRgDIAEoCzIkLnFhdWwubmV0Lm1lc3NhZ2luZy5SdGNTdHJlYW1NZXNzYWdlSABSEHJ0Y1N0cmVhbU1lc3NhZ2USWgoUZ3JvdXBfbm90aWZ5X21lc3NhZ2UYBCABKAsyJi5xYXVsLm5ldC5tZXNzYWdpbmcuR3JvdXBOb3RpZnlNZXNzYWdlSABSEmdyb3VwTm90aWZ5TWVzc2FnZRJKCg5jb21tb25fbWVzc2FnZRgFIAEoCzIhLnFhdWwubmV0Lm1lc3NhZ2luZy5Db21tb25NZXNzYWdlSABSDWNvbW1vbk1lc3NhZ2VCCQoHbWVzc2FnZQ==');
@$core.Deprecated('Use cryptoServiceDescriptor instead')
const CryptoService$json = const {
  '1': 'CryptoService',
};

/// Descriptor for `CryptoService`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cryptoServiceDescriptor = $convert.base64Decode('Cg1DcnlwdG9TZXJ2aWNl');
@$core.Deprecated('Use confirmationDescriptor instead')
const Confirmation$json = const {
  '1': 'Confirmation',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    const {'1': 'received_at', '3': 2, '4': 1, '5': 4, '10': 'receivedAt'},
  ],
};

/// Descriptor for `Confirmation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmationDescriptor = $convert.base64Decode('CgxDb25maXJtYXRpb24SHAoJc2lnbmF0dXJlGAEgASgMUglzaWduYXR1cmUSHwoLcmVjZWl2ZWRfYXQYAiABKARSCnJlY2VpdmVkQXQ=');
@$core.Deprecated('Use commonMessageDescriptor instead')
const CommonMessage$json = const {
  '1': 'CommonMessage',
  '2': const [
    const {'1': 'message_id', '3': 1, '4': 1, '5': 12, '10': 'messageId'},
    const {'1': 'conversation_id', '3': 2, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'sent_at', '3': 3, '4': 1, '5': 4, '10': 'sentAt'},
    const {'1': 'chat_message', '3': 4, '4': 1, '5': 11, '6': '.qaul.net.messaging.ChatMessage', '9': 0, '10': 'chatMessage'},
    const {'1': 'file_message', '3': 5, '4': 1, '5': 11, '6': '.qaul.net.messaging.FileMessage', '9': 0, '10': 'fileMessage'},
    const {'1': 'group_message', '3': 6, '4': 1, '5': 11, '6': '.qaul.net.messaging.GroupMessage', '9': 0, '10': 'groupMessage'},
    const {'1': 'rtc_message', '3': 7, '4': 1, '5': 11, '6': '.qaul.net.messaging.RtcMessage', '9': 0, '10': 'rtcMessage'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `CommonMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commonMessageDescriptor = $convert.base64Decode('Cg1Db21tb25NZXNzYWdlEh0KCm1lc3NhZ2VfaWQYASABKAxSCW1lc3NhZ2VJZBInCg9jb252ZXJzYXRpb25faWQYAiABKAxSDmNvbnZlcnNhdGlvbklkEhcKB3NlbnRfYXQYAyABKARSBnNlbnRBdBJECgxjaGF0X21lc3NhZ2UYBCABKAsyHy5xYXVsLm5ldC5tZXNzYWdpbmcuQ2hhdE1lc3NhZ2VIAFILY2hhdE1lc3NhZ2USRAoMZmlsZV9tZXNzYWdlGAUgASgLMh8ucWF1bC5uZXQubWVzc2FnaW5nLkZpbGVNZXNzYWdlSABSC2ZpbGVNZXNzYWdlEkcKDWdyb3VwX21lc3NhZ2UYBiABKAsyIC5xYXVsLm5ldC5tZXNzYWdpbmcuR3JvdXBNZXNzYWdlSABSDGdyb3VwTWVzc2FnZRJBCgtydGNfbWVzc2FnZRgHIAEoCzIeLnFhdWwubmV0Lm1lc3NhZ2luZy5SdGNNZXNzYWdlSABSCnJ0Y01lc3NhZ2VCCQoHcGF5bG9hZA==');
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIYCgdjb250ZW50GAEgASgJUgdjb250ZW50');
@$core.Deprecated('Use fileMessageDescriptor instead')
const FileMessage$json = const {
  '1': 'FileMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `FileMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMessageDescriptor = $convert.base64Decode('CgtGaWxlTWVzc2FnZRIYCgdjb250ZW50GAEgASgMUgdjb250ZW50');
@$core.Deprecated('Use rtcMessageDescriptor instead')
const RtcMessage$json = const {
  '1': 'RtcMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `RtcMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rtcMessageDescriptor = $convert.base64Decode('CgpSdGNNZXNzYWdlEhgKB2NvbnRlbnQYASABKAxSB2NvbnRlbnQ=');
@$core.Deprecated('Use rtcStreamMessageDescriptor instead')
const RtcStreamMessage$json = const {
  '1': 'RtcStreamMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `RtcStreamMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rtcStreamMessageDescriptor = $convert.base64Decode('ChBSdGNTdHJlYW1NZXNzYWdlEhgKB2NvbnRlbnQYASABKAxSB2NvbnRlbnQ=');
@$core.Deprecated('Use groupMessageDescriptor instead')
const GroupMessage$json = const {
  '1': 'GroupMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `GroupMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupMessageDescriptor = $convert.base64Decode('CgxHcm91cE1lc3NhZ2USGAoHY29udGVudBgBIAEoDFIHY29udGVudA==');
@$core.Deprecated('Use groupNotifyMessageDescriptor instead')
const GroupNotifyMessage$json = const {
  '1': 'GroupNotifyMessage',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `GroupNotifyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupNotifyMessageDescriptor = $convert.base64Decode('ChJHcm91cE5vdGlmeU1lc3NhZ2USGAoHY29udGVudBgBIAEoDFIHY29udGVudA==');
@$core.Deprecated('Use dtnDescriptor instead')
const Dtn$json = const {
  '1': 'Dtn',
  '2': const [
    const {'1': 'container', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'container'},
    const {'1': 'response', '3': 2, '4': 1, '5': 11, '6': '.qaul.net.messaging.DtnResponse', '9': 0, '10': 'response'},
  ],
  '8': const [
    const {'1': 'message'},
  ],
};

/// Descriptor for `Dtn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dtnDescriptor = $convert.base64Decode('CgNEdG4SHgoJY29udGFpbmVyGAEgASgMSABSCWNvbnRhaW5lchI9CghyZXNwb25zZRgCIAEoCzIfLnFhdWwubmV0Lm1lc3NhZ2luZy5EdG5SZXNwb25zZUgAUghyZXNwb25zZUIJCgdtZXNzYWdl');
@$core.Deprecated('Use dtnResponseDescriptor instead')
const DtnResponse$json = const {
  '1': 'DtnResponse',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.qaul.net.messaging.DtnResponse.Type', '10': 'type'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    const {'1': 'reason', '3': 3, '4': 1, '5': 14, '6': '.qaul.net.messaging.DtnResponse.Reason', '10': 'reason'},
  ],
  '4': const [DtnResponse_Type$json, DtnResponse_Reason$json],
};

@$core.Deprecated('Use dtnResponseDescriptor instead')
const DtnResponse_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'ACCEPTED', '2': 0},
    const {'1': 'REJECTED', '2': 1},
  ],
};

@$core.Deprecated('Use dtnResponseDescriptor instead')
const DtnResponse_Reason$json = const {
  '1': 'Reason',
  '2': const [
    const {'1': 'USER_NOT_ACCEPTED', '2': 0},
    const {'1': 'OVERALL_QUOTA', '2': 1},
    const {'1': 'USER_QUOTA', '2': 2},
  ],
};

/// Descriptor for `DtnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dtnResponseDescriptor = $convert.base64Decode('CgtEdG5SZXNwb25zZRI4CgR0eXBlGAEgASgOMiQucWF1bC5uZXQubWVzc2FnaW5nLkR0blJlc3BvbnNlLlR5cGVSBHR5cGUSHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmUSPgoGcmVhc29uGAMgASgOMiYucWF1bC5uZXQubWVzc2FnaW5nLkR0blJlc3BvbnNlLlJlYXNvblIGcmVhc29uIiIKBFR5cGUSDAoIQUNDRVBURUQQABIMCghSRUpFQ1RFRBABIkIKBlJlYXNvbhIVChFVU0VSX05PVF9BQ0NFUFRFRBAAEhEKDU9WRVJBTExfUVVPVEEQARIOCgpVU0VSX1FVT1RBEAI=');

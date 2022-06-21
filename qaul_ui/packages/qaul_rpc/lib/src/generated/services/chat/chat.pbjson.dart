///
//  Generated code. Do not modify.
//  source: services/chat/chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use chatDescriptor instead')
const Chat$json = const {
  '1': 'Chat',
  '2': const [
    const {'1': 'overview_request', '3': 1, '4': 1, '5': 11, '6': '.qaul.rpc.chat.ChatOverviewRequest', '9': 0, '10': 'overviewRequest'},
    const {'1': 'overview_list', '3': 2, '4': 1, '5': 11, '6': '.qaul.rpc.chat.ChatOverviewList', '9': 0, '10': 'overviewList'},
    const {'1': 'conversation_request', '3': 3, '4': 1, '5': 11, '6': '.qaul.rpc.chat.ChatConversationRequest', '9': 0, '10': 'conversationRequest'},
    const {'1': 'conversation_list', '3': 4, '4': 1, '5': 11, '6': '.qaul.rpc.chat.ChatConversationList', '9': 0, '10': 'conversationList'},
    const {'1': 'send', '3': 5, '4': 1, '5': 11, '6': '.qaul.rpc.chat.ChatMessageSend', '9': 0, '10': 'send'},
  ],
  '8': const [
    const {'1': 'message'},
  ],
};

/// Descriptor for `Chat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatDescriptor = $convert.base64Decode('CgRDaGF0Ek8KEG92ZXJ2aWV3X3JlcXVlc3QYASABKAsyIi5xYXVsLnJwYy5jaGF0LkNoYXRPdmVydmlld1JlcXVlc3RIAFIPb3ZlcnZpZXdSZXF1ZXN0EkYKDW92ZXJ2aWV3X2xpc3QYAiABKAsyHy5xYXVsLnJwYy5jaGF0LkNoYXRPdmVydmlld0xpc3RIAFIMb3ZlcnZpZXdMaXN0ElsKFGNvbnZlcnNhdGlvbl9yZXF1ZXN0GAMgASgLMiYucWF1bC5ycGMuY2hhdC5DaGF0Q29udmVyc2F0aW9uUmVxdWVzdEgAUhNjb252ZXJzYXRpb25SZXF1ZXN0ElIKEWNvbnZlcnNhdGlvbl9saXN0GAQgASgLMiMucWF1bC5ycGMuY2hhdC5DaGF0Q29udmVyc2F0aW9uTGlzdEgAUhBjb252ZXJzYXRpb25MaXN0EjQKBHNlbmQYBSABKAsyHi5xYXVsLnJwYy5jaGF0LkNoYXRNZXNzYWdlU2VuZEgAUgRzZW5kQgkKB21lc3NhZ2U=');
@$core.Deprecated('Use chatOverviewRequestDescriptor instead')
const ChatOverviewRequest$json = const {
  '1': 'ChatOverviewRequest',
};

/// Descriptor for `ChatOverviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatOverviewRequestDescriptor = $convert.base64Decode('ChNDaGF0T3ZlcnZpZXdSZXF1ZXN0');
@$core.Deprecated('Use chatOverviewListDescriptor instead')
const ChatOverviewList$json = const {
  '1': 'ChatOverviewList',
  '2': const [
    const {'1': 'overview_list', '3': 1, '4': 3, '5': 11, '6': '.qaul.rpc.chat.ChatOverview', '10': 'overviewList'},
  ],
};

/// Descriptor for `ChatOverviewList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatOverviewListDescriptor = $convert.base64Decode('ChBDaGF0T3ZlcnZpZXdMaXN0EkAKDW92ZXJ2aWV3X2xpc3QYASADKAsyGy5xYXVsLnJwYy5jaGF0LkNoYXRPdmVydmlld1IMb3ZlcnZpZXdMaXN0');
@$core.Deprecated('Use chatOverviewDescriptor instead')
const ChatOverview$json = const {
  '1': 'ChatOverview',
  '2': const [
    const {'1': 'conversation_id', '3': 1, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'last_message_index', '3': 2, '4': 1, '5': 13, '10': 'lastMessageIndex'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'last_message_at', '3': 4, '4': 1, '5': 4, '10': 'lastMessageAt'},
    const {'1': 'unread', '3': 5, '4': 1, '5': 5, '10': 'unread'},
    const {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'last_message_sender_id', '3': 7, '4': 1, '5': 12, '10': 'lastMessageSenderId'},
  ],
};

/// Descriptor for `ChatOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatOverviewDescriptor = $convert.base64Decode('CgxDaGF0T3ZlcnZpZXcSJwoPY29udmVyc2F0aW9uX2lkGAEgASgMUg5jb252ZXJzYXRpb25JZBIsChJsYXN0X21lc3NhZ2VfaW5kZXgYAiABKA1SEGxhc3RNZXNzYWdlSW5kZXgSEgoEbmFtZRgDIAEoCVIEbmFtZRImCg9sYXN0X21lc3NhZ2VfYXQYBCABKARSDWxhc3RNZXNzYWdlQXQSFgoGdW5yZWFkGAUgASgFUgZ1bnJlYWQSGAoHY29udGVudBgGIAEoCVIHY29udGVudBIzChZsYXN0X21lc3NhZ2Vfc2VuZGVyX2lkGAcgASgMUhNsYXN0TWVzc2FnZVNlbmRlcklk');
@$core.Deprecated('Use chatConversationRequestDescriptor instead')
const ChatConversationRequest$json = const {
  '1': 'ChatConversationRequest',
  '2': const [
    const {'1': 'conversation_id', '3': 1, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'last_index', '3': 2, '4': 1, '5': 4, '10': 'lastIndex'},
  ],
};

/// Descriptor for `ChatConversationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatConversationRequestDescriptor = $convert.base64Decode('ChdDaGF0Q29udmVyc2F0aW9uUmVxdWVzdBInCg9jb252ZXJzYXRpb25faWQYASABKAxSDmNvbnZlcnNhdGlvbklkEh0KCmxhc3RfaW5kZXgYAiABKARSCWxhc3RJbmRleA==');
@$core.Deprecated('Use chatConversationListDescriptor instead')
const ChatConversationList$json = const {
  '1': 'ChatConversationList',
  '2': const [
    const {'1': 'conversation_id', '3': 1, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'message_list', '3': 2, '4': 3, '5': 11, '6': '.qaul.rpc.chat.ChatMessage', '10': 'messageList'},
  ],
};

/// Descriptor for `ChatConversationList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatConversationListDescriptor = $convert.base64Decode('ChRDaGF0Q29udmVyc2F0aW9uTGlzdBInCg9jb252ZXJzYXRpb25faWQYASABKAxSDmNvbnZlcnNhdGlvbklkEj0KDG1lc3NhZ2VfbGlzdBgCIAMoCzIaLnFhdWwucnBjLmNoYXQuQ2hhdE1lc3NhZ2VSC21lc3NhZ2VMaXN0');
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'sender_id', '3': 2, '4': 1, '5': 12, '10': 'senderId'},
    const {'1': 'message_id', '3': 3, '4': 1, '5': 12, '10': 'messageId'},
    const {'1': 'status', '3': 4, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'sent_at', '3': 5, '4': 1, '5': 4, '10': 'sentAt'},
    const {'1': 'received_at', '3': 6, '4': 1, '5': 4, '10': 'receivedAt'},
    const {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIUCgVpbmRleBgBIAEoDVIFaW5kZXgSGwoJc2VuZGVyX2lkGAIgASgMUghzZW5kZXJJZBIdCgptZXNzYWdlX2lkGAMgASgMUgltZXNzYWdlSWQSFgoGc3RhdHVzGAQgASgFUgZzdGF0dXMSFwoHc2VudF9hdBgFIAEoBFIGc2VudEF0Eh8KC3JlY2VpdmVkX2F0GAYgASgEUgpyZWNlaXZlZEF0EhgKB2NvbnRlbnQYByABKAlSB2NvbnRlbnQ=');
@$core.Deprecated('Use chatMessageSendDescriptor instead')
const ChatMessageSend$json = const {
  '1': 'ChatMessageSend',
  '2': const [
    const {'1': 'conversation_id', '3': 1, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `ChatMessageSend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageSendDescriptor = $convert.base64Decode('Cg9DaGF0TWVzc2FnZVNlbmQSJwoPY29udmVyc2F0aW9uX2lkGAEgASgMUg5jb252ZXJzYXRpb25JZBIYCgdjb250ZW50GAIgASgJUgdjb250ZW50');

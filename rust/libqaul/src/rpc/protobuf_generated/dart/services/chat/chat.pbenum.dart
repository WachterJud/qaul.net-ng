///
//  Generated code. Do not modify.
//  source: services/chat/chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContentType extends $pb.ProtobufEnum {
  static const ContentType chat = ContentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'chat');
  static const ContentType group = ContentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'group');
  static const ContentType file = ContentType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'file');
  static const ContentType rtc = ContentType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rtc');
  static const ContentType group_event = ContentType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'group_event');

  static const $core.List<ContentType> values = <ContentType> [
    chat,
    group,
    file,
    rtc,
    group_event,
  ];

  static final $core.Map<$core.int, ContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContentType? valueOf($core.int value) => _byValue[value];

  const ContentType._($core.int v, $core.String n) : super(v, n);
}

class MessageStatus extends $pb.ProtobufEnum {
  static const MessageStatus SENDING = MessageStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENDING');
  static const MessageStatus SENT = MessageStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENT');
  static const MessageStatus RECEIVED = MessageStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECEIVED');
  static const MessageStatus RECEIVED_BY_ALL = MessageStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECEIVED_BY_ALL');

  static const $core.List<MessageStatus> values = <MessageStatus> [
    SENDING,
    SENT,
    RECEIVED,
    RECEIVED_BY_ALL,
  ];

  static final $core.Map<$core.int, MessageStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageStatus? valueOf($core.int value) => _byValue[value];

  const MessageStatus._($core.int v, $core.String n) : super(v, n);
}

class GroupEventType extends $pb.ProtobufEnum {
  static const GroupEventType NONE = GroupEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const GroupEventType GROUP_JOINED = GroupEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_JOINED');
  static const GroupEventType GROUP_LEFT = GroupEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_LEFT');

  static const $core.List<GroupEventType> values = <GroupEventType> [
    NONE,
    GROUP_JOINED,
    GROUP_LEFT,
  ];

  static final $core.Map<$core.int, GroupEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupEventType? valueOf($core.int value) => _byValue[value];

  const GroupEventType._($core.int v, $core.String n) : super(v, n);
}


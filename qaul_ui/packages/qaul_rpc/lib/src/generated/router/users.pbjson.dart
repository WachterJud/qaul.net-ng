///
//  Generated code. Do not modify.
//  source: router/users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use connectivityDescriptor instead')
const Connectivity$json = const {
  '1': 'Connectivity',
  '2': const [
    const {'1': 'Online', '2': 0},
    const {'1': 'Reachable', '2': 1},
    const {'1': 'Offline', '2': 2},
  ],
};

/// Descriptor for `Connectivity`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List connectivityDescriptor = $convert.base64Decode('CgxDb25uZWN0aXZpdHkSCgoGT25saW5lEAASDQoJUmVhY2hhYmxlEAESCwoHT2ZmbGluZRAC');
@$core.Deprecated('Use usersDescriptor instead')
const Users$json = const {
  '1': 'Users',
  '2': const [
    const {'1': 'user_request', '3': 1, '4': 1, '5': 11, '6': '.qaul.rpc.users.UserRequest', '9': 0, '10': 'userRequest'},
    const {'1': 'user_online_request', '3': 2, '4': 1, '5': 11, '6': '.qaul.rpc.users.UserOnlineRequest', '9': 0, '10': 'userOnlineRequest'},
    const {'1': 'user_list', '3': 3, '4': 1, '5': 11, '6': '.qaul.rpc.users.UserList', '9': 0, '10': 'userList'},
    const {'1': 'user_update', '3': 4, '4': 1, '5': 11, '6': '.qaul.rpc.users.UserEntry', '9': 0, '10': 'userUpdate'},
  ],
  '8': const [
    const {'1': 'message'},
  ],
};

/// Descriptor for `Users`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersDescriptor = $convert.base64Decode('CgVVc2VycxJACgx1c2VyX3JlcXVlc3QYASABKAsyGy5xYXVsLnJwYy51c2Vycy5Vc2VyUmVxdWVzdEgAUgt1c2VyUmVxdWVzdBJTChN1c2VyX29ubGluZV9yZXF1ZXN0GAIgASgLMiEucWF1bC5ycGMudXNlcnMuVXNlck9ubGluZVJlcXVlc3RIAFIRdXNlck9ubGluZVJlcXVlc3QSNwoJdXNlcl9saXN0GAMgASgLMhgucWF1bC5ycGMudXNlcnMuVXNlckxpc3RIAFIIdXNlckxpc3QSPAoLdXNlcl91cGRhdGUYBCABKAsyGS5xYXVsLnJwYy51c2Vycy5Vc2VyRW50cnlIAFIKdXNlclVwZGF0ZUIJCgdtZXNzYWdl');
@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = const {
  '1': 'UserRequest',
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode('CgtVc2VyUmVxdWVzdA==');
@$core.Deprecated('Use userOnlineRequestDescriptor instead')
const UserOnlineRequest$json = const {
  '1': 'UserOnlineRequest',
};

/// Descriptor for `UserOnlineRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userOnlineRequestDescriptor = $convert.base64Decode('ChFVc2VyT25saW5lUmVxdWVzdA==');
@$core.Deprecated('Use userListDescriptor instead')
const UserList$json = const {
  '1': 'UserList',
  '2': const [
    const {'1': 'user', '3': 1, '4': 3, '5': 11, '6': '.qaul.rpc.users.UserEntry', '10': 'user'},
  ],
};

/// Descriptor for `UserList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListDescriptor = $convert.base64Decode('CghVc2VyTGlzdBItCgR1c2VyGAEgAygLMhkucWF1bC5ycGMudXNlcnMuVXNlckVudHJ5UgR1c2Vy');
@$core.Deprecated('Use userEntryDescriptor instead')
const UserEntry$json = const {
  '1': 'UserEntry',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 12, '10': 'id'},
    const {'1': 'conversation_id', '3': 3, '4': 1, '5': 12, '10': 'conversationId'},
    const {'1': 'key_base58', '3': 7, '4': 1, '5': 9, '10': 'keyBase58'},
    const {'1': 'connectivity', '3': 8, '4': 1, '5': 14, '6': '.qaul.rpc.users.Connectivity', '10': 'connectivity'},
    const {'1': 'verified', '3': 9, '4': 1, '5': 8, '10': 'verified'},
    const {'1': 'blocked', '3': 10, '4': 1, '5': 8, '10': 'blocked'},
  ],
};

/// Descriptor for `UserEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userEntryDescriptor = $convert.base64Decode('CglVc2VyRW50cnkSEgoEbmFtZRgBIAEoCVIEbmFtZRIOCgJpZBgCIAEoDFICaWQSJwoPY29udmVyc2F0aW9uX2lkGAMgASgMUg5jb252ZXJzYXRpb25JZBIdCgprZXlfYmFzZTU4GAcgASgJUglrZXlCYXNlNTgSQAoMY29ubmVjdGl2aXR5GAggASgOMhwucWF1bC5ycGMudXNlcnMuQ29ubmVjdGl2aXR5Ugxjb25uZWN0aXZpdHkSGgoIdmVyaWZpZWQYCSABKAhSCHZlcmlmaWVkEhgKB2Jsb2NrZWQYCiABKAhSB2Jsb2NrZWQ=');

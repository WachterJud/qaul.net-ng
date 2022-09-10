///
//  Generated code. Do not modify.
//  source: router/users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'users.pbenum.dart';

export 'users.pbenum.dart';

enum Users_Message {
  userRequest, 
  userOnlineRequest, 
  userList, 
  userUpdate, 
  notSet
}

class Users extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Users_Message> _Users_MessageByTag = {
    1 : Users_Message.userRequest,
    2 : Users_Message.userOnlineRequest,
    3 : Users_Message.userList,
    4 : Users_Message.userUpdate,
    0 : Users_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Users', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'qaul.rpc.users'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<UserRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userRequest', subBuilder: UserRequest.create)
    ..aOM<UserOnlineRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userOnlineRequest', subBuilder: UserOnlineRequest.create)
    ..aOM<UserList>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userList', subBuilder: UserList.create)
    ..aOM<UserEntry>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userUpdate', subBuilder: UserEntry.create)
    ..hasRequiredFields = false
  ;

  Users._() : super();
  factory Users({
    UserRequest? userRequest,
    UserOnlineRequest? userOnlineRequest,
    UserList? userList,
    UserEntry? userUpdate,
  }) {
    final _result = create();
    if (userRequest != null) {
      _result.userRequest = userRequest;
    }
    if (userOnlineRequest != null) {
      _result.userOnlineRequest = userOnlineRequest;
    }
    if (userList != null) {
      _result.userList = userList;
    }
    if (userUpdate != null) {
      _result.userUpdate = userUpdate;
    }
    return _result;
  }
  factory Users.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Users.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Users clone() => Users()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Users copyWith(void Function(Users) updates) => super.copyWith((message) => updates(message as Users)) as Users; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Users create() => Users._();
  Users createEmptyInstance() => create();
  static $pb.PbList<Users> createRepeated() => $pb.PbList<Users>();
  @$core.pragma('dart2js:noInline')
  static Users getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Users>(create);
  static Users? _defaultInstance;

  Users_Message whichMessage() => _Users_MessageByTag[$_whichOneof(0)]!;
  void clearMessage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UserRequest get userRequest => $_getN(0);
  @$pb.TagNumber(1)
  set userRequest(UserRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserRequest() => clearField(1);
  @$pb.TagNumber(1)
  UserRequest ensureUserRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  UserOnlineRequest get userOnlineRequest => $_getN(1);
  @$pb.TagNumber(2)
  set userOnlineRequest(UserOnlineRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserOnlineRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserOnlineRequest() => clearField(2);
  @$pb.TagNumber(2)
  UserOnlineRequest ensureUserOnlineRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  UserList get userList => $_getN(2);
  @$pb.TagNumber(3)
  set userList(UserList v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserList() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserList() => clearField(3);
  @$pb.TagNumber(3)
  UserList ensureUserList() => $_ensure(2);

  @$pb.TagNumber(4)
  UserEntry get userUpdate => $_getN(3);
  @$pb.TagNumber(4)
  set userUpdate(UserEntry v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserUpdate() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserUpdate() => clearField(4);
  @$pb.TagNumber(4)
  UserEntry ensureUserUpdate() => $_ensure(3);
}

class UserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'qaul.rpc.users'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UserRequest._() : super();
  factory UserRequest() => create();
  factory UserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserRequest clone() => UserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserRequest copyWith(void Function(UserRequest) updates) => super.copyWith((message) => updates(message as UserRequest)) as UserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRequest create() => UserRequest._();
  UserRequest createEmptyInstance() => create();
  static $pb.PbList<UserRequest> createRepeated() => $pb.PbList<UserRequest>();
  @$core.pragma('dart2js:noInline')
  static UserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserRequest>(create);
  static UserRequest? _defaultInstance;
}

class UserOnlineRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserOnlineRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'qaul.rpc.users'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UserOnlineRequest._() : super();
  factory UserOnlineRequest() => create();
  factory UserOnlineRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOnlineRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOnlineRequest clone() => UserOnlineRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOnlineRequest copyWith(void Function(UserOnlineRequest) updates) => super.copyWith((message) => updates(message as UserOnlineRequest)) as UserOnlineRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserOnlineRequest create() => UserOnlineRequest._();
  UserOnlineRequest createEmptyInstance() => create();
  static $pb.PbList<UserOnlineRequest> createRepeated() => $pb.PbList<UserOnlineRequest>();
  @$core.pragma('dart2js:noInline')
  static UserOnlineRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOnlineRequest>(create);
  static UserOnlineRequest? _defaultInstance;
}

class UserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'qaul.rpc.users'), createEmptyInstance: create)
    ..pc<UserEntry>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', $pb.PbFieldType.PM, subBuilder: UserEntry.create)
    ..hasRequiredFields = false
  ;

  UserList._() : super();
  factory UserList({
    $core.Iterable<UserEntry>? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory UserList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserList clone() => UserList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserList copyWith(void Function(UserList) updates) => super.copyWith((message) => updates(message as UserList)) as UserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserEntry> get user => $_getList(0);
}

class UserEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'qaul.rpc.users'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', $pb.PbFieldType.OY)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keyBase58')
    ..e<Connectivity>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectivity', $pb.PbFieldType.OE, defaultOrMaker: Connectivity.Online, valueOf: Connectivity.valueOf, enumValues: Connectivity.values)
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verified')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blocked')
    ..hasRequiredFields = false
  ;

  UserEntry._() : super();
  factory UserEntry({
    $core.String? name,
    $core.List<$core.int>? id,
    $core.List<$core.int>? groupId,
    $core.String? keyBase58,
    Connectivity? connectivity,
    $core.bool? verified,
    $core.bool? blocked,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (keyBase58 != null) {
      _result.keyBase58 = keyBase58;
    }
    if (connectivity != null) {
      _result.connectivity = connectivity;
    }
    if (verified != null) {
      _result.verified = verified;
    }
    if (blocked != null) {
      _result.blocked = blocked;
    }
    return _result;
  }
  factory UserEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserEntry clone() => UserEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserEntry copyWith(void Function(UserEntry) updates) => super.copyWith((message) => updates(message as UserEntry)) as UserEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserEntry create() => UserEntry._();
  UserEntry createEmptyInstance() => create();
  static $pb.PbList<UserEntry> createRepeated() => $pb.PbList<UserEntry>();
  @$core.pragma('dart2js:noInline')
  static UserEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserEntry>(create);
  static UserEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get groupId => $_getN(2);
  @$pb.TagNumber(3)
  set groupId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => clearField(3);

  @$pb.TagNumber(7)
  $core.String get keyBase58 => $_getSZ(3);
  @$pb.TagNumber(7)
  set keyBase58($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(7)
  $core.bool hasKeyBase58() => $_has(3);
  @$pb.TagNumber(7)
  void clearKeyBase58() => clearField(7);

  @$pb.TagNumber(8)
  Connectivity get connectivity => $_getN(4);
  @$pb.TagNumber(8)
  set connectivity(Connectivity v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasConnectivity() => $_has(4);
  @$pb.TagNumber(8)
  void clearConnectivity() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get verified => $_getBF(5);
  @$pb.TagNumber(9)
  set verified($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasVerified() => $_has(5);
  @$pb.TagNumber(9)
  void clearVerified() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get blocked => $_getBF(6);
  @$pb.TagNumber(10)
  set blocked($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasBlocked() => $_has(6);
  @$pb.TagNumber(10)
  void clearBlocked() => clearField(10);
}


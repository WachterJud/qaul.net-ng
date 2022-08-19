// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: router/router_net_info.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// RouterInfoModule
enum Qaul_Net_RouterNetInfo_RouterInfoModule: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// Message is a common RouterInfoMessage
  case routerInfo // = 0

  /// Message is a FeedRequestMessage
  case feedRequest // = 1

  /// Message is a FeedResponseMessage
  case feedResponse // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .routerInfo
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .routerInfo
    case 1: self = .feedRequest
    case 2: self = .feedResponse
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .routerInfo: return 0
    case .feedRequest: return 1
    case .feedResponse: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Qaul_Net_RouterNetInfo_RouterInfoModule: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Qaul_Net_RouterNetInfo_RouterInfoModule] = [
    .routerInfo,
    .feedRequest,
    .feedResponse,
  ]
}

#endif  // swift(>=4.2)

/// Router information Container
struct Qaul_Net_RouterNetInfo_RouterInfoContainer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// signature
  var signature: Data = Data()

  /// message content
  var message: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Router information content
struct Qaul_Net_RouterNetInfo_RouterInfoContent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// node id
  var id: Data = Data()

  /// RouterInfo Module
  var routerInfoModule: Qaul_Net_RouterNetInfo_RouterInfoModule = .routerInfo

  /// message content
  var content: Data = Data()

  /// timestamp in milli seconds
  var time: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Router information message
struct Qaul_Net_RouterNetInfo_RouterInfoMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// node id
  var node: Data = Data()

  /// Routing information table
  var routes: Qaul_Net_RouterNetInfo_RoutingInfoTable {
    get {return _routes ?? Qaul_Net_RouterNetInfo_RoutingInfoTable()}
    set {_routes = newValue}
  }
  /// Returns true if `routes` has been explicitly set.
  var hasRoutes: Bool {return self._routes != nil}
  /// Clears the value of `routes`. Subsequent reads from it will return its default value.
  mutating func clearRoutes() {self._routes = nil}

  /// Users information table
  var users: Qaul_Net_RouterNetInfo_UserInfoTable {
    get {return _users ?? Qaul_Net_RouterNetInfo_UserInfoTable()}
    set {_users = newValue}
  }
  /// Returns true if `users` has been explicitly set.
  var hasUsers: Bool {return self._users != nil}
  /// Clears the value of `users`. Subsequent reads from it will return its default value.
  mutating func clearUsers() {self._users = nil}

  /// Latest Feed ids table
  var feeds: Qaul_Net_RouterNetInfo_FeedIdsTable {
    get {return _feeds ?? Qaul_Net_RouterNetInfo_FeedIdsTable()}
    set {_feeds = newValue}
  }
  /// Returns true if `feeds` has been explicitly set.
  var hasFeeds: Bool {return self._feeds != nil}
  /// Clears the value of `feeds`. Subsequent reads from it will return its default value.
  mutating func clearFeeds() {self._feeds = nil}

  /// timestamp
  var timestamp: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _routes: Qaul_Net_RouterNetInfo_RoutingInfoTable? = nil
  fileprivate var _users: Qaul_Net_RouterNetInfo_UserInfoTable? = nil
  fileprivate var _feeds: Qaul_Net_RouterNetInfo_FeedIdsTable? = nil
}

/// Routing information to send to neighbours
struct Qaul_Net_RouterNetInfo_RoutingInfoTable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var entry: [Qaul_Net_RouterNetInfo_RoutingInfoEntry] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Routing structures to send over the network
struct Qaul_Net_RouterNetInfo_RoutingInfoEntry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// user id
  var user: Data = Data()

  /// round trip time
  var rtt: UInt32 = 0

  /// hop count
  var hc: Data = Data()

  /// propagation id
  var pgid: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// User information table
struct Qaul_Net_RouterNetInfo_UserInfoTable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// user info
  var info: [Qaul_Net_RouterNetInfo_UserInfo] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// User info structure for sending to the neighbours
struct Qaul_Net_RouterNetInfo_UserInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// user id
  var id: Data = Data()

  /// public key of the user
  var key: Data = Data()

  /// user name
  var name: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// List of feed ID's
struct Qaul_Net_RouterNetInfo_FeedIdsTable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// feed id
  var ids: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Feed request message
struct Qaul_Net_RouterNetInfo_FeedRequestMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Feed ids table
  var feeds: Qaul_Net_RouterNetInfo_FeedIdsTable {
    get {return _feeds ?? Qaul_Net_RouterNetInfo_FeedIdsTable()}
    set {_feeds = newValue}
  }
  /// Returns true if `feeds` has been explicitly set.
  var hasFeeds: Bool {return self._feeds != nil}
  /// Clears the value of `feeds`. Subsequent reads from it will return its default value.
  mutating func clearFeeds() {self._feeds = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _feeds: Qaul_Net_RouterNetInfo_FeedIdsTable? = nil
}

/// Feed response message
struct Qaul_Net_RouterNetInfo_FeedResponseMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Feed table
  var feeds: Qaul_Net_RouterNetInfo_FeedResponseTable {
    get {return _feeds ?? Qaul_Net_RouterNetInfo_FeedResponseTable()}
    set {_feeds = newValue}
  }
  /// Returns true if `feeds` has been explicitly set.
  var hasFeeds: Bool {return self._feeds != nil}
  /// Clears the value of `feeds`. Subsequent reads from it will return its default value.
  mutating func clearFeeds() {self._feeds = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _feeds: Qaul_Net_RouterNetInfo_FeedResponseTable? = nil
}

/// Feed response table
/// containing the feed messages for response
struct Qaul_Net_RouterNetInfo_FeedResponseTable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// feed messages
  var messages: [Qaul_Net_RouterNetInfo_FeedMessage] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Feed Message
struct Qaul_Net_RouterNetInfo_FeedMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// message id
  var messageID: Data = Data()

  /// sender id
  var senderID: Data = Data()

  /// message content
  var content: String = String()

  /// timestamp in milli seconds
  var time: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "qaul.net.router_net_info"

extension Qaul_Net_RouterNetInfo_RouterInfoModule: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ROUTER_INFO"),
    1: .same(proto: "FEED_REQUEST"),
    2: .same(proto: "FEED_RESPONSE"),
  ]
}

extension Qaul_Net_RouterNetInfo_RouterInfoContainer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RouterInfoContainer"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "signature"),
    2: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.signature) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.message) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 1)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularBytesField(value: self.message, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_RouterInfoContainer, rhs: Qaul_Net_RouterNetInfo_RouterInfoContainer) -> Bool {
    if lhs.signature != rhs.signature {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_RouterInfoContent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RouterInfoContent"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "routerInfoModule"),
    3: .same(proto: "content"),
    4: .same(proto: "time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.routerInfoModule) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.content) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.time) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularBytesField(value: self.id, fieldNumber: 1)
    }
    if self.routerInfoModule != .routerInfo {
      try visitor.visitSingularEnumField(value: self.routerInfoModule, fieldNumber: 2)
    }
    if !self.content.isEmpty {
      try visitor.visitSingularBytesField(value: self.content, fieldNumber: 3)
    }
    if self.time != 0 {
      try visitor.visitSingularUInt64Field(value: self.time, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_RouterInfoContent, rhs: Qaul_Net_RouterNetInfo_RouterInfoContent) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.routerInfoModule != rhs.routerInfoModule {return false}
    if lhs.content != rhs.content {return false}
    if lhs.time != rhs.time {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_RouterInfoMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RouterInfoMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "node"),
    2: .same(proto: "routes"),
    3: .same(proto: "users"),
    4: .same(proto: "feeds"),
    5: .same(proto: "timestamp"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.node) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._routes) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._users) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._feeds) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.timestamp) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.node.isEmpty {
      try visitor.visitSingularBytesField(value: self.node, fieldNumber: 1)
    }
    try { if let v = self._routes {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._users {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._feeds {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    if self.timestamp != 0 {
      try visitor.visitSingularUInt64Field(value: self.timestamp, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_RouterInfoMessage, rhs: Qaul_Net_RouterNetInfo_RouterInfoMessage) -> Bool {
    if lhs.node != rhs.node {return false}
    if lhs._routes != rhs._routes {return false}
    if lhs._users != rhs._users {return false}
    if lhs._feeds != rhs._feeds {return false}
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_RoutingInfoTable: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RoutingInfoTable"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "entry"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.entry) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.entry.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.entry, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_RoutingInfoTable, rhs: Qaul_Net_RouterNetInfo_RoutingInfoTable) -> Bool {
    if lhs.entry != rhs.entry {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_RoutingInfoEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RoutingInfoEntry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "rtt"),
    3: .same(proto: "hc"),
    5: .same(proto: "pgid"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.user) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.rtt) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.hc) }()
      case 5: try { try decoder.decodeSingularUInt32Field(value: &self.pgid) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularBytesField(value: self.user, fieldNumber: 1)
    }
    if self.rtt != 0 {
      try visitor.visitSingularUInt32Field(value: self.rtt, fieldNumber: 2)
    }
    if !self.hc.isEmpty {
      try visitor.visitSingularBytesField(value: self.hc, fieldNumber: 3)
    }
    if self.pgid != 0 {
      try visitor.visitSingularUInt32Field(value: self.pgid, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_RoutingInfoEntry, rhs: Qaul_Net_RouterNetInfo_RoutingInfoEntry) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs.rtt != rhs.rtt {return false}
    if lhs.hc != rhs.hc {return false}
    if lhs.pgid != rhs.pgid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_UserInfoTable: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserInfoTable"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "info"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.info) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.info.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.info, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_UserInfoTable, rhs: Qaul_Net_RouterNetInfo_UserInfoTable) -> Bool {
    if lhs.info != rhs.info {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_UserInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "key"),
    3: .same(proto: "name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.key) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularBytesField(value: self.id, fieldNumber: 1)
    }
    if !self.key.isEmpty {
      try visitor.visitSingularBytesField(value: self.key, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_UserInfo, rhs: Qaul_Net_RouterNetInfo_UserInfo) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.key != rhs.key {return false}
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_FeedIdsTable: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedIdsTable"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedBytesField(value: &self.ids) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.ids.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.ids, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_FeedIdsTable, rhs: Qaul_Net_RouterNetInfo_FeedIdsTable) -> Bool {
    if lhs.ids != rhs.ids {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_FeedRequestMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedRequestMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "feeds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._feeds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._feeds {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_FeedRequestMessage, rhs: Qaul_Net_RouterNetInfo_FeedRequestMessage) -> Bool {
    if lhs._feeds != rhs._feeds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_FeedResponseMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedResponseMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "feeds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._feeds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._feeds {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_FeedResponseMessage, rhs: Qaul_Net_RouterNetInfo_FeedResponseMessage) -> Bool {
    if lhs._feeds != rhs._feeds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_FeedResponseTable: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedResponseTable"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messages"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.messages) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.messages.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.messages, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_FeedResponseTable, rhs: Qaul_Net_RouterNetInfo_FeedResponseTable) -> Bool {
    if lhs.messages != rhs.messages {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Qaul_Net_RouterNetInfo_FeedMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "message_id"),
    2: .standard(proto: "sender_id"),
    3: .same(proto: "content"),
    4: .same(proto: "time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.messageID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.senderID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.content) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.time) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.messageID.isEmpty {
      try visitor.visitSingularBytesField(value: self.messageID, fieldNumber: 1)
    }
    if !self.senderID.isEmpty {
      try visitor.visitSingularBytesField(value: self.senderID, fieldNumber: 2)
    }
    if !self.content.isEmpty {
      try visitor.visitSingularStringField(value: self.content, fieldNumber: 3)
    }
    if self.time != 0 {
      try visitor.visitSingularUInt64Field(value: self.time, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Qaul_Net_RouterNetInfo_FeedMessage, rhs: Qaul_Net_RouterNetInfo_FeedMessage) -> Bool {
    if lhs.messageID != rhs.messageID {return false}
    if lhs.senderID != rhs.senderID {return false}
    if lhs.content != rhs.content {return false}
    if lhs.time != rhs.time {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

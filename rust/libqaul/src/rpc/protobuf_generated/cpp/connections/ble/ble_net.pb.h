// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: connections/ble/ble_net.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_connections_2fble_2fble_5fnet_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_connections_2fble_2fble_5fnet_2eproto

#include <limits>
#include <string>

#include <google/protobuf/port_def.inc>
#if PROTOBUF_VERSION < 3020000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers. Please update
#error your headers.
#endif
#if 3020001 < PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers. Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/port_undef.inc>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/metadata_lite.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/unknown_field_set.h>
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_connections_2fble_2fble_5fnet_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_connections_2fble_2fble_5fnet_2eproto {
  static const uint32_t offsets[];
};
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_connections_2fble_2fble_5fnet_2eproto;
namespace qaul {
namespace net {
namespace ble {
class BleMessage;
struct BleMessageDefaultTypeInternal;
extern BleMessageDefaultTypeInternal _BleMessage_default_instance_;
class Identification;
struct IdentificationDefaultTypeInternal;
extern IdentificationDefaultTypeInternal _Identification_default_instance_;
class NodeIdentification;
struct NodeIdentificationDefaultTypeInternal;
extern NodeIdentificationDefaultTypeInternal _NodeIdentification_default_instance_;
}  // namespace ble
}  // namespace net
}  // namespace qaul
PROTOBUF_NAMESPACE_OPEN
template<> ::qaul::net::ble::BleMessage* Arena::CreateMaybeMessage<::qaul::net::ble::BleMessage>(Arena*);
template<> ::qaul::net::ble::Identification* Arena::CreateMaybeMessage<::qaul::net::ble::Identification>(Arena*);
template<> ::qaul::net::ble::NodeIdentification* Arena::CreateMaybeMessage<::qaul::net::ble::NodeIdentification>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace qaul {
namespace net {
namespace ble {

// ===================================================================

class BleMessage final :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:qaul.net.ble.BleMessage) */ {
 public:
  inline BleMessage() : BleMessage(nullptr) {}
  ~BleMessage() override;
  explicit PROTOBUF_CONSTEXPR BleMessage(::PROTOBUF_NAMESPACE_ID::internal::ConstantInitialized);

  BleMessage(const BleMessage& from);
  BleMessage(BleMessage&& from) noexcept
    : BleMessage() {
    *this = ::std::move(from);
  }

  inline BleMessage& operator=(const BleMessage& from) {
    CopyFrom(from);
    return *this;
  }
  inline BleMessage& operator=(BleMessage&& from) noexcept {
    if (this == &from) return *this;
    if (GetOwningArena() == from.GetOwningArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetOwningArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::PROTOBUF_NAMESPACE_ID::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const BleMessage& default_instance() {
    return *internal_default_instance();
  }
  enum MessageCase {
    kInfo = 1,
    kFeed = 2,
    kMessaging = 3,
    kIdentification = 4,
    MESSAGE_NOT_SET = 0,
  };

  static inline const BleMessage* internal_default_instance() {
    return reinterpret_cast<const BleMessage*>(
               &_BleMessage_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(BleMessage& a, BleMessage& b) {
    a.Swap(&b);
  }
  inline void Swap(BleMessage* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() != nullptr &&
        GetOwningArena() == other->GetOwningArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() == other->GetOwningArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(BleMessage* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetOwningArena() == other->GetOwningArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  BleMessage* New(::PROTOBUF_NAMESPACE_ID::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<BleMessage>(arena);
  }
  using ::PROTOBUF_NAMESPACE_ID::Message::CopyFrom;
  void CopyFrom(const BleMessage& from);
  using ::PROTOBUF_NAMESPACE_ID::Message::MergeFrom;
  void MergeFrom(const BleMessage& from);
  private:
  static void MergeImpl(::PROTOBUF_NAMESPACE_ID::Message* to, const ::PROTOBUF_NAMESPACE_ID::Message& from);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  uint8_t* _InternalSerialize(
      uint8_t* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(BleMessage* other);

  private:
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "qaul.net.ble.BleMessage";
  }
  protected:
  explicit BleMessage(::PROTOBUF_NAMESPACE_ID::Arena* arena,
                       bool is_message_owned = false);
  public:

  static const ClassData _class_data_;
  const ::PROTOBUF_NAMESPACE_ID::Message::ClassData*GetClassData() const final;

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kInfoFieldNumber = 1,
    kFeedFieldNumber = 2,
    kMessagingFieldNumber = 3,
    kIdentificationFieldNumber = 4,
  };
  // bytes info = 1;
  bool has_info() const;
  private:
  bool _internal_has_info() const;
  public:
  void clear_info();
  const std::string& info() const;
  template <typename ArgT0 = const std::string&, typename... ArgT>
  void set_info(ArgT0&& arg0, ArgT... args);
  std::string* mutable_info();
  PROTOBUF_NODISCARD std::string* release_info();
  void set_allocated_info(std::string* info);
  private:
  const std::string& _internal_info() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_info(const std::string& value);
  std::string* _internal_mutable_info();
  public:

  // bytes feed = 2;
  bool has_feed() const;
  private:
  bool _internal_has_feed() const;
  public:
  void clear_feed();
  const std::string& feed() const;
  template <typename ArgT0 = const std::string&, typename... ArgT>
  void set_feed(ArgT0&& arg0, ArgT... args);
  std::string* mutable_feed();
  PROTOBUF_NODISCARD std::string* release_feed();
  void set_allocated_feed(std::string* feed);
  private:
  const std::string& _internal_feed() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_feed(const std::string& value);
  std::string* _internal_mutable_feed();
  public:

  // bytes messaging = 3;
  bool has_messaging() const;
  private:
  bool _internal_has_messaging() const;
  public:
  void clear_messaging();
  const std::string& messaging() const;
  template <typename ArgT0 = const std::string&, typename... ArgT>
  void set_messaging(ArgT0&& arg0, ArgT... args);
  std::string* mutable_messaging();
  PROTOBUF_NODISCARD std::string* release_messaging();
  void set_allocated_messaging(std::string* messaging);
  private:
  const std::string& _internal_messaging() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_messaging(const std::string& value);
  std::string* _internal_mutable_messaging();
  public:

  // .qaul.net.ble.Identification identification = 4;
  bool has_identification() const;
  private:
  bool _internal_has_identification() const;
  public:
  void clear_identification();
  const ::qaul::net::ble::Identification& identification() const;
  PROTOBUF_NODISCARD ::qaul::net::ble::Identification* release_identification();
  ::qaul::net::ble::Identification* mutable_identification();
  void set_allocated_identification(::qaul::net::ble::Identification* identification);
  private:
  const ::qaul::net::ble::Identification& _internal_identification() const;
  ::qaul::net::ble::Identification* _internal_mutable_identification();
  public:
  void unsafe_arena_set_allocated_identification(
      ::qaul::net::ble::Identification* identification);
  ::qaul::net::ble::Identification* unsafe_arena_release_identification();

  void clear_message();
  MessageCase message_case() const;
  // @@protoc_insertion_point(class_scope:qaul.net.ble.BleMessage)
 private:
  class _Internal;
  void set_has_info();
  void set_has_feed();
  void set_has_messaging();
  void set_has_identification();

  inline bool has_message() const;
  inline void clear_has_message();

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  union MessageUnion {
    constexpr MessageUnion() : _constinit_{} {}
      ::PROTOBUF_NAMESPACE_ID::internal::ConstantInitialized _constinit_;
    ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr info_;
    ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr feed_;
    ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr messaging_;
    ::qaul::net::ble::Identification* identification_;
  } message_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  uint32_t _oneof_case_[1];

  friend struct ::TableStruct_connections_2fble_2fble_5fnet_2eproto;
};
// -------------------------------------------------------------------

class Identification final :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:qaul.net.ble.Identification) */ {
 public:
  inline Identification() : Identification(nullptr) {}
  ~Identification() override;
  explicit PROTOBUF_CONSTEXPR Identification(::PROTOBUF_NAMESPACE_ID::internal::ConstantInitialized);

  Identification(const Identification& from);
  Identification(Identification&& from) noexcept
    : Identification() {
    *this = ::std::move(from);
  }

  inline Identification& operator=(const Identification& from) {
    CopyFrom(from);
    return *this;
  }
  inline Identification& operator=(Identification&& from) noexcept {
    if (this == &from) return *this;
    if (GetOwningArena() == from.GetOwningArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetOwningArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::PROTOBUF_NAMESPACE_ID::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const Identification& default_instance() {
    return *internal_default_instance();
  }
  static inline const Identification* internal_default_instance() {
    return reinterpret_cast<const Identification*>(
               &_Identification_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    1;

  friend void swap(Identification& a, Identification& b) {
    a.Swap(&b);
  }
  inline void Swap(Identification* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() != nullptr &&
        GetOwningArena() == other->GetOwningArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() == other->GetOwningArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(Identification* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetOwningArena() == other->GetOwningArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  Identification* New(::PROTOBUF_NAMESPACE_ID::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<Identification>(arena);
  }
  using ::PROTOBUF_NAMESPACE_ID::Message::CopyFrom;
  void CopyFrom(const Identification& from);
  using ::PROTOBUF_NAMESPACE_ID::Message::MergeFrom;
  void MergeFrom(const Identification& from);
  private:
  static void MergeImpl(::PROTOBUF_NAMESPACE_ID::Message* to, const ::PROTOBUF_NAMESPACE_ID::Message& from);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  uint8_t* _InternalSerialize(
      uint8_t* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(Identification* other);

  private:
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "qaul.net.ble.Identification";
  }
  protected:
  explicit Identification(::PROTOBUF_NAMESPACE_ID::Arena* arena,
                       bool is_message_owned = false);
  public:

  static const ClassData _class_data_;
  const ::PROTOBUF_NAMESPACE_ID::Message::ClassData*GetClassData() const final;

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kNodeFieldNumber = 2,
    kRequestFieldNumber = 1,
  };
  // .qaul.net.ble.NodeIdentification node = 2;
  bool has_node() const;
  private:
  bool _internal_has_node() const;
  public:
  void clear_node();
  const ::qaul::net::ble::NodeIdentification& node() const;
  PROTOBUF_NODISCARD ::qaul::net::ble::NodeIdentification* release_node();
  ::qaul::net::ble::NodeIdentification* mutable_node();
  void set_allocated_node(::qaul::net::ble::NodeIdentification* node);
  private:
  const ::qaul::net::ble::NodeIdentification& _internal_node() const;
  ::qaul::net::ble::NodeIdentification* _internal_mutable_node();
  public:
  void unsafe_arena_set_allocated_node(
      ::qaul::net::ble::NodeIdentification* node);
  ::qaul::net::ble::NodeIdentification* unsafe_arena_release_node();

  // bool request = 1;
  void clear_request();
  bool request() const;
  void set_request(bool value);
  private:
  bool _internal_request() const;
  void _internal_set_request(bool value);
  public:

  // @@protoc_insertion_point(class_scope:qaul.net.ble.Identification)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::qaul::net::ble::NodeIdentification* node_;
  bool request_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_connections_2fble_2fble_5fnet_2eproto;
};
// -------------------------------------------------------------------

class NodeIdentification final :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:qaul.net.ble.NodeIdentification) */ {
 public:
  inline NodeIdentification() : NodeIdentification(nullptr) {}
  ~NodeIdentification() override;
  explicit PROTOBUF_CONSTEXPR NodeIdentification(::PROTOBUF_NAMESPACE_ID::internal::ConstantInitialized);

  NodeIdentification(const NodeIdentification& from);
  NodeIdentification(NodeIdentification&& from) noexcept
    : NodeIdentification() {
    *this = ::std::move(from);
  }

  inline NodeIdentification& operator=(const NodeIdentification& from) {
    CopyFrom(from);
    return *this;
  }
  inline NodeIdentification& operator=(NodeIdentification&& from) noexcept {
    if (this == &from) return *this;
    if (GetOwningArena() == from.GetOwningArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetOwningArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::PROTOBUF_NAMESPACE_ID::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const NodeIdentification& default_instance() {
    return *internal_default_instance();
  }
  static inline const NodeIdentification* internal_default_instance() {
    return reinterpret_cast<const NodeIdentification*>(
               &_NodeIdentification_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    2;

  friend void swap(NodeIdentification& a, NodeIdentification& b) {
    a.Swap(&b);
  }
  inline void Swap(NodeIdentification* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() != nullptr &&
        GetOwningArena() == other->GetOwningArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() == other->GetOwningArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(NodeIdentification* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetOwningArena() == other->GetOwningArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  NodeIdentification* New(::PROTOBUF_NAMESPACE_ID::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<NodeIdentification>(arena);
  }
  using ::PROTOBUF_NAMESPACE_ID::Message::CopyFrom;
  void CopyFrom(const NodeIdentification& from);
  using ::PROTOBUF_NAMESPACE_ID::Message::MergeFrom;
  void MergeFrom(const NodeIdentification& from);
  private:
  static void MergeImpl(::PROTOBUF_NAMESPACE_ID::Message* to, const ::PROTOBUF_NAMESPACE_ID::Message& from);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  uint8_t* _InternalSerialize(
      uint8_t* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const final { return _cached_size_.Get(); }

  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(NodeIdentification* other);

  private:
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "qaul.net.ble.NodeIdentification";
  }
  protected:
  explicit NodeIdentification(::PROTOBUF_NAMESPACE_ID::Arena* arena,
                       bool is_message_owned = false);
  public:

  static const ClassData _class_data_;
  const ::PROTOBUF_NAMESPACE_ID::Message::ClassData*GetClassData() const final;

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kIdFieldNumber = 1,
  };
  // bytes id = 1;
  void clear_id();
  const std::string& id() const;
  template <typename ArgT0 = const std::string&, typename... ArgT>
  void set_id(ArgT0&& arg0, ArgT... args);
  std::string* mutable_id();
  PROTOBUF_NODISCARD std::string* release_id();
  void set_allocated_id(std::string* id);
  private:
  const std::string& _internal_id() const;
  inline PROTOBUF_ALWAYS_INLINE void _internal_set_id(const std::string& value);
  std::string* _internal_mutable_id();
  public:

  // @@protoc_insertion_point(class_scope:qaul.net.ble.NodeIdentification)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  ::PROTOBUF_NAMESPACE_ID::internal::ArenaStringPtr id_;
  mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
  friend struct ::TableStruct_connections_2fble_2fble_5fnet_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// BleMessage

// bytes info = 1;
inline bool BleMessage::_internal_has_info() const {
  return message_case() == kInfo;
}
inline bool BleMessage::has_info() const {
  return _internal_has_info();
}
inline void BleMessage::set_has_info() {
  _oneof_case_[0] = kInfo;
}
inline void BleMessage::clear_info() {
  if (_internal_has_info()) {
    message_.info_.Destroy();
    clear_has_message();
  }
}
inline const std::string& BleMessage::info() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.BleMessage.info)
  return _internal_info();
}
template <typename ArgT0, typename... ArgT>
inline void BleMessage::set_info(ArgT0&& arg0, ArgT... args) {
  if (!_internal_has_info()) {
    clear_message();
    set_has_info();
    message_.info_.InitDefault();
  }
  message_.info_.SetBytes( static_cast<ArgT0 &&>(arg0), args..., GetArenaForAllocation());
  // @@protoc_insertion_point(field_set:qaul.net.ble.BleMessage.info)
}
inline std::string* BleMessage::mutable_info() {
  std::string* _s = _internal_mutable_info();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.BleMessage.info)
  return _s;
}
inline const std::string& BleMessage::_internal_info() const {
  if (_internal_has_info()) {
    return message_.info_.Get();
  }
  return ::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited();
}
inline void BleMessage::_internal_set_info(const std::string& value) {
  if (!_internal_has_info()) {
    clear_message();
    set_has_info();
    message_.info_.InitDefault();
  }
  message_.info_.Set(value, GetArenaForAllocation());
}
inline std::string* BleMessage::_internal_mutable_info() {
  if (!_internal_has_info()) {
    clear_message();
    set_has_info();
    message_.info_.InitDefault();
  }
  return message_.info_.Mutable(      GetArenaForAllocation());
}
inline std::string* BleMessage::release_info() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.BleMessage.info)
  if (_internal_has_info()) {
    clear_has_message();
    return message_.info_.Release();
  } else {
    return nullptr;
  }
}
inline void BleMessage::set_allocated_info(std::string* info) {
  if (has_message()) {
    clear_message();
  }
  if (info != nullptr) {
    set_has_info();
    message_.info_.InitAllocated(info, GetArenaForAllocation());
  }
  // @@protoc_insertion_point(field_set_allocated:qaul.net.ble.BleMessage.info)
}

// bytes feed = 2;
inline bool BleMessage::_internal_has_feed() const {
  return message_case() == kFeed;
}
inline bool BleMessage::has_feed() const {
  return _internal_has_feed();
}
inline void BleMessage::set_has_feed() {
  _oneof_case_[0] = kFeed;
}
inline void BleMessage::clear_feed() {
  if (_internal_has_feed()) {
    message_.feed_.Destroy();
    clear_has_message();
  }
}
inline const std::string& BleMessage::feed() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.BleMessage.feed)
  return _internal_feed();
}
template <typename ArgT0, typename... ArgT>
inline void BleMessage::set_feed(ArgT0&& arg0, ArgT... args) {
  if (!_internal_has_feed()) {
    clear_message();
    set_has_feed();
    message_.feed_.InitDefault();
  }
  message_.feed_.SetBytes( static_cast<ArgT0 &&>(arg0), args..., GetArenaForAllocation());
  // @@protoc_insertion_point(field_set:qaul.net.ble.BleMessage.feed)
}
inline std::string* BleMessage::mutable_feed() {
  std::string* _s = _internal_mutable_feed();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.BleMessage.feed)
  return _s;
}
inline const std::string& BleMessage::_internal_feed() const {
  if (_internal_has_feed()) {
    return message_.feed_.Get();
  }
  return ::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited();
}
inline void BleMessage::_internal_set_feed(const std::string& value) {
  if (!_internal_has_feed()) {
    clear_message();
    set_has_feed();
    message_.feed_.InitDefault();
  }
  message_.feed_.Set(value, GetArenaForAllocation());
}
inline std::string* BleMessage::_internal_mutable_feed() {
  if (!_internal_has_feed()) {
    clear_message();
    set_has_feed();
    message_.feed_.InitDefault();
  }
  return message_.feed_.Mutable(      GetArenaForAllocation());
}
inline std::string* BleMessage::release_feed() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.BleMessage.feed)
  if (_internal_has_feed()) {
    clear_has_message();
    return message_.feed_.Release();
  } else {
    return nullptr;
  }
}
inline void BleMessage::set_allocated_feed(std::string* feed) {
  if (has_message()) {
    clear_message();
  }
  if (feed != nullptr) {
    set_has_feed();
    message_.feed_.InitAllocated(feed, GetArenaForAllocation());
  }
  // @@protoc_insertion_point(field_set_allocated:qaul.net.ble.BleMessage.feed)
}

// bytes messaging = 3;
inline bool BleMessage::_internal_has_messaging() const {
  return message_case() == kMessaging;
}
inline bool BleMessage::has_messaging() const {
  return _internal_has_messaging();
}
inline void BleMessage::set_has_messaging() {
  _oneof_case_[0] = kMessaging;
}
inline void BleMessage::clear_messaging() {
  if (_internal_has_messaging()) {
    message_.messaging_.Destroy();
    clear_has_message();
  }
}
inline const std::string& BleMessage::messaging() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.BleMessage.messaging)
  return _internal_messaging();
}
template <typename ArgT0, typename... ArgT>
inline void BleMessage::set_messaging(ArgT0&& arg0, ArgT... args) {
  if (!_internal_has_messaging()) {
    clear_message();
    set_has_messaging();
    message_.messaging_.InitDefault();
  }
  message_.messaging_.SetBytes( static_cast<ArgT0 &&>(arg0), args..., GetArenaForAllocation());
  // @@protoc_insertion_point(field_set:qaul.net.ble.BleMessage.messaging)
}
inline std::string* BleMessage::mutable_messaging() {
  std::string* _s = _internal_mutable_messaging();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.BleMessage.messaging)
  return _s;
}
inline const std::string& BleMessage::_internal_messaging() const {
  if (_internal_has_messaging()) {
    return message_.messaging_.Get();
  }
  return ::PROTOBUF_NAMESPACE_ID::internal::GetEmptyStringAlreadyInited();
}
inline void BleMessage::_internal_set_messaging(const std::string& value) {
  if (!_internal_has_messaging()) {
    clear_message();
    set_has_messaging();
    message_.messaging_.InitDefault();
  }
  message_.messaging_.Set(value, GetArenaForAllocation());
}
inline std::string* BleMessage::_internal_mutable_messaging() {
  if (!_internal_has_messaging()) {
    clear_message();
    set_has_messaging();
    message_.messaging_.InitDefault();
  }
  return message_.messaging_.Mutable(      GetArenaForAllocation());
}
inline std::string* BleMessage::release_messaging() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.BleMessage.messaging)
  if (_internal_has_messaging()) {
    clear_has_message();
    return message_.messaging_.Release();
  } else {
    return nullptr;
  }
}
inline void BleMessage::set_allocated_messaging(std::string* messaging) {
  if (has_message()) {
    clear_message();
  }
  if (messaging != nullptr) {
    set_has_messaging();
    message_.messaging_.InitAllocated(messaging, GetArenaForAllocation());
  }
  // @@protoc_insertion_point(field_set_allocated:qaul.net.ble.BleMessage.messaging)
}

// .qaul.net.ble.Identification identification = 4;
inline bool BleMessage::_internal_has_identification() const {
  return message_case() == kIdentification;
}
inline bool BleMessage::has_identification() const {
  return _internal_has_identification();
}
inline void BleMessage::set_has_identification() {
  _oneof_case_[0] = kIdentification;
}
inline void BleMessage::clear_identification() {
  if (_internal_has_identification()) {
    if (GetArenaForAllocation() == nullptr) {
      delete message_.identification_;
    }
    clear_has_message();
  }
}
inline ::qaul::net::ble::Identification* BleMessage::release_identification() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.BleMessage.identification)
  if (_internal_has_identification()) {
    clear_has_message();
    ::qaul::net::ble::Identification* temp = message_.identification_;
    if (GetArenaForAllocation() != nullptr) {
      temp = ::PROTOBUF_NAMESPACE_ID::internal::DuplicateIfNonNull(temp);
    }
    message_.identification_ = nullptr;
    return temp;
  } else {
    return nullptr;
  }
}
inline const ::qaul::net::ble::Identification& BleMessage::_internal_identification() const {
  return _internal_has_identification()
      ? *message_.identification_
      : reinterpret_cast< ::qaul::net::ble::Identification&>(::qaul::net::ble::_Identification_default_instance_);
}
inline const ::qaul::net::ble::Identification& BleMessage::identification() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.BleMessage.identification)
  return _internal_identification();
}
inline ::qaul::net::ble::Identification* BleMessage::unsafe_arena_release_identification() {
  // @@protoc_insertion_point(field_unsafe_arena_release:qaul.net.ble.BleMessage.identification)
  if (_internal_has_identification()) {
    clear_has_message();
    ::qaul::net::ble::Identification* temp = message_.identification_;
    message_.identification_ = nullptr;
    return temp;
  } else {
    return nullptr;
  }
}
inline void BleMessage::unsafe_arena_set_allocated_identification(::qaul::net::ble::Identification* identification) {
  clear_message();
  if (identification) {
    set_has_identification();
    message_.identification_ = identification;
  }
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:qaul.net.ble.BleMessage.identification)
}
inline ::qaul::net::ble::Identification* BleMessage::_internal_mutable_identification() {
  if (!_internal_has_identification()) {
    clear_message();
    set_has_identification();
    message_.identification_ = CreateMaybeMessage< ::qaul::net::ble::Identification >(GetArenaForAllocation());
  }
  return message_.identification_;
}
inline ::qaul::net::ble::Identification* BleMessage::mutable_identification() {
  ::qaul::net::ble::Identification* _msg = _internal_mutable_identification();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.BleMessage.identification)
  return _msg;
}

inline bool BleMessage::has_message() const {
  return message_case() != MESSAGE_NOT_SET;
}
inline void BleMessage::clear_has_message() {
  _oneof_case_[0] = MESSAGE_NOT_SET;
}
inline BleMessage::MessageCase BleMessage::message_case() const {
  return BleMessage::MessageCase(_oneof_case_[0]);
}
// -------------------------------------------------------------------

// Identification

// bool request = 1;
inline void Identification::clear_request() {
  request_ = false;
}
inline bool Identification::_internal_request() const {
  return request_;
}
inline bool Identification::request() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.Identification.request)
  return _internal_request();
}
inline void Identification::_internal_set_request(bool value) {
  
  request_ = value;
}
inline void Identification::set_request(bool value) {
  _internal_set_request(value);
  // @@protoc_insertion_point(field_set:qaul.net.ble.Identification.request)
}

// .qaul.net.ble.NodeIdentification node = 2;
inline bool Identification::_internal_has_node() const {
  return this != internal_default_instance() && node_ != nullptr;
}
inline bool Identification::has_node() const {
  return _internal_has_node();
}
inline void Identification::clear_node() {
  if (GetArenaForAllocation() == nullptr && node_ != nullptr) {
    delete node_;
  }
  node_ = nullptr;
}
inline const ::qaul::net::ble::NodeIdentification& Identification::_internal_node() const {
  const ::qaul::net::ble::NodeIdentification* p = node_;
  return p != nullptr ? *p : reinterpret_cast<const ::qaul::net::ble::NodeIdentification&>(
      ::qaul::net::ble::_NodeIdentification_default_instance_);
}
inline const ::qaul::net::ble::NodeIdentification& Identification::node() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.Identification.node)
  return _internal_node();
}
inline void Identification::unsafe_arena_set_allocated_node(
    ::qaul::net::ble::NodeIdentification* node) {
  if (GetArenaForAllocation() == nullptr) {
    delete reinterpret_cast<::PROTOBUF_NAMESPACE_ID::MessageLite*>(node_);
  }
  node_ = node;
  if (node) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_unsafe_arena_set_allocated:qaul.net.ble.Identification.node)
}
inline ::qaul::net::ble::NodeIdentification* Identification::release_node() {
  
  ::qaul::net::ble::NodeIdentification* temp = node_;
  node_ = nullptr;
#ifdef PROTOBUF_FORCE_COPY_IN_RELEASE
  auto* old =  reinterpret_cast<::PROTOBUF_NAMESPACE_ID::MessageLite*>(temp);
  temp = ::PROTOBUF_NAMESPACE_ID::internal::DuplicateIfNonNull(temp);
  if (GetArenaForAllocation() == nullptr) { delete old; }
#else  // PROTOBUF_FORCE_COPY_IN_RELEASE
  if (GetArenaForAllocation() != nullptr) {
    temp = ::PROTOBUF_NAMESPACE_ID::internal::DuplicateIfNonNull(temp);
  }
#endif  // !PROTOBUF_FORCE_COPY_IN_RELEASE
  return temp;
}
inline ::qaul::net::ble::NodeIdentification* Identification::unsafe_arena_release_node() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.Identification.node)
  
  ::qaul::net::ble::NodeIdentification* temp = node_;
  node_ = nullptr;
  return temp;
}
inline ::qaul::net::ble::NodeIdentification* Identification::_internal_mutable_node() {
  
  if (node_ == nullptr) {
    auto* p = CreateMaybeMessage<::qaul::net::ble::NodeIdentification>(GetArenaForAllocation());
    node_ = p;
  }
  return node_;
}
inline ::qaul::net::ble::NodeIdentification* Identification::mutable_node() {
  ::qaul::net::ble::NodeIdentification* _msg = _internal_mutable_node();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.Identification.node)
  return _msg;
}
inline void Identification::set_allocated_node(::qaul::net::ble::NodeIdentification* node) {
  ::PROTOBUF_NAMESPACE_ID::Arena* message_arena = GetArenaForAllocation();
  if (message_arena == nullptr) {
    delete node_;
  }
  if (node) {
    ::PROTOBUF_NAMESPACE_ID::Arena* submessage_arena =
        ::PROTOBUF_NAMESPACE_ID::Arena::InternalGetOwningArena(node);
    if (message_arena != submessage_arena) {
      node = ::PROTOBUF_NAMESPACE_ID::internal::GetOwnedMessage(
          message_arena, node, submessage_arena);
    }
    
  } else {
    
  }
  node_ = node;
  // @@protoc_insertion_point(field_set_allocated:qaul.net.ble.Identification.node)
}

// -------------------------------------------------------------------

// NodeIdentification

// bytes id = 1;
inline void NodeIdentification::clear_id() {
  id_.ClearToEmpty();
}
inline const std::string& NodeIdentification::id() const {
  // @@protoc_insertion_point(field_get:qaul.net.ble.NodeIdentification.id)
  return _internal_id();
}
template <typename ArgT0, typename... ArgT>
inline PROTOBUF_ALWAYS_INLINE
void NodeIdentification::set_id(ArgT0&& arg0, ArgT... args) {
 
 id_.SetBytes(static_cast<ArgT0 &&>(arg0), args..., GetArenaForAllocation());
  // @@protoc_insertion_point(field_set:qaul.net.ble.NodeIdentification.id)
}
inline std::string* NodeIdentification::mutable_id() {
  std::string* _s = _internal_mutable_id();
  // @@protoc_insertion_point(field_mutable:qaul.net.ble.NodeIdentification.id)
  return _s;
}
inline const std::string& NodeIdentification::_internal_id() const {
  return id_.Get();
}
inline void NodeIdentification::_internal_set_id(const std::string& value) {
  
  id_.Set(value, GetArenaForAllocation());
}
inline std::string* NodeIdentification::_internal_mutable_id() {
  
  return id_.Mutable(GetArenaForAllocation());
}
inline std::string* NodeIdentification::release_id() {
  // @@protoc_insertion_point(field_release:qaul.net.ble.NodeIdentification.id)
  return id_.Release();
}
inline void NodeIdentification::set_allocated_id(std::string* id) {
  if (id != nullptr) {
    
  } else {
    
  }
  id_.SetAllocated(id, GetArenaForAllocation());
#ifdef PROTOBUF_FORCE_COPY_DEFAULT_STRING
  if (id_.IsDefault()) {
    id_.Set("", GetArenaForAllocation());
  }
#endif // PROTOBUF_FORCE_COPY_DEFAULT_STRING
  // @@protoc_insertion_point(field_set_allocated:qaul.net.ble.NodeIdentification.id)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__
// -------------------------------------------------------------------

// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)

}  // namespace ble
}  // namespace net
}  // namespace qaul

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_connections_2fble_2fble_5fnet_2eproto

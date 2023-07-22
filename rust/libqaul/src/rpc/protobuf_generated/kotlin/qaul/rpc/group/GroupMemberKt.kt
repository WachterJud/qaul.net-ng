// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: services/group/group_rpc.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.rpc.group;

@kotlin.jvm.JvmName("-initializegroupMember")
public inline fun groupMember(block: qaul.rpc.group.GroupMemberKt.Dsl.() -> kotlin.Unit): qaul.rpc.group.GroupRpc.GroupMember =
  qaul.rpc.group.GroupMemberKt.Dsl._create(qaul.rpc.group.GroupRpc.GroupMember.newBuilder()).apply { block() }._build()
/**
 * ```
 * Group member response
 * ```
 *
 * Protobuf type `qaul.rpc.group.GroupMember`
 */
public object GroupMemberKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.group.GroupRpc.GroupMember.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.group.GroupRpc.GroupMember.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.group.GroupRpc.GroupMember = _builder.build()

    /**
     * ```
     * user id
     * ```
     *
     * `bytes user_id = 1;`
     */
    public var userId: com.google.protobuf.ByteString
      @JvmName("getUserId")
      get() = _builder.getUserId()
      @JvmName("setUserId")
      set(value) {
        _builder.setUserId(value)
      }
    /**
     * ```
     * user id
     * ```
     *
     * `bytes user_id = 1;`
     */
    public fun clearUserId() {
      _builder.clearUserId()
    }

    /**
     * ```
     * role
     * ```
     *
     * `.qaul.rpc.group.GroupMemberRole role = 2;`
     */
    public var role: qaul.rpc.group.GroupRpc.GroupMemberRole
      @JvmName("getRole")
      get() = _builder.getRole()
      @JvmName("setRole")
      set(value) {
        _builder.setRole(value)
      }
    public var roleValue: kotlin.Int
      @JvmName("getRoleValue")
      get() = _builder.getRoleValue()
      @JvmName("setRoleValue")
      set(value) {
        _builder.setRoleValue(value)
      }
    /**
     * ```
     * role
     * ```
     *
     * `.qaul.rpc.group.GroupMemberRole role = 2;`
     */
    public fun clearRole() {
      _builder.clearRole()
    }

    /**
     * ```
     * joined at
     * ```
     *
     * `uint64 joined_at = 3;`
     */
    public var joinedAt: kotlin.Long
      @JvmName("getJoinedAt")
      get() = _builder.getJoinedAt()
      @JvmName("setJoinedAt")
      set(value) {
        _builder.setJoinedAt(value)
      }
    /**
     * ```
     * joined at
     * ```
     *
     * `uint64 joined_at = 3;`
     */
    public fun clearJoinedAt() {
      _builder.clearJoinedAt()
    }

    /**
     * ```
     * state
     * ```
     *
     * `.qaul.rpc.group.GroupMemberState state = 4;`
     */
    public var state: qaul.rpc.group.GroupRpc.GroupMemberState
      @JvmName("getState")
      get() = _builder.getState()
      @JvmName("setState")
      set(value) {
        _builder.setState(value)
      }
    public var stateValue: kotlin.Int
      @JvmName("getStateValue")
      get() = _builder.getStateValue()
      @JvmName("setStateValue")
      set(value) {
        _builder.setStateValue(value)
      }
    /**
     * ```
     * state
     * ```
     *
     * `.qaul.rpc.group.GroupMemberState state = 4;`
     */
    public fun clearState() {
      _builder.clearState()
    }

    /**
     * ```
     * last message index
     * ```
     *
     * `uint32 last_message_index = 5;`
     */
    public var lastMessageIndex: kotlin.Int
      @JvmName("getLastMessageIndex")
      get() = _builder.getLastMessageIndex()
      @JvmName("setLastMessageIndex")
      set(value) {
        _builder.setLastMessageIndex(value)
      }
    /**
     * ```
     * last message index
     * ```
     *
     * `uint32 last_message_index = 5;`
     */
    public fun clearLastMessageIndex() {
      _builder.clearLastMessageIndex()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.group.GroupRpc.GroupMember.copy(block: qaul.rpc.group.GroupMemberKt.Dsl.() -> kotlin.Unit): qaul.rpc.group.GroupRpc.GroupMember =
  qaul.rpc.group.GroupMemberKt.Dsl._create(this.toBuilder()).apply { block() }._build()


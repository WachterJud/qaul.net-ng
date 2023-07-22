// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: router/users.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.rpc.users;

@kotlin.jvm.JvmName("-initializeuserList")
public inline fun userList(block: qaul.rpc.users.UserListKt.Dsl.() -> kotlin.Unit): qaul.rpc.users.UsersOuterClass.UserList =
  qaul.rpc.users.UserListKt.Dsl._create(qaul.rpc.users.UsersOuterClass.UserList.newBuilder()).apply { block() }._build()
/**
 * ```
 * user list
 * ```
 *
 * Protobuf type `qaul.rpc.users.UserList`
 */
public object UserListKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.users.UsersOuterClass.UserList.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.users.UsersOuterClass.UserList.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.users.UsersOuterClass.UserList = _builder.build()

    /**
     * An uninstantiable, behaviorless type to represent the field in
     * generics.
     */
    @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
    public class UserProxy private constructor() : com.google.protobuf.kotlin.DslProxy()
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     */
     public val user: com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>
      @kotlin.jvm.JvmSynthetic
      get() = com.google.protobuf.kotlin.DslList(
        _builder.getUserList()
      )
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     * @param value The user to add.
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("addUser")
    public fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.add(value: qaul.rpc.users.UsersOuterClass.UserEntry) {
      _builder.addUser(value)
    }
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     * @param value The user to add.
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("plusAssignUser")
    @Suppress("NOTHING_TO_INLINE")
    public inline operator fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.plusAssign(value: qaul.rpc.users.UsersOuterClass.UserEntry) {
      add(value)
    }
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     * @param values The user to add.
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("addAllUser")
    public fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.addAll(values: kotlin.collections.Iterable<qaul.rpc.users.UsersOuterClass.UserEntry>) {
      _builder.addAllUser(values)
    }
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     * @param values The user to add.
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("plusAssignAllUser")
    @Suppress("NOTHING_TO_INLINE")
    public inline operator fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.plusAssign(values: kotlin.collections.Iterable<qaul.rpc.users.UsersOuterClass.UserEntry>) {
      addAll(values)
    }
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     * @param index The index to set the value at.
     * @param value The user to set.
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("setUser")
    public operator fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.set(index: kotlin.Int, value: qaul.rpc.users.UsersOuterClass.UserEntry) {
      _builder.setUser(index, value)
    }
    /**
     * `repeated .qaul.rpc.users.UserEntry user = 1;`
     */
    @kotlin.jvm.JvmSynthetic
    @kotlin.jvm.JvmName("clearUser")
    public fun com.google.protobuf.kotlin.DslList<qaul.rpc.users.UsersOuterClass.UserEntry, UserProxy>.clear() {
      _builder.clearUser()
    }

  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.users.UsersOuterClass.UserList.copy(block: qaul.rpc.users.UserListKt.Dsl.() -> kotlin.Unit): qaul.rpc.users.UsersOuterClass.UserList =
  qaul.rpc.users.UserListKt.Dsl._create(this.toBuilder()).apply { block() }._build()


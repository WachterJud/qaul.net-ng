// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: router/users.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.rpc.users;

@kotlin.jvm.JvmName("-initializeusers")
public inline fun users(block: qaul.rpc.users.UsersKt.Dsl.() -> kotlin.Unit): qaul.rpc.users.UsersOuterClass.Users =
  qaul.rpc.users.UsersKt.Dsl._create(qaul.rpc.users.UsersOuterClass.Users.newBuilder()).apply { block() }._build()
/**
 * ```
 * users rpc message container
 * ```
 *
 * Protobuf type `qaul.rpc.users.Users`
 */
public object UsersKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.users.UsersOuterClass.Users.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.users.UsersOuterClass.Users.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.users.UsersOuterClass.Users = _builder.build()

    /**
     * ```
     * User Request returns a user list
     * containing all users with their connectivity
     * field set to either online or offline.
     * The connections are not set.
     * ```
     *
     * `.qaul.rpc.users.UserRequest user_request = 1;`
     */
    public var userRequest: qaul.rpc.users.UsersOuterClass.UserRequest
      @JvmName("getUserRequest")
      get() = _builder.getUserRequest()
      @JvmName("setUserRequest")
      set(value) {
        _builder.setUserRequest(value)
      }
    /**
     * ```
     * User Request returns a user list
     * containing all users with their connectivity
     * field set to either online or offline.
     * The connections are not set.
     * ```
     *
     * `.qaul.rpc.users.UserRequest user_request = 1;`
     */
    public fun clearUserRequest() {
      _builder.clearUserRequest()
    }
    /**
     * ```
     * User Request returns a user list
     * containing all users with their connectivity
     * field set to either online or offline.
     * The connections are not set.
     * ```
     *
     * `.qaul.rpc.users.UserRequest user_request = 1;`
     * @return Whether the userRequest field is set.
     */
    public fun hasUserRequest(): kotlin.Boolean {
      return _builder.hasUserRequest()
    }

    /**
     * ```
     * User Online Request returns a user list
     * of all users currently online in the network.
     * Each user has
     * ```
     *
     * `.qaul.rpc.users.UserOnlineRequest user_online_request = 2;`
     */
    public var userOnlineRequest: qaul.rpc.users.UsersOuterClass.UserOnlineRequest
      @JvmName("getUserOnlineRequest")
      get() = _builder.getUserOnlineRequest()
      @JvmName("setUserOnlineRequest")
      set(value) {
        _builder.setUserOnlineRequest(value)
      }
    /**
     * ```
     * User Online Request returns a user list
     * of all users currently online in the network.
     * Each user has
     * ```
     *
     * `.qaul.rpc.users.UserOnlineRequest user_online_request = 2;`
     */
    public fun clearUserOnlineRequest() {
      _builder.clearUserOnlineRequest()
    }
    /**
     * ```
     * User Online Request returns a user list
     * of all users currently online in the network.
     * Each user has
     * ```
     *
     * `.qaul.rpc.users.UserOnlineRequest user_online_request = 2;`
     * @return Whether the userOnlineRequest field is set.
     */
    public fun hasUserOnlineRequest(): kotlin.Boolean {
      return _builder.hasUserOnlineRequest()
    }

    /**
     * ```
     * User List
     *
     * Libqaul's return message for  'UserRequest' and
     * 'UserOnlineRequest', containing a list of UserEntry's
     * ```
     *
     * `.qaul.rpc.users.UserList user_list = 3;`
     */
    public var userList: qaul.rpc.users.UsersOuterClass.UserList
      @JvmName("getUserList")
      get() = _builder.getUserList()
      @JvmName("setUserList")
      set(value) {
        _builder.setUserList(value)
      }
    /**
     * ```
     * User List
     *
     * Libqaul's return message for  'UserRequest' and
     * 'UserOnlineRequest', containing a list of UserEntry's
     * ```
     *
     * `.qaul.rpc.users.UserList user_list = 3;`
     */
    public fun clearUserList() {
      _builder.clearUserList()
    }
    /**
     * ```
     * User List
     *
     * Libqaul's return message for  'UserRequest' and
     * 'UserOnlineRequest', containing a list of UserEntry's
     * ```
     *
     * `.qaul.rpc.users.UserList user_list = 3;`
     * @return Whether the userList field is set.
     */
    public fun hasUserList(): kotlin.Boolean {
      return _builder.hasUserList()
    }

    /**
     * ```
     * User Update
     *
     * Sent to libqaul to update the verification & blocked fields
     * of a user.
     * All other fields will be ignored.
     * ```
     *
     * `.qaul.rpc.users.UserEntry user_update = 4;`
     */
    public var userUpdate: qaul.rpc.users.UsersOuterClass.UserEntry
      @JvmName("getUserUpdate")
      get() = _builder.getUserUpdate()
      @JvmName("setUserUpdate")
      set(value) {
        _builder.setUserUpdate(value)
      }
    /**
     * ```
     * User Update
     *
     * Sent to libqaul to update the verification & blocked fields
     * of a user.
     * All other fields will be ignored.
     * ```
     *
     * `.qaul.rpc.users.UserEntry user_update = 4;`
     */
    public fun clearUserUpdate() {
      _builder.clearUserUpdate()
    }
    /**
     * ```
     * User Update
     *
     * Sent to libqaul to update the verification & blocked fields
     * of a user.
     * All other fields will be ignored.
     * ```
     *
     * `.qaul.rpc.users.UserEntry user_update = 4;`
     * @return Whether the userUpdate field is set.
     */
    public fun hasUserUpdate(): kotlin.Boolean {
      return _builder.hasUserUpdate()
    }

    /**
     * ```
     * Security Number Request
     *
     * Requests the specific security number for
     * for the connection with this user.
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberRequest security_number_request = 5;`
     */
    public var securityNumberRequest: qaul.rpc.users.UsersOuterClass.SecurityNumberRequest
      @JvmName("getSecurityNumberRequest")
      get() = _builder.getSecurityNumberRequest()
      @JvmName("setSecurityNumberRequest")
      set(value) {
        _builder.setSecurityNumberRequest(value)
      }
    /**
     * ```
     * Security Number Request
     *
     * Requests the specific security number for
     * for the connection with this user.
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberRequest security_number_request = 5;`
     */
    public fun clearSecurityNumberRequest() {
      _builder.clearSecurityNumberRequest()
    }
    /**
     * ```
     * Security Number Request
     *
     * Requests the specific security number for
     * for the connection with this user.
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberRequest security_number_request = 5;`
     * @return Whether the securityNumberRequest field is set.
     */
    public fun hasSecurityNumberRequest(): kotlin.Boolean {
      return _builder.hasSecurityNumberRequest()
    }

    /**
     * ```
     * Security Number Response
     *
     * Libqaul's response containing the security number.
     *
     * The security number contains 8 blocks of 5 digit numbers.
     * They shall be rendered in two rows. If a number is
     * smaller then five-digits, the missing digits shall be filled
     * with leading zeros.
     *
     * example rendering of security number:
     * 13246 42369 46193 12484
     * 12142 31101 09874 34545
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberResponse security_number_response = 6;`
     */
    public var securityNumberResponse: qaul.rpc.users.UsersOuterClass.SecurityNumberResponse
      @JvmName("getSecurityNumberResponse")
      get() = _builder.getSecurityNumberResponse()
      @JvmName("setSecurityNumberResponse")
      set(value) {
        _builder.setSecurityNumberResponse(value)
      }
    /**
     * ```
     * Security Number Response
     *
     * Libqaul's response containing the security number.
     *
     * The security number contains 8 blocks of 5 digit numbers.
     * They shall be rendered in two rows. If a number is
     * smaller then five-digits, the missing digits shall be filled
     * with leading zeros.
     *
     * example rendering of security number:
     * 13246 42369 46193 12484
     * 12142 31101 09874 34545
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberResponse security_number_response = 6;`
     */
    public fun clearSecurityNumberResponse() {
      _builder.clearSecurityNumberResponse()
    }
    /**
     * ```
     * Security Number Response
     *
     * Libqaul's response containing the security number.
     *
     * The security number contains 8 blocks of 5 digit numbers.
     * They shall be rendered in two rows. If a number is
     * smaller then five-digits, the missing digits shall be filled
     * with leading zeros.
     *
     * example rendering of security number:
     * 13246 42369 46193 12484
     * 12142 31101 09874 34545
     * ```
     *
     * `.qaul.rpc.users.SecurityNumberResponse security_number_response = 6;`
     * @return Whether the securityNumberResponse field is set.
     */
    public fun hasSecurityNumberResponse(): kotlin.Boolean {
      return _builder.hasSecurityNumberResponse()
    }
    public val messageCase: qaul.rpc.users.UsersOuterClass.Users.MessageCase
      @JvmName("getMessageCase")
      get() = _builder.getMessageCase()

    public fun clearMessage() {
      _builder.clearMessage()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.users.UsersOuterClass.Users.copy(block: qaul.rpc.users.UsersKt.Dsl.() -> kotlin.Unit): qaul.rpc.users.UsersOuterClass.Users =
  qaul.rpc.users.UsersKt.Dsl._create(this.toBuilder()).apply { block() }._build()

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.userRequestOrNull: qaul.rpc.users.UsersOuterClass.UserRequest?
  get() = if (hasUserRequest()) getUserRequest() else null

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.userOnlineRequestOrNull: qaul.rpc.users.UsersOuterClass.UserOnlineRequest?
  get() = if (hasUserOnlineRequest()) getUserOnlineRequest() else null

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.userListOrNull: qaul.rpc.users.UsersOuterClass.UserList?
  get() = if (hasUserList()) getUserList() else null

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.userUpdateOrNull: qaul.rpc.users.UsersOuterClass.UserEntry?
  get() = if (hasUserUpdate()) getUserUpdate() else null

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.securityNumberRequestOrNull: qaul.rpc.users.UsersOuterClass.SecurityNumberRequest?
  get() = if (hasSecurityNumberRequest()) getSecurityNumberRequest() else null

public val qaul.rpc.users.UsersOuterClass.UsersOrBuilder.securityNumberResponseOrNull: qaul.rpc.users.UsersOuterClass.SecurityNumberResponse?
  get() = if (hasSecurityNumberResponse()) getSecurityNumberResponse() else null


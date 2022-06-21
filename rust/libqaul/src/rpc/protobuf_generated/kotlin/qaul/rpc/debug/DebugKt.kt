//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: rpc/debug.proto

package qaul.rpc.debug;

@kotlin.jvm.JvmName("-initializedebug")
public inline fun debug(block: qaul.rpc.debug.DebugKt.Dsl.() -> kotlin.Unit): qaul.rpc.debug.DebugOuterClass.Debug =
  qaul.rpc.debug.DebugKt.Dsl._create(qaul.rpc.debug.DebugOuterClass.Debug.newBuilder()).apply { block() }._build()
public object DebugKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.debug.DebugOuterClass.Debug.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.debug.DebugOuterClass.Debug.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.debug.DebugOuterClass.Debug = _builder.build()

    /**
     * <pre>
     * request a heartbeat
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatRequest heartbeat_request = 1;</code>
     */
    public var heartbeatRequest: qaul.rpc.debug.DebugOuterClass.HeartbeatRequest
      @JvmName("getHeartbeatRequest")
      get() = _builder.getHeartbeatRequest()
      @JvmName("setHeartbeatRequest")
      set(value) {
        _builder.setHeartbeatRequest(value)
      }
    /**
     * <pre>
     * request a heartbeat
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatRequest heartbeat_request = 1;</code>
     */
    public fun clearHeartbeatRequest() {
      _builder.clearHeartbeatRequest()
    }
    /**
     * <pre>
     * request a heartbeat
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatRequest heartbeat_request = 1;</code>
     * @return Whether the heartbeatRequest field is set.
     */
    public fun hasHeartbeatRequest(): kotlin.Boolean {
      return _builder.hasHeartbeatRequest()
    }

    /**
     * <pre>
     * response to the heartbeat request
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatResponse heartbeat_response = 2;</code>
     */
    public var heartbeatResponse: qaul.rpc.debug.DebugOuterClass.HeartbeatResponse
      @JvmName("getHeartbeatResponse")
      get() = _builder.getHeartbeatResponse()
      @JvmName("setHeartbeatResponse")
      set(value) {
        _builder.setHeartbeatResponse(value)
      }
    /**
     * <pre>
     * response to the heartbeat request
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatResponse heartbeat_response = 2;</code>
     */
    public fun clearHeartbeatResponse() {
      _builder.clearHeartbeatResponse()
    }
    /**
     * <pre>
     * response to the heartbeat request
     * </pre>
     *
     * <code>.qaul.rpc.debug.HeartbeatResponse heartbeat_response = 2;</code>
     * @return Whether the heartbeatResponse field is set.
     */
    public fun hasHeartbeatResponse(): kotlin.Boolean {
      return _builder.hasHeartbeatResponse()
    }

    /**
     * <pre>
     * libqaul panics immediately
     * </pre>
     *
     * <code>.qaul.rpc.debug.Panic panic = 3;</code>
     */
    public var panic: qaul.rpc.debug.DebugOuterClass.Panic
      @JvmName("getPanic")
      get() = _builder.getPanic()
      @JvmName("setPanic")
      set(value) {
        _builder.setPanic(value)
      }
    /**
     * <pre>
     * libqaul panics immediately
     * </pre>
     *
     * <code>.qaul.rpc.debug.Panic panic = 3;</code>
     */
    public fun clearPanic() {
      _builder.clearPanic()
    }
    /**
     * <pre>
     * libqaul panics immediately
     * </pre>
     *
     * <code>.qaul.rpc.debug.Panic panic = 3;</code>
     * @return Whether the panic field is set.
     */
    public fun hasPanic(): kotlin.Boolean {
      return _builder.hasPanic()
    }

    /**
     * <pre>
     * enable/disable logging to file
     * </pre>
     *
     * <code>.qaul.rpc.debug.LogToFile log_to_file = 4;</code>
     */
    public var logToFile: qaul.rpc.debug.DebugOuterClass.LogToFile
      @JvmName("getLogToFile")
      get() = _builder.getLogToFile()
      @JvmName("setLogToFile")
      set(value) {
        _builder.setLogToFile(value)
      }
    /**
     * <pre>
     * enable/disable logging to file
     * </pre>
     *
     * <code>.qaul.rpc.debug.LogToFile log_to_file = 4;</code>
     */
    public fun clearLogToFile() {
      _builder.clearLogToFile()
    }
    /**
     * <pre>
     * enable/disable logging to file
     * </pre>
     *
     * <code>.qaul.rpc.debug.LogToFile log_to_file = 4;</code>
     * @return Whether the logToFile field is set.
     */
    public fun hasLogToFile(): kotlin.Boolean {
      return _builder.hasLogToFile()
    }

    /**
     * <pre>
     * Storage Path Request
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathRequest storage_path_request = 5;</code>
     */
    public var storagePathRequest: qaul.rpc.debug.DebugOuterClass.StoragePathRequest
      @JvmName("getStoragePathRequest")
      get() = _builder.getStoragePathRequest()
      @JvmName("setStoragePathRequest")
      set(value) {
        _builder.setStoragePathRequest(value)
      }
    /**
     * <pre>
     * Storage Path Request
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathRequest storage_path_request = 5;</code>
     */
    public fun clearStoragePathRequest() {
      _builder.clearStoragePathRequest()
    }
    /**
     * <pre>
     * Storage Path Request
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathRequest storage_path_request = 5;</code>
     * @return Whether the storagePathRequest field is set.
     */
    public fun hasStoragePathRequest(): kotlin.Boolean {
      return _builder.hasStoragePathRequest()
    }

    /**
     * <pre>
     * Storage Path Response
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathResponse storage_path_response = 6;</code>
     */
    public var storagePathResponse: qaul.rpc.debug.DebugOuterClass.StoragePathResponse
      @JvmName("getStoragePathResponse")
      get() = _builder.getStoragePathResponse()
      @JvmName("setStoragePathResponse")
      set(value) {
        _builder.setStoragePathResponse(value)
      }
    /**
     * <pre>
     * Storage Path Response
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathResponse storage_path_response = 6;</code>
     */
    public fun clearStoragePathResponse() {
      _builder.clearStoragePathResponse()
    }
    /**
     * <pre>
     * Storage Path Response
     * </pre>
     *
     * <code>.qaul.rpc.debug.StoragePathResponse storage_path_response = 6;</code>
     * @return Whether the storagePathResponse field is set.
     */
    public fun hasStoragePathResponse(): kotlin.Boolean {
      return _builder.hasStoragePathResponse()
    }

    /**
     * <pre>
     * Request for library to delete logs
     * </pre>
     *
     * <code>.qaul.rpc.debug.DeleteLibqaulLogsRequest delete_libqaul_logs_request = 7;</code>
     */
    public var deleteLibqaulLogsRequest: qaul.rpc.debug.DebugOuterClass.DeleteLibqaulLogsRequest
      @JvmName("getDeleteLibqaulLogsRequest")
      get() = _builder.getDeleteLibqaulLogsRequest()
      @JvmName("setDeleteLibqaulLogsRequest")
      set(value) {
        _builder.setDeleteLibqaulLogsRequest(value)
      }
    /**
     * <pre>
     * Request for library to delete logs
     * </pre>
     *
     * <code>.qaul.rpc.debug.DeleteLibqaulLogsRequest delete_libqaul_logs_request = 7;</code>
     */
    public fun clearDeleteLibqaulLogsRequest() {
      _builder.clearDeleteLibqaulLogsRequest()
    }
    /**
     * <pre>
     * Request for library to delete logs
     * </pre>
     *
     * <code>.qaul.rpc.debug.DeleteLibqaulLogsRequest delete_libqaul_logs_request = 7;</code>
     * @return Whether the deleteLibqaulLogsRequest field is set.
     */
    public fun hasDeleteLibqaulLogsRequest(): kotlin.Boolean {
      return _builder.hasDeleteLibqaulLogsRequest()
    }
    public val messageCase: qaul.rpc.debug.DebugOuterClass.Debug.MessageCase
      @JvmName("getMessageCase")
      get() = _builder.getMessageCase()

    public fun clearMessage() {
      _builder.clearMessage()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.debug.DebugOuterClass.Debug.copy(block: qaul.rpc.debug.DebugKt.Dsl.() -> kotlin.Unit): qaul.rpc.debug.DebugOuterClass.Debug =
  qaul.rpc.debug.DebugKt.Dsl._create(this.toBuilder()).apply { block() }._build()

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.heartbeatRequestOrNull: qaul.rpc.debug.DebugOuterClass.HeartbeatRequest?
  get() = if (hasHeartbeatRequest()) getHeartbeatRequest() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.heartbeatResponseOrNull: qaul.rpc.debug.DebugOuterClass.HeartbeatResponse?
  get() = if (hasHeartbeatResponse()) getHeartbeatResponse() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.panicOrNull: qaul.rpc.debug.DebugOuterClass.Panic?
  get() = if (hasPanic()) getPanic() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.logToFileOrNull: qaul.rpc.debug.DebugOuterClass.LogToFile?
  get() = if (hasLogToFile()) getLogToFile() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.storagePathRequestOrNull: qaul.rpc.debug.DebugOuterClass.StoragePathRequest?
  get() = if (hasStoragePathRequest()) getStoragePathRequest() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.storagePathResponseOrNull: qaul.rpc.debug.DebugOuterClass.StoragePathResponse?
  get() = if (hasStoragePathResponse()) getStoragePathResponse() else null

val qaul.rpc.debug.DebugOuterClass.DebugOrBuilder.deleteLibqaulLogsRequestOrNull: qaul.rpc.debug.DebugOuterClass.DeleteLibqaulLogsRequest?
  get() = if (hasDeleteLibqaulLogsRequest()) getDeleteLibqaulLogsRequest() else null


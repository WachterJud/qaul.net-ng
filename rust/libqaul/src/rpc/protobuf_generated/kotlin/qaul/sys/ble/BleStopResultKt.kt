// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: connections/ble/ble.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.sys.ble;

@kotlin.jvm.JvmName("-initializebleStopResult")
public inline fun bleStopResult(block: qaul.sys.ble.BleStopResultKt.Dsl.() -> kotlin.Unit): qaul.sys.ble.BleOuterClass.BleStopResult =
  qaul.sys.ble.BleStopResultKt.Dsl._create(qaul.sys.ble.BleOuterClass.BleStopResult.newBuilder()).apply { block() }._build()
/**
 * ```
 * Stop Result
 *
 * Feedback of the stop request
 * ```
 *
 * Protobuf type `qaul.sys.ble.BleStopResult`
 */
public object BleStopResultKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.sys.ble.BleOuterClass.BleStopResult.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.sys.ble.BleOuterClass.BleStopResult.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.sys.ble.BleOuterClass.BleStopResult = _builder.build()

    /**
     * ```
     * whether the device was successfully stopped
     * ```
     *
     * `bool success = 1;`
     */
    public var success: kotlin.Boolean
      @JvmName("getSuccess")
      get() = _builder.getSuccess()
      @JvmName("setSuccess")
      set(value) {
        _builder.setSuccess(value)
      }
    /**
     * ```
     * whether the device was successfully stopped
     * ```
     *
     * `bool success = 1;`
     */
    public fun clearSuccess() {
      _builder.clearSuccess()
    }

    /**
     * ```
     * error reason
     * ```
     *
     * `.qaul.sys.ble.BleError error_reason = 2;`
     */
    public var errorReason: qaul.sys.ble.BleOuterClass.BleError
      @JvmName("getErrorReason")
      get() = _builder.getErrorReason()
      @JvmName("setErrorReason")
      set(value) {
        _builder.setErrorReason(value)
      }
    public var errorReasonValue: kotlin.Int
      @JvmName("getErrorReasonValue")
      get() = _builder.getErrorReasonValue()
      @JvmName("setErrorReasonValue")
      set(value) {
        _builder.setErrorReasonValue(value)
      }
    /**
     * ```
     * error reason
     * ```
     *
     * `.qaul.sys.ble.BleError error_reason = 2;`
     */
    public fun clearErrorReason() {
      _builder.clearErrorReason()
    }

    /**
     * ```
     * error message
     * ```
     *
     * `string error_message = 3;`
     */
    public var errorMessage: kotlin.String
      @JvmName("getErrorMessage")
      get() = _builder.getErrorMessage()
      @JvmName("setErrorMessage")
      set(value) {
        _builder.setErrorMessage(value)
      }
    /**
     * ```
     * error message
     * ```
     *
     * `string error_message = 3;`
     */
    public fun clearErrorMessage() {
      _builder.clearErrorMessage()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.sys.ble.BleOuterClass.BleStopResult.copy(block: qaul.sys.ble.BleStopResultKt.Dsl.() -> kotlin.Unit): qaul.sys.ble.BleOuterClass.BleStopResult =
  qaul.sys.ble.BleStopResultKt.Dsl._create(this.toBuilder()).apply { block() }._build()


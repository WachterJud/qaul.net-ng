// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: connections/ble/ble.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.sys.ble;

@kotlin.jvm.JvmName("-initializebleStopRequest")
public inline fun bleStopRequest(block: qaul.sys.ble.BleStopRequestKt.Dsl.() -> kotlin.Unit): qaul.sys.ble.BleOuterClass.BleStopRequest =
  qaul.sys.ble.BleStopRequestKt.Dsl._create(qaul.sys.ble.BleOuterClass.BleStopRequest.newBuilder()).apply { block() }._build()
/**
 * ```
 * Stop Bluetooth Device
 * ```
 *
 * Protobuf type `qaul.sys.ble.BleStopRequest`
 */
public object BleStopRequestKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.sys.ble.BleOuterClass.BleStopRequest.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.sys.ble.BleOuterClass.BleStopRequest.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.sys.ble.BleOuterClass.BleStopRequest = _builder.build()
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.sys.ble.BleOuterClass.BleStopRequest.copy(block: qaul.sys.ble.BleStopRequestKt.Dsl.() -> kotlin.Unit): qaul.sys.ble.BleOuterClass.BleStopRequest =
  qaul.sys.ble.BleStopRequestKt.Dsl._create(this.toBuilder()).apply { block() }._build()


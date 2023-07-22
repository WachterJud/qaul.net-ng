// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: connections/ble/ble_rpc.proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package qaul.rpc.ble;

@kotlin.jvm.JvmName("-initializerightsResult")
public inline fun rightsResult(block: qaul.rpc.ble.RightsResultKt.Dsl.() -> kotlin.Unit): qaul.rpc.ble.BleRpc.RightsResult =
  qaul.rpc.ble.RightsResultKt.Dsl._create(qaul.rpc.ble.BleRpc.RightsResult.newBuilder()).apply { block() }._build()
/**
 * ```
 * Rights Request Results
 * ```
 *
 * Protobuf type `qaul.rpc.ble.RightsResult`
 */
public object RightsResultKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.ble.BleRpc.RightsResult.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.ble.BleRpc.RightsResult.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.ble.BleRpc.RightsResult = _builder.build()

    /**
     * `bool rights_granted = 1;`
     */
    public var rightsGranted: kotlin.Boolean
      @JvmName("getRightsGranted")
      get() = _builder.getRightsGranted()
      @JvmName("setRightsGranted")
      set(value) {
        _builder.setRightsGranted(value)
      }
    /**
     * `bool rights_granted = 1;`
     */
    public fun clearRightsGranted() {
      _builder.clearRightsGranted()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.ble.BleRpc.RightsResult.copy(block: qaul.rpc.ble.RightsResultKt.Dsl.() -> kotlin.Unit): qaul.rpc.ble.BleRpc.RightsResult =
  qaul.rpc.ble.RightsResultKt.Dsl._create(this.toBuilder()).apply { block() }._build()


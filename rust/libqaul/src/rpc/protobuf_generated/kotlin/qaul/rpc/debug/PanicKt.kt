//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: rpc/debug.proto

package qaul.rpc.debug;

@kotlin.jvm.JvmName("-initializepanic")
public inline fun panic(block: qaul.rpc.debug.PanicKt.Dsl.() -> kotlin.Unit): qaul.rpc.debug.DebugOuterClass.Panic =
  qaul.rpc.debug.PanicKt.Dsl._create(qaul.rpc.debug.DebugOuterClass.Panic.newBuilder()).apply { block() }._build()
public object PanicKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.rpc.debug.DebugOuterClass.Panic.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.debug.DebugOuterClass.Panic.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.debug.DebugOuterClass.Panic = _builder.build()
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.rpc.debug.DebugOuterClass.Panic.copy(block: qaul.rpc.debug.PanicKt.Dsl.() -> kotlin.Unit): qaul.rpc.debug.DebugOuterClass.Panic =
  qaul.rpc.debug.PanicKt.Dsl._create(this.toBuilder()).apply { block() }._build()


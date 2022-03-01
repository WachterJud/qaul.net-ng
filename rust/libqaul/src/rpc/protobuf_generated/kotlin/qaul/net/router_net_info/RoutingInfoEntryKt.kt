//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: router/router_net_info.proto

package qaul.net.router_net_info;

@kotlin.jvm.JvmSynthetic
public inline fun routingInfoEntry(block: qaul.net.router_net_info.RoutingInfoEntryKt.Dsl.() -> kotlin.Unit): qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry =
  qaul.net.router_net_info.RoutingInfoEntryKt.Dsl._create(qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry.newBuilder()).apply { block() }._build()
public object RoutingInfoEntryKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry = _builder.build()

    /**
     * <pre>
     *&#47; user id
     * </pre>
     *
     * <code>bytes user = 1;</code>
     */
    public var user: com.google.protobuf.ByteString
      @JvmName("getUser")
      get() = _builder.getUser()
      @JvmName("setUser")
      set(value) {
        _builder.setUser(value)
      }
    /**
     * <pre>
     *&#47; user id
     * </pre>
     *
     * <code>bytes user = 1;</code>
     */
    public fun clearUser() {
      _builder.clearUser()
    }

    /**
     * <pre>
     *&#47; round trip time
     * </pre>
     *
     * <code>uint32 rtt = 2;</code>
     */
    public var rtt: kotlin.Int
      @JvmName("getRtt")
      get() = _builder.getRtt()
      @JvmName("setRtt")
      set(value) {
        _builder.setRtt(value)
      }
    /**
     * <pre>
     *&#47; round trip time
     * </pre>
     *
     * <code>uint32 rtt = 2;</code>
     */
    public fun clearRtt() {
      _builder.clearRtt()
    }

    /**
     * <pre>
     *&#47; hop count
     * </pre>
     *
     * <code>bytes hc = 3;</code>
     */
    public var hc: com.google.protobuf.ByteString
      @JvmName("getHc")
      get() = _builder.getHc()
      @JvmName("setHc")
      set(value) {
        _builder.setHc(value)
      }
    /**
     * <pre>
     *&#47; hop count
     * </pre>
     *
     * <code>bytes hc = 3;</code>
     */
    public fun clearHc() {
      _builder.clearHc()
    }

    /**
     * <pre>
     *&#47; package loss
     * </pre>
     *
     * <code>float pl = 4;</code>
     */
    public var pl: kotlin.Float
      @JvmName("getPl")
      get() = _builder.getPl()
      @JvmName("setPl")
      set(value) {
        _builder.setPl(value)
      }
    /**
     * <pre>
     *&#47; package loss
     * </pre>
     *
     * <code>float pl = 4;</code>
     */
    public fun clearPl() {
      _builder.clearPl()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry.copy(block: qaul.net.router_net_info.RoutingInfoEntryKt.Dsl.() -> kotlin.Unit): qaul.net.router_net_info.RouterNetInfo.RoutingInfoEntry =
  qaul.net.router_net_info.RoutingInfoEntryKt.Dsl._create(this.toBuilder()).apply { block() }._build()

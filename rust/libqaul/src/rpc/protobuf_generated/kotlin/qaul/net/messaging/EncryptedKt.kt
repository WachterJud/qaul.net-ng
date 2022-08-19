//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: services/messaging/messaging.proto

package qaul.net.messaging;

@kotlin.jvm.JvmName("-initializeencrypted")
inline fun encrypted(block: qaul.net.messaging.EncryptedKt.Dsl.() -> kotlin.Unit): qaul.net.messaging.MessagingOuterClass.Encrypted =
  qaul.net.messaging.EncryptedKt.Dsl._create(qaul.net.messaging.MessagingOuterClass.Encrypted.newBuilder()).apply { block() }._build()
object EncryptedKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  class Dsl private constructor(
    private val _builder: qaul.net.messaging.MessagingOuterClass.Encrypted.Builder
  ) {
    companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.net.messaging.MessagingOuterClass.Encrypted.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.net.messaging.MessagingOuterClass.Encrypted = _builder.build()

    /**
     * <pre>
     *repeated Data data = 1;
     * </pre>
     *
     * <code>bytes data = 1;</code>
     */
    var data: com.google.protobuf.ByteString
      @JvmName("getData")
      get() = _builder.getData()
      @JvmName("setData")
      set(value) {
        _builder.setData(value)
      }
    /**
     * <pre>
     *repeated Data data = 1;
     * </pre>
     *
     * <code>bytes data = 1;</code>
     */
    fun clearData() {
      _builder.clearData()
    }
  }
}
@kotlin.jvm.JvmSynthetic
inline fun qaul.net.messaging.MessagingOuterClass.Encrypted.copy(block: qaul.net.messaging.EncryptedKt.Dsl.() -> kotlin.Unit): qaul.net.messaging.MessagingOuterClass.Encrypted =
  qaul.net.messaging.EncryptedKt.Dsl._create(this.toBuilder()).apply { block() }._build()


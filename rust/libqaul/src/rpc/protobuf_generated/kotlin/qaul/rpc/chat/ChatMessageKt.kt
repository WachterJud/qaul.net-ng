//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: services/chat/chat.proto

package qaul.rpc.chat;

@kotlin.jvm.JvmName("-initializechatMessage")
inline fun chatMessage(block: qaul.rpc.chat.ChatMessageKt.Dsl.() -> kotlin.Unit): qaul.rpc.chat.ChatOuterClass.ChatMessage =
  qaul.rpc.chat.ChatMessageKt.Dsl._create(qaul.rpc.chat.ChatOuterClass.ChatMessage.newBuilder()).apply { block() }._build()
object ChatMessageKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  class Dsl private constructor(
    private val _builder: qaul.rpc.chat.ChatOuterClass.ChatMessage.Builder
  ) {
    companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.rpc.chat.ChatOuterClass.ChatMessage.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.rpc.chat.ChatOuterClass.ChatMessage = _builder.build()

    /**
     * <pre>
     * index
     * </pre>
     *
     * <code>uint64 index = 1;</code>
     */
    var index: kotlin.Long
      @JvmName("getIndex")
      get() = _builder.getIndex()
      @JvmName("setIndex")
      set(value) {
        _builder.setIndex(value)
      }
    /**
     * <pre>
     * index
     * </pre>
     *
     * <code>uint64 index = 1;</code>
     */
    fun clearIndex() {
      _builder.clearIndex()
    }

    /**
     * <pre>
     * id of the sending user
     * </pre>
     *
     * <code>bytes sender_id = 2;</code>
     */
    var senderId: com.google.protobuf.ByteString
      @JvmName("getSenderId")
      get() = _builder.getSenderId()
      @JvmName("setSenderId")
      set(value) {
        _builder.setSenderId(value)
      }
    /**
     * <pre>
     * id of the sending user
     * </pre>
     *
     * <code>bytes sender_id = 2;</code>
     */
    fun clearSenderId() {
      _builder.clearSenderId()
    }

    /**
     * <pre>
     * message id or member id
     * </pre>
     *
     * <code>bytes message_id = 3;</code>
     */
    var messageId: com.google.protobuf.ByteString
      @JvmName("getMessageId")
      get() = _builder.getMessageId()
      @JvmName("setMessageId")
      set(value) {
        _builder.setMessageId(value)
      }
    /**
     * <pre>
     * message id or member id
     * </pre>
     *
     * <code>bytes message_id = 3;</code>
     */
    fun clearMessageId() {
      _builder.clearMessageId()
    }

    /**
     * <pre>
     * message status
     * </pre>
     *
     * <code>.qaul.rpc.chat.MessageStatus status = 4;</code>
     */
     var status: qaul.rpc.chat.ChatOuterClass.MessageStatus
      @JvmName("getStatus")
      get() = _builder.getStatus()
      @JvmName("setStatus")
      set(value) {
        _builder.setStatus(value)
      }
    /**
     * <pre>
     * message status
     * </pre>
     *
     * <code>.qaul.rpc.chat.MessageStatus status = 4;</code>
     */
    fun clearStatus() {
      _builder.clearStatus()
    }

    /**
     * <pre>
     * conversation id
     * </pre>
     *
     * <code>bytes conversation_id = 5;</code>
     */
    var conversationId: com.google.protobuf.ByteString
      @JvmName("getConversationId")
      get() = _builder.getConversationId()
      @JvmName("setConversationId")
      set(value) {
        _builder.setConversationId(value)
      }
    /**
     * <pre>
     * conversation id
     * </pre>
     *
     * <code>bytes conversation_id = 5;</code>
     */
    fun clearConversationId() {
      _builder.clearConversationId()
    }

    /**
     * <pre>
     * time when the message was sent
     * </pre>
     *
     * <code>uint64 sent_at = 6;</code>
     */
    var sentAt: kotlin.Long
      @JvmName("getSentAt")
      get() = _builder.getSentAt()
      @JvmName("setSentAt")
      set(value) {
        _builder.setSentAt(value)
      }
    /**
     * <pre>
     * time when the message was sent
     * </pre>
     *
     * <code>uint64 sent_at = 6;</code>
     */
    fun clearSentAt() {
      _builder.clearSentAt()
    }

    /**
     * <pre>
     * time when the message was received
     * </pre>
     *
     * <code>uint64 received_at = 7;</code>
     */
    var receivedAt: kotlin.Long
      @JvmName("getReceivedAt")
      get() = _builder.getReceivedAt()
      @JvmName("setReceivedAt")
      set(value) {
        _builder.setReceivedAt(value)
      }
    /**
     * <pre>
     * time when the message was received
     * </pre>
     *
     * <code>uint64 received_at = 7;</code>
     */
    fun clearReceivedAt() {
      _builder.clearReceivedAt()
    }

    /**
     * <pre>
     * content type
     * </pre>
     *
     * <code>.qaul.rpc.chat.ContentType content_type = 8;</code>
     */
     var contentType: qaul.rpc.chat.ChatOuterClass.ContentType
      @JvmName("getContentType")
      get() = _builder.getContentType()
      @JvmName("setContentType")
      set(value) {
        _builder.setContentType(value)
      }
    /**
     * <pre>
     * content type
     * </pre>
     *
     * <code>.qaul.rpc.chat.ContentType content_type = 8;</code>
     */
    fun clearContentType() {
      _builder.clearContentType()
    }

    /**
     * <pre>
     * content of the message
     * </pre>
     *
     * <code>bytes content = 9;</code>
     */
    var content: com.google.protobuf.ByteString
      @JvmName("getContent")
      get() = _builder.getContent()
      @JvmName("setContent")
      set(value) {
        _builder.setContent(value)
      }
    /**
     * <pre>
     * content of the message
     * </pre>
     *
     * <code>bytes content = 9;</code>
     */
    fun clearContent() {
      _builder.clearContent()
    }
  }
}
@kotlin.jvm.JvmSynthetic
inline fun qaul.rpc.chat.ChatOuterClass.ChatMessage.copy(block: qaul.rpc.chat.ChatMessageKt.Dsl.() -> kotlin.Unit): qaul.rpc.chat.ChatOuterClass.ChatMessage =
  qaul.rpc.chat.ChatMessageKt.Dsl._create(this.toBuilder()).apply { block() }._build()


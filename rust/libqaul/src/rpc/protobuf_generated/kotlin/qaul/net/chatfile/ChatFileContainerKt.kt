//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: services/chat/chatfile_net.proto

package qaul.net.chatfile;

@kotlin.jvm.JvmName("-initializechatFileContainer")
inline fun chatFileContainer(block: qaul.net.chatfile.ChatFileContainerKt.Dsl.() -> kotlin.Unit): qaul.net.chatfile.ChatfileNet.ChatFileContainer =
  qaul.net.chatfile.ChatFileContainerKt.Dsl._create(qaul.net.chatfile.ChatfileNet.ChatFileContainer.newBuilder()).apply { block() }._build()
object ChatFileContainerKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  class Dsl private constructor(
    private val _builder: qaul.net.chatfile.ChatfileNet.ChatFileContainer.Builder
  ) {
    companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: qaul.net.chatfile.ChatfileNet.ChatFileContainer.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): qaul.net.chatfile.ChatfileNet.ChatFileContainer = _builder.build()

    /**
     * <pre>
     * Chat File Info Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileInfo file_info = 1;</code>
     */
    var fileInfo: qaul.net.chatfile.ChatfileNet.ChatFileInfo
      @JvmName("getFileInfo")
      get() = _builder.getFileInfo()
      @JvmName("setFileInfo")
      set(value) {
        _builder.setFileInfo(value)
      }
    /**
     * <pre>
     * Chat File Info Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileInfo file_info = 1;</code>
     */
    fun clearFileInfo() {
      _builder.clearFileInfo()
    }
    /**
     * <pre>
     * Chat File Info Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileInfo file_info = 1;</code>
     * @return Whether the fileInfo field is set.
     */
    fun hasFileInfo(): kotlin.Boolean {
      return _builder.hasFileInfo()
    }

    /**
     * <pre>
     * Chat File Data Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileData file_data = 2;</code>
     */
    var fileData: qaul.net.chatfile.ChatfileNet.ChatFileData
      @JvmName("getFileData")
      get() = _builder.getFileData()
      @JvmName("setFileData")
      set(value) {
        _builder.setFileData(value)
      }
    /**
     * <pre>
     * Chat File Data Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileData file_data = 2;</code>
     */
    fun clearFileData() {
      _builder.clearFileData()
    }
    /**
     * <pre>
     * Chat File Data Message
     * </pre>
     *
     * <code>.qaul.net.chatfile.ChatFileData file_data = 2;</code>
     * @return Whether the fileData field is set.
     */
    fun hasFileData(): kotlin.Boolean {
      return _builder.hasFileData()
    }
    val messageCase: qaul.net.chatfile.ChatfileNet.ChatFileContainer.MessageCase
      @JvmName("getMessageCase")
      get() = _builder.getMessageCase()

    fun clearMessage() {
      _builder.clearMessage()
    }
  }
}
@kotlin.jvm.JvmSynthetic
inline fun qaul.net.chatfile.ChatfileNet.ChatFileContainer.copy(block: qaul.net.chatfile.ChatFileContainerKt.Dsl.() -> kotlin.Unit): qaul.net.chatfile.ChatfileNet.ChatFileContainer =
  qaul.net.chatfile.ChatFileContainerKt.Dsl._create(this.toBuilder()).apply { block() }._build()

val qaul.net.chatfile.ChatfileNet.ChatFileContainerOrBuilder.fileInfoOrNull: qaul.net.chatfile.ChatfileNet.ChatFileInfo?
  get() = if (hasFileInfo()) getFileInfo() else null

val qaul.net.chatfile.ChatfileNet.ChatFileContainerOrBuilder.fileDataOrNull: qaul.net.chatfile.ChatfileNet.ChatFileData?
  get() = if (hasFileData()) getFileData() else null


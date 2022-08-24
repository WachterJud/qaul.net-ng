part of '../tab.dart';

class _Chat extends BaseTab {
  const _Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends _BaseTabState<_Chat> {
  final _log = Logger('BaseTab.chat');

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletBreakpoint;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    useEffect(() {
      ref.read(chatNotificationControllerProvider).initialize();
      return () {};
    }, []);

    final defaultUser = ref.watch(defaultUserProvider)!;
    final users = ref.watch(usersProvider);
    final chatRooms = ref.watch(chatRoomsProvider);

    final blockedIds =
        users.where((u) => u.isBlocked ?? false).map((u) => u.conversationId);
    final filteredRooms = chatRooms
        .where((m) => !blockedIds.contains(m.conversationId))
        .toList()
      ..sort();

    final refreshChats = useCallback(() async {
      final worker = ref.read(qaulWorkerProvider);
      worker.getAllChatRooms();
    }, [UniqueKey()]);

    final l18ns = AppLocalizations.of(context);

    final currentOpenChat = useState<Widget?>(null);
    final setOpenChat = useCallback((ChatRoom room, [User? otherUser]) {
      assert(room.isGroupChatRoom || otherUser != null);
      if (MediaQuery.of(context).size.width < kTabletBreakpoint) {
        openChat(room,
            context: context, user: defaultUser, otherUser: otherUser);
      } else {
        currentOpenChat.value = ChatScreen(
          room,
          defaultUser,
          () => currentOpenChat.value = null,
          otherUser: otherUser,
        );
      }
    }, []);

    final chatRoomsListView = CronTaskDecorator(
      callback: () => refreshChats(),
      schedule: const Duration(milliseconds: 500),
      child: RefreshIndicator(
        onRefresh: () => refreshChats(),
        child: EmptyStateTextDecorator(
          l18ns!.emptyChatsList,
          isEmpty: filteredRooms.isEmpty,
          child: ListView.separated(
            controller: ScrollController(),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: filteredRooms.length,
            separatorBuilder: (_, __) => const Divider(height: 12.0),
            itemBuilder: (_, i) {
              var theme = Theme.of(context).textTheme;
              final room = filteredRooms[i];
              if (room.isGroupChatRoom) {
                return GroupListTile(
                  room,
                  content: _contentFromOverview(
                    room.lastMessagePreview,
                    theme,
                    users: users,
                  ),
                  trailingMetadata: Row(
                    children: [
                      Text(
                        room.lastMessageTime == null
                            ? ''
                            : describeFuzzyTimestamp(
                                room.lastMessageTime!,
                                locale:
                                    Locale.parse(Intl.defaultLocale ?? 'en'),
                              ),
                        style: theme.caption!
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () => setOpenChat(room),
                );
              }

              final otherUser = users.firstWhereOrNull((u) =>
                  u.conversationId != null &&
                  u.conversationId!.equals(room.conversationId));

              if (otherUser == null) {
                _log.warning('single-person room with unknown otherUser');
                return const SizedBox.shrink();
              }

              return UserListTile(
                otherUser,
                content: _contentFromOverview(
                  room.lastMessagePreview,
                  theme,
                  users: users,
                ),
                trailingMetadata: Row(
                  children: [
                    Text(
                      room.lastMessageTime == null
                          ? ''
                          : describeFuzzyTimestamp(
                              room.lastMessageTime!,
                              locale: Locale.parse(Intl.defaultLocale ?? 'en'),
                            ),
                      style:
                          theme.caption!.copyWith(fontStyle: FontStyle.italic),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => setOpenChat(room, otherUser),
              );
            },
          ),
        ),
      ),
    );

    final createChatButton = FloatingActionButton(
      heroTag: 'chatTabFAB',
      tooltip: l18ns.newChatTooltip,
      onPressed: () async {
        final newChat = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const _CreateNewRoomDialog()),
        );
        if (newChat is User) {
          final newRoom = ChatRoom.blank(user: defaultUser, otherUser: newChat);
          setOpenChat(newRoom, newChat);
        } else if (newChat is GroupInfo) {
          throw UnimplementedError('Open Group chat');
        }
      },
      child: SvgPicture.asset(
        'assets/icons/comment.svg',
        width: 24,
        height: 24,
        color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
      ),
    );

    return ResponsiveLayout(
      mobileBody: Scaffold(
        body: chatRoomsListView,
        floatingActionButton: createChatButton,
      ),
      tabletBody: Row(
        children: [
          ConstrainedBox(
            constraints: kSideMenuWidthConstraints,
            child: Stack(
              children: [
                chatRoomsListView,
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  end: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: createChatButton,
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Scaffold(
              body: currentOpenChat.value ??
                  const Center(child: Text('No open chats')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentFromOverview(
    MessageContent? message,
    TextTheme theme, {
    required List<User> users,
  }) {
    if (message is TextMessageContent) {
      return Text(
        (message).content,
        style: theme.bodyText1,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    } else if (message is GroupEventContent) {
      final u =
          users.firstWhereOrNull((e) => e.idBase58 == message.userIdBase58);
      if (u == null) {
        _log.warning('group event message from unknown user');
        return const SizedBox.shrink();
      }
      if (message.type == GroupEventContentType.none) {
        return const SizedBox.shrink();
      }

      return Text(
        '"${u.name}" has ${message.type == GroupEventContentType.joined ? 'joined' : 'left'} the group',
        style: theme.bodyText1!.copyWith(fontStyle: FontStyle.italic),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    } else if (message is FileShareContent) {
      return Text(
        '${message.fileName} · ${filesize(message.size)}',
        maxLines: 2,
        style: theme.bodyText1!.copyWith(fontStyle: FontStyle.italic),
        overflow: TextOverflow.ellipsis,
      );
    } else {
      _log.fine('overview type ${message.runtimeType} has not been rendered');
      return const SizedBox.shrink();
    }
  }
}

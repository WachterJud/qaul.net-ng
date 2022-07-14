part of 'tab.dart';

class _Chat extends BaseTab {
  const _Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends _BaseTabState<_Chat> {
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
        users.where((u) => u.isBlocked ?? false).map((u) => u.id);
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
    final setOpenChat = useCallback((ChatRoom room, User otherUser) {
      if (MediaQuery.of(context).size.width < kTabletBreakpoint) {
        openChat(room,
            context: context, user: defaultUser, otherUser: otherUser);
      } else {
        currentOpenChat.value = ChatScreen(
            room, defaultUser, otherUser, () => currentOpenChat.value = null);
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
              final otherUser = users
                  .firstWhereOrNull((u) => u.id.equals(room.conversationId));

              // TODO error handling?
              if (otherUser == null) return const SizedBox.shrink();

              return UserListTile(
                otherUser,
                content: Text(
                  room.lastMessagePreview ?? '',
                  style: theme.bodyText1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
        final user = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const _CreateNewRoomDialog()),
        );
        if (user is User) {
          final newRoom = ChatRoom.blank(user: defaultUser, otherUser: user);
          setOpenChat(newRoom, user);
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
}

class _CreateNewRoomDialog extends StatelessWidget {
  const _CreateNewRoomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchUserDecorator(
      title: AppLocalizations.of(context)!.newChatTooltip,
      builder: (_, users) {
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: users.length,
          separatorBuilder: (_, __) => const Divider(height: 12.0),
          itemBuilder: (context, i) {
            final usr = users[i];
            return UserListTile(usr, onTap: () => Navigator.pop(context, usr));
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/chat/ui/chat_input.dart';
import 'package:speed_bate_frontend/chat/ui/chat_starting_overlay.dart';
import 'package:speed_bate_frontend/chat/ui/chat_toolbar.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/chat/ui/match_help_bottom_modal.dart.dart';
import 'package:speed_bate_frontend/chat/ui/scrollable_message_list.dart';
import 'package:speed_bate_frontend/home/ui/home.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/real_time_messaging_websocket.dart';

class Chat extends StatelessWidget {
  const Chat({
    required this.opponentId,
    required this.matchId,
    required this.topic,
    super.key,
  });

  final String opponentId;
  final String matchId;
  final String topic;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: RealTimeMessagingWebsocket(
          chatMatchStatus: ChatMatchStatus.starting,
          channel: RealTimeMessagingWebsocket.initializeChannel(
            matchId: matchId,
            token: context.read<User>().token,
          ),
          matchId: matchId,
          opponentId: opponentId,
        ),
        child: Selector0<ChatViewModel>(
          selector: (context) => ChatViewModel.fromState(
            user: context.watch(),
            opponentId: opponentId,
            matchId: matchId,
            debateTopic: topic,
            dispatcher: StoreProvider.of<AppState>(context).dispatch,
            realTimeMessagingWebsocket: context.watch(),
            onLeaveMatch: () => Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Home(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0); // Slide from left to right
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            ),
            showHelpModal: () => showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              builder: (context) => MatchHelpBottomModal(
                debateTopic: topic,
              ),
            ),
          ),
          builder: (context, viewModel, _) => ChatScreen(
            viewModel: viewModel,
          ),
        ),
      );
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.viewModel,
    super.key,
  });

  final ChatViewModel viewModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();

    // TODO: show overlay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: chatToolbar(
            chatMatchStatus: widget.viewModel.chatMatchStatus,
            showHelpModal: widget.viewModel.showHelp,
            onMatchEnd: widget.viewModel.onMatchEnd,
            onLeaveMatch: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Leave Match?'),
                content: const Text(
                    'Are you sure you want to leave the match? You will not be able to rejoin.'),
                actions: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Colors.grey[500]?.withOpacity(1)),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.viewModel.onLeaveMatch();
                    },
                    child: const Text('Leave'),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                const ScrollableMessageList(),
                const Divider(),
                ChatInput(
                  opponentId: widget.viewModel.opponentId,
                  matchId: widget.viewModel.matchId,
                ),
              ],
            ),
          ),
        ),
        if (widget.viewModel.chatMatchStatus == ChatMatchStatus.starting)
          ChatStartingOverlay(
            debateTopic: widget.viewModel.debateTopic,
            setChatMatchStatus: widget.viewModel.setChatMatchStatus,
          )
      ],
    );
  }
}

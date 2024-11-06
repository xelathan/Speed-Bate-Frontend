import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/chat/ui/chat_input_view_model.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/state.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({
    required this.opponentId,
    required this.matchId,
    super.key,
  });

  final String opponentId;
  final String matchId;

  @override
  Widget build(BuildContext context) => Selector0<ChatInputViewModel>(
        selector: (context) => ChatInputViewModel.fromState(
          dispatcher: StoreProvider.of<AppState>(context).dispatch,
          matchId: matchId,
          opponentId: opponentId,
          user: context.watch(),
          realTimeMessagingWebsocket: context.watch(),
        ),
        builder: (context, viewModel, _) => ChatInputScreen(
          viewModel: viewModel,
        ),
      );
}

class ChatInputScreen extends StatefulWidget {
  const ChatInputScreen({
    required this.viewModel,
    super.key,
  });

  final ChatInputViewModel viewModel;

  @override
  State<ChatInputScreen> createState() => _ChatInputScreenState();
}

class _ChatInputScreenState extends State<ChatInputScreen> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                TextField(
                  controller: _textEditingController,
                  cursorColor: const Color.fromRGBO(0, 122, 255, 1),
                  minLines: 1, // Starts with a single line
                  maxLines: 5, // Expands up to 5 lines
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                  ),
                ),
                // Positioned IconButton at the bottom right
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.orange,
                    onPressed: _textEditingController.text.isNotEmpty &&
                            widget.viewModel.chatMatchStatus ==
                                ChatMatchStatus.inProgress
                        ? () {
                            widget.viewModel
                                .sendMessage(_textEditingController.text);
                            _textEditingController.clear();
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

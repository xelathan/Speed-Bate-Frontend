import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speed_bate_frontend/chat/ui/scrollable_message_list_view_model.dart';

class ScrollableMessageList extends StatelessWidget {
  const ScrollableMessageList({super.key});

  @override
  Widget build(BuildContext context) =>
      Selector0<ScrollableMessageListViewModel>(
        selector: (context) => ScrollableMessageListViewModel.fromState(
          realTimeMessagingWebsocket: context.watch(),
          user: context.watch(),
        ),
        builder: (context, viewModel, _) => _ScrollableMessageList(
          viewModel: viewModel,
        ),
      );
}

class _ScrollableMessageList extends StatelessWidget {
  const _ScrollableMessageList({
    required this.viewModel,
  });

  final ScrollableMessageListViewModel viewModel;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Scrollbar(
          child: ListView.builder(
              itemCount: viewModel.messages.length,
              itemBuilder: (context, index) {
                return _MessageItem(
                  text: viewModel.messages[index].message,
                  isSender:
                      viewModel.messages[index].userId == viewModel.userId,
                );
              }),
        ),
      );
}

class _MessageItem extends StatelessWidget {
  final String text;
  final bool isSender;

  const _MessageItem({
    required this.text,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isSender ? Colors.orange : Colors.grey[500],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isSender ? const Radius.circular(12) : Radius.zero,
            bottomRight: isSender ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

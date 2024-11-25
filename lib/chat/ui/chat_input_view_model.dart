// ignore_for_file: annotate_overrides

import 'package:flutter/widgets.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/chat/actions.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/real_time_messaging_websocket.dart';

part 'chat_input_view_model.g.dart';

@immutable
@FunctionalData()
class ChatInputViewModel extends _$ChatInputViewModel {
  const ChatInputViewModel({
    required this.sendMessage,
    required this.chatMatchStatus,
  });

  factory ChatInputViewModel.fromState({
    required void Function(dynamic) dispatcher,
    required String matchId,
    required String opponentId,
    required User user,
    required RealTimeMessagingWebsocket realTimeMessagingWebsocket,
  }) =>
      ChatInputViewModel(
        sendMessage: (text) => dispatcher(
          SendMessageAction(
            text: text,
            matchId: matchId,
            opponentId: opponentId,
            userId: user.token,
            realTimeMessagingWebsocket: realTimeMessagingWebsocket,
          ),
        ),
        chatMatchStatus: realTimeMessagingWebsocket.chatMatchStatus,
      );

  final void Function(String) sendMessage;
  final ChatMatchStatus chatMatchStatus;
}

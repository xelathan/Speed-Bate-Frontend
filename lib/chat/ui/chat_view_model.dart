// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/chat/actions.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/real_time_messaging_websocket.dart';

part 'chat_view_model.g.dart';

enum ChatMatchStatus {
  starting,
  inProgress,
  ended,
}

@immutable
@FunctionalData()
class ChatViewModel extends _$ChatViewModel {
  const ChatViewModel({
    required this.userId,
    required this.opponentId,
    required this.matchId,
    required this.debateTopic,
    required this.initialize,
    required this.onMatchEnd,
    required this.onLeaveMatch,
    required this.chatMatchStatus,
    required this.showHelp,
    required this.setChatMatchStatus,
  });

  factory ChatViewModel.fromState({
    required UserModel user,
    required String opponentId,
    required String matchId,
    required String debateTopic,
    required void Function(dynamic) dispatcher,
    required RealTimeMessagingWebsocket realTimeMessagingWebsocket,
    required VoidCallback onLeaveMatch,
    required VoidCallback showHelpModal,
  }) =>
      ChatViewModel(
        userId: user.userId,
        opponentId: opponentId,
        matchId: matchId,
        debateTopic: debateTopic,
        initialize: () => realTimeMessagingWebsocket.listenForMessages(),
        onMatchEnd: () => dispatcher(
          EndMatchAction(
            realTimeMessagingWebsocket: realTimeMessagingWebsocket,
          ),
        ),
        onLeaveMatch: () {
          dispatcher(
            LeaveMatchAction(
              realTimeMessagingWebsocket: realTimeMessagingWebsocket,
              setMatchingStatusFree: () =>
                  user.setMatchingStatus = UserMatchingStatus.free,
              userId: user.userId,
            ),
          );
          onLeaveMatch();
        },
        chatMatchStatus: realTimeMessagingWebsocket.chatMatchStatus,
        showHelp: showHelpModal,
        setChatMatchStatus: (chatMatchStatus) =>
            realTimeMessagingWebsocket.chatMatchStatus = chatMatchStatus,
      );

  final String userId;
  final String opponentId;
  final String matchId;
  final String debateTopic;
  final VoidCallback onMatchEnd;
  final VoidCallback initialize;
  final VoidCallback onLeaveMatch;
  final ChatMatchStatus chatMatchStatus;
  final void Function(ChatMatchStatus) setChatMatchStatus;
  final VoidCallback showHelp;
}

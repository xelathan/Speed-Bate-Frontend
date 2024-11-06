import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/websockets/real_time_messaging_websocket.dart';

sealed class ChatActions {}

class SendMessageAction extends ChatActions {
  SendMessageAction({
    required this.text,
    required this.userId,
    required this.opponentId,
    required this.matchId,
    required this.realTimeMessagingWebsocket,
  });

  final String text;
  final String userId;
  final String opponentId;
  final String matchId;
  final RealTimeMessagingWebsocket realTimeMessagingWebsocket;
}

class EndMatchAction extends ChatActions {
  EndMatchAction({
    required this.realTimeMessagingWebsocket,
  });

  final RealTimeMessagingWebsocket realTimeMessagingWebsocket;
}

class LeaveMatchAction extends ChatActions {
  LeaveMatchAction(
      {required this.realTimeMessagingWebsocket,
      required this.setMatchingStatusFree,
      required this.userId});

  final RealTimeMessagingWebsocket realTimeMessagingWebsocket;
  final VoidCallback setMatchingStatusFree;
  final String userId;
}

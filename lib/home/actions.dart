import 'dart:ui';

import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/matchmaking_websocket.dart';

sealed class HomeActions {}

class StartMatchmakingAction extends HomeActions {
  StartMatchmakingAction({
    required this.userId,
    required this.onMatchFound,
    required this.setMatchingStatus,
    required this.matchmakingWebsocket,
  });

  final String userId;
  final void Function(String, String, String) onMatchFound;
  final void Function(UserMatchingStatus) setMatchingStatus;
  final MatchmakingWebsocket matchmakingWebsocket;
}

class CancelMatchmakingAction extends HomeActions {
  CancelMatchmakingAction({
    required this.userId,
    required this.setIsMatching,
    required this.matchmakingWebsocket,
  });

  final String userId;
  final VoidCallback setIsMatching;
  final MatchmakingWebsocket matchmakingWebsocket;
}

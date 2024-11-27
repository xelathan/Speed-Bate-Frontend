import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/matchmaking_websocket.dart';

sealed class HomeActions {}

class StartMatchmakingAction extends HomeActions {
  StartMatchmakingAction({
    required this.onMatchFound,
    required this.setMatchingStatus,
    required this.matchmakingWebsocket,
  });

  final void Function(String, String, String) onMatchFound;
  final void Function(UserMatchingStatus) setMatchingStatus;
  final MatchmakingWebsocket matchmakingWebsocket;
}

class CancelMatchmakingAction extends HomeActions {
  CancelMatchmakingAction({
    required this.setIsMatching,
    required this.matchmakingWebsocket,
  });

  final VoidCallback setIsMatching;
  final MatchmakingWebsocket matchmakingWebsocket;
}

sealed class VerifyPhoneNumberActions {}

@immutable
class VerifyPhoneNumberAction extends VerifyPhoneNumberActions {
  VerifyPhoneNumberAction({
    required this.code,
    required this.client,
    required this.setIsVerified,
    required this.toHomeScreen,
    required this.setError,
  });

  final String code;
  final GraphQlClientProvider client;
  final VoidCallback setIsVerified;
  final VoidCallback toHomeScreen;
  final void Function(String) setError;
}

@immutable
class GenerateNewCodeAction extends VerifyPhoneNumberActions {
  GenerateNewCodeAction({
    required this.client,
  });

  final GraphQlClientProvider client;
}

// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/matchmaking_websocket.dart';

part 'home_screen_view_model.g.dart';

@immutable
@FunctionalData()
class HomeScreenViewModel extends _$HomeScreenViewModel {
  const HomeScreenViewModel({
    required this.userId,
    required this.startMatchmaking,
    required this.matchingStatus,
    required this.cancelMatchmaking,
  });

  factory HomeScreenViewModel.fromState({
    required UserModel user,
    required void Function(dynamic) dispatcher,
    required void Function(String, String, String) toChatScreen,
    required MatchmakingWebsocket matchmakingWebsocket,
  }) =>
      HomeScreenViewModel(
        userId: user.userId,
        startMatchmaking: () => dispatcher(
          StartMatchmakingAction(
            userId: user.userId,
            onMatchFound: (opponentId, matchId, topic) =>
                toChatScreen(opponentId, matchId, topic),
            setMatchingStatus: (val) => user.setMatchingStatus = val,
            matchmakingWebsocket: matchmakingWebsocket,
          ),
        ),
        matchingStatus: user.matchingStatus,
        cancelMatchmaking: () => dispatcher(
          CancelMatchmakingAction(
            userId: user.userId,
            setIsMatching: () =>
                user.setMatchingStatus = UserMatchingStatus.free,
            matchmakingWebsocket: matchmakingWebsocket,
          ),
        ),
      );

  final String userId;
  final VoidCallback startMatchmaking;
  final VoidCallback cancelMatchmaking;
  final UserMatchingStatus matchingStatus;
}

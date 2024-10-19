import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/state.dart';

void homeScreenMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) async {
  if (action is StartMatchmakingAction) {
    action.matchmakingWebsocket.channel.sink.add(
      jsonEncode(
        {
          "user_id": action.userId,
          "pause": false,
        },
      ),
    );

    action.setIsMatching(true);

    final streamSubscription =
        action.matchmakingWebsocket.channel.stream.listen((message) {
      try {
        var jsonMessage = jsonDecode(message);

        print(jsonMessage['opponent_id']);
        action.onMatchFound(
          jsonMessage['opponent_id'],
          jsonMessage['match_id'],
        );
        action.matchmakingWebsocket.channel.sink.close(1000, 'Normal closure');
      } catch (e) {
        print(message);
      }
    }, onError: (error) {
      print("WebSocket error: $error");
    }, onDone: () {
      print("done");
      action.setIsMatching(false);
      action.matchmakingWebsocket.setStreamSubscription = null;
      action.matchmakingWebsocket.reinitializeChannel();
    });

    action.matchmakingWebsocket.setStreamSubscription = streamSubscription;
  } else if (action is CancelMatchmakingAction) {
    action.matchmakingWebsocket.channel.sink.add(
      jsonEncode(
        {
          "user_id": action.userId,
          "pause": true,
        },
      ),
    );
    await action.matchmakingWebsocket.channel.sink
        .close(1000, 'Normal closure');

    action.matchmakingWebsocket.setStreamSubscription = null;
    action.matchmakingWebsocket.reinitializeChannel();
    action.setIsMatching();
  }

  next(action);
}

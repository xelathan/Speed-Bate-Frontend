import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

void homeScreenMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) async {
  if (action is StartMatchmakingAction) {
    action.matchmakingWebsocket.initializeChannel();

    action.matchmakingWebsocket.sendRequest(true);
    action.setMatchingStatus(UserMatchingStatus.matching);

    action.matchmakingWebsocket.listenForRequests(
      onMatchFound: action.onMatchFound,
      setMatchingStatus: action.setMatchingStatus,
    );
  } else if (action is CancelMatchmakingAction) {
    action.matchmakingWebsocket.sendRequest(false);
    action.matchmakingWebsocket.closeChannel();
    action.setIsMatching();
  }

  next(action);
}

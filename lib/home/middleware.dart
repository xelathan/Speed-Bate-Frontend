import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/home/utils.dart';
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
  } else if (action is VerifyPhoneNumberAction) {
    try {
      await verifyPhoneNumber(
        client: action.client.client,
        code: action.code,
      );
      action.setIsVerified();
      action.toHomeScreen();
    } on gql.OperationException catch (e) {
      action.setError(e.graphqlErrors.first.message);
    } catch (e) {
      action.setError(e.toString());
    }
  } else if (action is GenerateNewCodeAction) {
    try {
      await generateNewCode(
        client: action.client.client,
      );
    } catch (e) {
      print(e);
    }
  }

  next(action);
}

import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/splash_screen/actions.dart';
import 'package:speed_bate_frontend/splash_screen/utils.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:speed_bate_frontend/actions.dart';

void splashScreenMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) {
  if (action is FetchTopicsMetaData) {
    getMultipleTopicMetaData([
      'real-time-messaging',
      'chat-room-creation',
      'matchmaking-requests'
    ]).then((metadata) {
      store.dispatch(UpdateTopicMetaData(
        metadata['real-time-messaging']!,
        metadata['chat-room-creation']!,
        metadata['matchmaking-requests']!,
      ));
    });
  }

  next(action);
}

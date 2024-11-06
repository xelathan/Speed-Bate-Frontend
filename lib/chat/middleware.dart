import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/chat/actions.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/state.dart';
import 'package:uuid/uuid.dart';

void chatMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) {
  if (action is SendMessageAction) {
    final createdAt = DateTime.now().toUtc();
    final messageId = const Uuid().v4();

    action.realTimeMessagingWebsocket.sendMessage({
      'message_id': messageId,
      'created_at': createdAt.toIso8601String(),
      'message': action.text,
      'user_id': action.userId,
      'match_id': action.matchId,
      'opponent_id': action.opponentId,
      'expired': false,
    });
  } else if (action is EndMatchAction) {
    action.realTimeMessagingWebsocket.closeChannel();
    action.realTimeMessagingWebsocket.chatMatchStatus = ChatMatchStatus.ended;
  } else if (action is LeaveMatchAction) {
    action.setMatchingStatusFree();
    if (action.realTimeMessagingWebsocket.chatMatchStatus ==
        ChatMatchStatus.inProgress) {
      action.realTimeMessagingWebsocket.sendMessage({
        'message_id': const Uuid().v4(),
        'created_at': DateTime.now().toUtc().toIso8601String(),
        'message': 'left',
        'user_id': action.userId,
        'match_id': action.realTimeMessagingWebsocket.matchId,
        'opponent_id': action.realTimeMessagingWebsocket.opponentId,
        'expired': true,
      });
    }
  }
  next(action);
}

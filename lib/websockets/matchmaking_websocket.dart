import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:speed_bate_frontend/primitives/http.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchmakingWebsocket extends ChangeNotifier with WidgetsBindingObserver {
  MatchmakingWebsocket({required this.userId});

  final String userId;

  late WebSocketChannel _channel;
  StreamSubscription? _subscription;

  WebSocketChannel get channel => _channel;

  void initializeChannel(String userId) {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(
          '$WEBSOCKET_BASE_URL$HOST:$STREAM_API_PORT/stream_api/$API_VERSION/matchmaking/start'),
      headers: {
        'x-api-key': dotenv.env['API_KEY'],
        'user-id': userId,
      },
    );
    notifyListeners();
  }

  void sendRequest(
    String userId,
    bool pause,
  ) {
    _channel.sink.add(
      jsonEncode(
        {
          "user_id": userId,
          "pause": pause,
        },
      ),
    );
  }

  void listenForRequests({
    required void Function(String, String, String) onMatchFound,
    required void Function(UserMatchingStatus) setMatchingStatus,
    required String userId,
  }) {
    _subscription = _channel.stream.listen((message) {
      try {
        var jsonMessage = jsonDecode(message);

        onMatchFound(
          jsonMessage['opponent_id'],
          jsonMessage['match_id'],
          jsonMessage['topic'],
        );
        setMatchingStatus(UserMatchingStatus.matched);
        sendRequest(userId, true);
        closeChannel();
      } catch (e) {
        print(message);
      }
    }, onError: (error) {
      print("WebSocket error: $error");
    }, onDone: () {
      print("done");
    });
  }

  void closeChannel() {
    _subscription?.cancel();
    _channel.sink.close();
    notifyListeners();
  }

  @override
  void dispose() {
    closeChannel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.paused) {
      print("app is paused");
      sendRequest(userId, true);
      closeChannel();
    }
  }
}

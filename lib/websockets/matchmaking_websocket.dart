import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchmakingWebsocket extends ChangeNotifier {
  MatchmakingWebsocket();

  WebSocketChannel channel = IOWebSocketChannel.connect(
    Uri.parse('ws://127.0.0.1:8080/stream_api/v1/matchmaking/start'),
    headers: {
      'x-api-key': dotenv.env['API_KEY'],
    },
  );

  StreamSubscription? streamSubscription;

  set setStreamSubscription(StreamSubscription? ss) {
    streamSubscription = ss;
    notifyListeners();
  }

  void reinitializeChannel() {
    channel = IOWebSocketChannel.connect(
      Uri.parse('ws://127.0.0.1:8080/stream_api/v1/matchmaking/start'),
      headers: {
        'x-api-key': dotenv.env['API_KEY'],
      },
    );
    notifyListeners();
  }
}

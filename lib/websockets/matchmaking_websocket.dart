import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchmakingWebsocket extends ChangeNotifier {
  MatchmakingWebsocket();

  WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://127.0.0.1:8080/stream_api/v1/matchmaking/start'),
  );

  StreamSubscription? streamSubscription;

  set setStreamSubscription(StreamSubscription? ss) {
    streamSubscription = ss;
    notifyListeners();
  }

  void reinitializeChannel() {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://127.0.0.1:8080/stream_api/v1/matchmaking/start'),
    );
    notifyListeners();
  }
}

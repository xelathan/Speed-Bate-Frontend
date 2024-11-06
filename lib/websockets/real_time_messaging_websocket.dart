import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/message.dart';
import 'package:speed_bate_frontend/primitives/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RealTimeMessagingWebsocket extends ChangeNotifier {
  RealTimeMessagingWebsocket({
    required ChatMatchStatus chatMatchStatus,
    required WebSocketChannel channel,
    required String opponentId,
    required String matchId,
  })  : _chatMatchStatus = chatMatchStatus,
        _channel = channel,
        _opponentId = opponentId,
        _matchId = matchId;

  WebSocketChannel _channel;

  WebSocketChannel get channel => _channel;

  List<Message> _messages = [];

  List<Message> get messages => _messages;

  StreamSubscription? _subscription;

  late ChatMatchStatus _chatMatchStatus;

  ChatMatchStatus get chatMatchStatus => _chatMatchStatus;

  String _opponentId;

  String get opponentId => _opponentId;

  String _matchId;

  String get matchId => _matchId;

  void sendMessage(Map<String, dynamic> message) {
    _channel.sink.add(
      jsonEncode(message),
    );
    _messages = List.from(_messages)..add(Message.fromJson(message));

    notifyListeners();
  }

  static WebSocketChannel initializeChannel({
    required String matchId,
    required String userId,
  }) {
    return IOWebSocketChannel.connect(
      Uri.parse(
          '$WEBSOCKET_BASE_URL$HOST:$STREAM_API_PORT/stream_api/$API_VERSION/realtime_messaging/chat'),
      headers: {
        'x-api-key': dotenv.env['API_KEY'],
        'user-id': userId,
        'match-id': matchId,
      },
    );
  }

  set chatMatchStatus(ChatMatchStatus chatMatchStatus) {
    _chatMatchStatus = chatMatchStatus;
    notifyListeners();
  }

  void showOpponentLeftToast() {
    Fluttertoast.showToast(
      msg: "Opponent left the chat",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void listenForMessages() {
    _subscription = _channel.stream.listen((message) {
      try {
        var jsonMessage = jsonDecode(message);
        final messageObject = Message.fromJson(jsonMessage);
        if (messageObject.expired) {
          chatMatchStatus = ChatMatchStatus.ended;
          showOpponentLeftToast();
          closeChannel();
        } else {
          _messages = List.from(_messages)..add(messageObject);
        }
        notifyListeners();
      } catch (e) {
        print("Error parsing message: $e");
      }
    }, onError: (error) {
      print("WebSocket error: $error");
    }, onDone: () {
      print("WebSocket connection closed");
    });
    notifyListeners();
  }

  void closeChannel() {
    _subscription?.cancel();
    _channel.sink.close(1000);
    _messages.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    closeChannel();
    super.dispose();
  }
}

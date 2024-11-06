// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/message.dart';
import 'package:speed_bate_frontend/user/user_model.dart';
import 'package:speed_bate_frontend/websockets/real_time_messaging_websocket.dart';
import 'package:collection/collection.dart';

part 'scrollable_message_list_view_model.g.dart';

@immutable
@FunctionalData()
class ScrollableMessageListViewModel extends _$ScrollableMessageListViewModel {
  const ScrollableMessageListViewModel({
    required this.messages,
    required this.userId,
  });

  factory ScrollableMessageListViewModel.fromState({
    required RealTimeMessagingWebsocket realTimeMessagingWebsocket,
    required UserModel user,
  }) =>
      ScrollableMessageListViewModel(
        messages: realTimeMessagingWebsocket.messages,
        userId: user.userId,
      );

  @CustomEquality(DeepCollectionEquality())
  final List<Message> messages;

  final String userId;
}

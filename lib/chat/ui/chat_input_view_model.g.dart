// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$ChatInputViewModel {
  const _$ChatInputViewModel();

  void Function(String) get sendMessage;
  ChatMatchStatus get chatMatchStatus;

  ChatInputViewModel copyWith({
    void Function(String)? sendMessage,
    ChatMatchStatus? chatMatchStatus,
  }) =>
      ChatInputViewModel(
        sendMessage: sendMessage ?? this.sendMessage,
        chatMatchStatus: chatMatchStatus ?? this.chatMatchStatus,
      );

  ChatInputViewModel copyUsing(
      void Function(_ChatInputViewModel$Change change) mutator) {
    final change = _ChatInputViewModel$Change._(
      this.sendMessage,
      this.chatMatchStatus,
    );
    mutator(change);
    return ChatInputViewModel(
      sendMessage: change.sendMessage,
      chatMatchStatus: change.chatMatchStatus,
    );
  }

  @override
  String toString() =>
      "ChatInputViewModel(sendMessage: $sendMessage, chatMatchStatus: $chatMatchStatus)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ChatInputViewModel &&
      other.runtimeType == runtimeType &&
      sendMessage == other.sendMessage &&
      chatMatchStatus == other.chatMatchStatus;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + sendMessage.hashCode;
    result = 37 * result + chatMatchStatus.hashCode;
    return result;
  }
}

class _ChatInputViewModel$Change {
  _ChatInputViewModel$Change._(
    this.sendMessage,
    this.chatMatchStatus,
  );

  void Function(String) sendMessage;
  ChatMatchStatus chatMatchStatus;
}

// ignore: avoid_classes_with_only_static_members
class ChatInputViewModel$ {
  static final sendMessage = Lens<ChatInputViewModel, void Function(String)>(
    (sendMessageContainer) => sendMessageContainer.sendMessage,
    (sendMessageContainer, sendMessage) =>
        sendMessageContainer.copyWith(sendMessage: sendMessage),
  );

  static final chatMatchStatus = Lens<ChatInputViewModel, ChatMatchStatus>(
    (chatMatchStatusContainer) => chatMatchStatusContainer.chatMatchStatus,
    (chatMatchStatusContainer, chatMatchStatus) =>
        chatMatchStatusContainer.copyWith(chatMatchStatus: chatMatchStatus),
  );
}

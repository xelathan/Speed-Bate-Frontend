// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrollable_message_list_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$ScrollableMessageListViewModel {
  const _$ScrollableMessageListViewModel();

  List<Message> get messages;
  String get userId;

  ScrollableMessageListViewModel copyWith({
    List<Message>? messages,
    String? userId,
  }) =>
      ScrollableMessageListViewModel(
        messages: messages ?? this.messages,
        userId: userId ?? this.userId,
      );

  ScrollableMessageListViewModel copyUsing(
      void Function(_ScrollableMessageListViewModel$Change change) mutator) {
    final change = _ScrollableMessageListViewModel$Change._(
      this.messages,
      this.userId,
    );
    mutator(change);
    return ScrollableMessageListViewModel(
      messages: change.messages,
      userId: change.userId,
    );
  }

  @override
  String toString() =>
      "ScrollableMessageListViewModel(messages: $messages, userId: $userId)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ScrollableMessageListViewModel &&
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(messages, other.messages) &&
      userId == other.userId;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(messages);
    result = 37 * result + userId.hashCode;
    return result;
  }
}

class _ScrollableMessageListViewModel$Change {
  _ScrollableMessageListViewModel$Change._(
    this.messages,
    this.userId,
  );

  List<Message> messages;
  String userId;
}

// ignore: avoid_classes_with_only_static_members
class ScrollableMessageListViewModel$ {
  static final messages = Lens<ScrollableMessageListViewModel, List<Message>>(
    (messagesContainer) => messagesContainer.messages,
    (messagesContainer, messages) =>
        messagesContainer.copyWith(messages: messages),
  );

  static final userId = Lens<ScrollableMessageListViewModel, String>(
    (userIdContainer) => userIdContainer.userId,
    (userIdContainer, userId) => userIdContainer.copyWith(userId: userId),
  );
}

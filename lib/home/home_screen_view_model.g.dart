// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$HomeScreenViewModel {
  const _$HomeScreenViewModel();

  String get userId;
  VoidCallback get startMatchmaking;
  VoidCallback get cancelMatchmaking;
  bool get isMatching;

  HomeScreenViewModel copyWith({
    String? userId,
    VoidCallback? startMatchmaking,
    VoidCallback? cancelMatchmaking,
    bool? isMatching,
  }) =>
      HomeScreenViewModel(
        userId: userId ?? this.userId,
        startMatchmaking: startMatchmaking ?? this.startMatchmaking,
        cancelMatchmaking: cancelMatchmaking ?? this.cancelMatchmaking,
        isMatching: isMatching ?? this.isMatching,
      );

  HomeScreenViewModel copyUsing(
      void Function(_HomeScreenViewModel$Change change) mutator) {
    final change = _HomeScreenViewModel$Change._(
      this.userId,
      this.startMatchmaking,
      this.cancelMatchmaking,
      this.isMatching,
    );
    mutator(change);
    return HomeScreenViewModel(
      userId: change.userId,
      startMatchmaking: change.startMatchmaking,
      cancelMatchmaking: change.cancelMatchmaking,
      isMatching: change.isMatching,
    );
  }

  @override
  String toString() =>
      "HomeScreenViewModel(userId: $userId, startMatchmaking: $startMatchmaking, cancelMatchmaking: $cancelMatchmaking, isMatching: $isMatching)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HomeScreenViewModel &&
      other.runtimeType == runtimeType &&
      userId == other.userId &&
      startMatchmaking == other.startMatchmaking &&
      cancelMatchmaking == other.cancelMatchmaking &&
      isMatching == other.isMatching;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + userId.hashCode;
    result = 37 * result + startMatchmaking.hashCode;
    result = 37 * result + cancelMatchmaking.hashCode;
    result = 37 * result + isMatching.hashCode;
    return result;
  }
}

class _HomeScreenViewModel$Change {
  _HomeScreenViewModel$Change._(
    this.userId,
    this.startMatchmaking,
    this.cancelMatchmaking,
    this.isMatching,
  );

  String userId;
  VoidCallback startMatchmaking;
  VoidCallback cancelMatchmaking;
  bool isMatching;
}

// ignore: avoid_classes_with_only_static_members
class HomeScreenViewModel$ {
  static final userId = Lens<HomeScreenViewModel, String>(
    (userIdContainer) => userIdContainer.userId,
    (userIdContainer, userId) => userIdContainer.copyWith(userId: userId),
  );

  static final startMatchmaking = Lens<HomeScreenViewModel, VoidCallback>(
    (startMatchmakingContainer) => startMatchmakingContainer.startMatchmaking,
    (startMatchmakingContainer, startMatchmaking) =>
        startMatchmakingContainer.copyWith(startMatchmaking: startMatchmaking),
  );

  static final cancelMatchmaking = Lens<HomeScreenViewModel, VoidCallback>(
    (cancelMatchmakingContainer) =>
        cancelMatchmakingContainer.cancelMatchmaking,
    (cancelMatchmakingContainer, cancelMatchmaking) =>
        cancelMatchmakingContainer.copyWith(
            cancelMatchmaking: cancelMatchmaking),
  );

  static final isMatching = Lens<HomeScreenViewModel, bool>(
    (isMatchingContainer) => isMatchingContainer.isMatching,
    (isMatchingContainer, isMatching) =>
        isMatchingContainer.copyWith(isMatching: isMatching),
  );
}

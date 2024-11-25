// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$HomeScreenViewModel {
  const _$HomeScreenViewModel();

  VoidCallback get startMatchmaking;
  VoidCallback get cancelMatchmaking;
  UserMatchingStatus get matchingStatus;

  HomeScreenViewModel copyWith({
    VoidCallback? startMatchmaking,
    VoidCallback? cancelMatchmaking,
    UserMatchingStatus? matchingStatus,
  }) =>
      HomeScreenViewModel(
        startMatchmaking: startMatchmaking ?? this.startMatchmaking,
        cancelMatchmaking: cancelMatchmaking ?? this.cancelMatchmaking,
        matchingStatus: matchingStatus ?? this.matchingStatus,
      );

  HomeScreenViewModel copyUsing(
      void Function(_HomeScreenViewModel$Change change) mutator) {
    final change = _HomeScreenViewModel$Change._(
      this.startMatchmaking,
      this.cancelMatchmaking,
      this.matchingStatus,
    );
    mutator(change);
    return HomeScreenViewModel(
      startMatchmaking: change.startMatchmaking,
      cancelMatchmaking: change.cancelMatchmaking,
      matchingStatus: change.matchingStatus,
    );
  }

  @override
  String toString() =>
      "HomeScreenViewModel(startMatchmaking: $startMatchmaking, cancelMatchmaking: $cancelMatchmaking, matchingStatus: $matchingStatus)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HomeScreenViewModel &&
      other.runtimeType == runtimeType &&
      startMatchmaking == other.startMatchmaking &&
      cancelMatchmaking == other.cancelMatchmaking &&
      matchingStatus == other.matchingStatus;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + startMatchmaking.hashCode;
    result = 37 * result + cancelMatchmaking.hashCode;
    result = 37 * result + matchingStatus.hashCode;
    return result;
  }
}

class _HomeScreenViewModel$Change {
  _HomeScreenViewModel$Change._(
    this.startMatchmaking,
    this.cancelMatchmaking,
    this.matchingStatus,
  );

  VoidCallback startMatchmaking;
  VoidCallback cancelMatchmaking;
  UserMatchingStatus matchingStatus;
}

// ignore: avoid_classes_with_only_static_members
class HomeScreenViewModel$ {
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

  static final matchingStatus = Lens<HomeScreenViewModel, UserMatchingStatus>(
    (matchingStatusContainer) => matchingStatusContainer.matchingStatus,
    (matchingStatusContainer, matchingStatus) =>
        matchingStatusContainer.copyWith(matchingStatus: matchingStatus),
  );
}

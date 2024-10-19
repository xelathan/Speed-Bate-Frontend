// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$AppState {
  const _$AppState();

  SplashScreenState get splashScreenState;
  TopicMetadataResponse? get chatroomCreationMetaData;
  TopicMetadataResponse? get realTimeMessagingMetaData;
  TopicMetadataResponse? get matchmakingMetaData;
  HomeState get homeState;

  AppState copyWith({
    SplashScreenState? splashScreenState,
    TopicMetadataResponse? chatroomCreationMetaData,
    TopicMetadataResponse? realTimeMessagingMetaData,
    TopicMetadataResponse? matchmakingMetaData,
    HomeState? homeState,
  }) =>
      AppState(
        splashScreenState: splashScreenState ?? this.splashScreenState,
        chatroomCreationMetaData:
            chatroomCreationMetaData ?? this.chatroomCreationMetaData,
        realTimeMessagingMetaData:
            realTimeMessagingMetaData ?? this.realTimeMessagingMetaData,
        matchmakingMetaData: matchmakingMetaData ?? this.matchmakingMetaData,
        homeState: homeState ?? this.homeState,
      );

  AppState copyUsing(void Function(_AppState$Change change) mutator) {
    final change = _AppState$Change._(
      this.splashScreenState,
      this.chatroomCreationMetaData,
      this.realTimeMessagingMetaData,
      this.matchmakingMetaData,
      this.homeState,
    );
    mutator(change);
    return AppState(
      splashScreenState: change.splashScreenState,
      chatroomCreationMetaData: change.chatroomCreationMetaData,
      realTimeMessagingMetaData: change.realTimeMessagingMetaData,
      matchmakingMetaData: change.matchmakingMetaData,
      homeState: change.homeState,
    );
  }

  @override
  String toString() =>
      "AppState(splashScreenState: $splashScreenState, chatroomCreationMetaData: $chatroomCreationMetaData, realTimeMessagingMetaData: $realTimeMessagingMetaData, matchmakingMetaData: $matchmakingMetaData, homeState: $homeState)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is AppState &&
      other.runtimeType == runtimeType &&
      splashScreenState == other.splashScreenState &&
      chatroomCreationMetaData == other.chatroomCreationMetaData &&
      realTimeMessagingMetaData == other.realTimeMessagingMetaData &&
      matchmakingMetaData == other.matchmakingMetaData &&
      homeState == other.homeState;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + splashScreenState.hashCode;
    result = 37 * result + chatroomCreationMetaData.hashCode;
    result = 37 * result + realTimeMessagingMetaData.hashCode;
    result = 37 * result + matchmakingMetaData.hashCode;
    result = 37 * result + homeState.hashCode;
    return result;
  }
}

class _AppState$Change {
  _AppState$Change._(
    this.splashScreenState,
    this.chatroomCreationMetaData,
    this.realTimeMessagingMetaData,
    this.matchmakingMetaData,
    this.homeState,
  );

  SplashScreenState splashScreenState;
  TopicMetadataResponse? chatroomCreationMetaData;
  TopicMetadataResponse? realTimeMessagingMetaData;
  TopicMetadataResponse? matchmakingMetaData;
  HomeState homeState;
}

// ignore: avoid_classes_with_only_static_members
class AppState$ {
  static final splashScreenState = Lens<AppState, SplashScreenState>(
    (splashScreenStateContainer) =>
        splashScreenStateContainer.splashScreenState,
    (splashScreenStateContainer, splashScreenState) =>
        splashScreenStateContainer.copyWith(
            splashScreenState: splashScreenState),
  );

  static final chatroomCreationMetaData =
      Lens<AppState, TopicMetadataResponse?>(
    (chatroomCreationMetaDataContainer) =>
        chatroomCreationMetaDataContainer.chatroomCreationMetaData,
    (chatroomCreationMetaDataContainer, chatroomCreationMetaData) =>
        chatroomCreationMetaDataContainer.copyWith(
            chatroomCreationMetaData: chatroomCreationMetaData),
  );

  static final realTimeMessagingMetaData =
      Lens<AppState, TopicMetadataResponse?>(
    (realTimeMessagingMetaDataContainer) =>
        realTimeMessagingMetaDataContainer.realTimeMessagingMetaData,
    (realTimeMessagingMetaDataContainer, realTimeMessagingMetaData) =>
        realTimeMessagingMetaDataContainer.copyWith(
            realTimeMessagingMetaData: realTimeMessagingMetaData),
  );

  static final matchmakingMetaData = Lens<AppState, TopicMetadataResponse?>(
    (matchmakingMetaDataContainer) =>
        matchmakingMetaDataContainer.matchmakingMetaData,
    (matchmakingMetaDataContainer, matchmakingMetaData) =>
        matchmakingMetaDataContainer.copyWith(
            matchmakingMetaData: matchmakingMetaData),
  );

  static final homeState = Lens<AppState, HomeState>(
    (homeStateContainer) => homeStateContainer.homeState,
    (homeStateContainer, homeState) =>
        homeStateContainer.copyWith(homeState: homeState),
  );
}

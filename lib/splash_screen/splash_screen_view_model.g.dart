// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$SplashScreenViewModel {
  const _$SplashScreenViewModel();

  VoidCallback get fetchTopicsMetaData;
  Size get screenSize;
  String get splashScreenIconPath;
  TopicMetadataResponse? get realTimeMessagingMetadata;
  TopicMetadataResponse? get matchmakingRequestsMetadata;
  TopicMetadataResponse? get chatroomCreationMetadata;

  SplashScreenViewModel copyWith({
    VoidCallback? fetchTopicsMetaData,
    Size? screenSize,
    String? splashScreenIconPath,
    TopicMetadataResponse? realTimeMessagingMetadata,
    TopicMetadataResponse? matchmakingRequestsMetadata,
    TopicMetadataResponse? chatroomCreationMetadata,
  }) =>
      SplashScreenViewModel(
        fetchTopicsMetaData: fetchTopicsMetaData ?? this.fetchTopicsMetaData,
        screenSize: screenSize ?? this.screenSize,
        splashScreenIconPath: splashScreenIconPath ?? this.splashScreenIconPath,
        realTimeMessagingMetadata:
            realTimeMessagingMetadata ?? this.realTimeMessagingMetadata,
        matchmakingRequestsMetadata:
            matchmakingRequestsMetadata ?? this.matchmakingRequestsMetadata,
        chatroomCreationMetadata:
            chatroomCreationMetadata ?? this.chatroomCreationMetadata,
      );

  SplashScreenViewModel copyUsing(
      void Function(_SplashScreenViewModel$Change change) mutator) {
    final change = _SplashScreenViewModel$Change._(
      this.fetchTopicsMetaData,
      this.screenSize,
      this.splashScreenIconPath,
      this.realTimeMessagingMetadata,
      this.matchmakingRequestsMetadata,
      this.chatroomCreationMetadata,
    );
    mutator(change);
    return SplashScreenViewModel(
      fetchTopicsMetaData: change.fetchTopicsMetaData,
      screenSize: change.screenSize,
      splashScreenIconPath: change.splashScreenIconPath,
      realTimeMessagingMetadata: change.realTimeMessagingMetadata,
      matchmakingRequestsMetadata: change.matchmakingRequestsMetadata,
      chatroomCreationMetadata: change.chatroomCreationMetadata,
    );
  }

  @override
  String toString() =>
      "SplashScreenViewModel(fetchTopicsMetaData: $fetchTopicsMetaData, screenSize: $screenSize, splashScreenIconPath: $splashScreenIconPath, realTimeMessagingMetadata: $realTimeMessagingMetadata, matchmakingRequestsMetadata: $matchmakingRequestsMetadata, chatroomCreationMetadata: $chatroomCreationMetadata)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SplashScreenViewModel &&
      other.runtimeType == runtimeType &&
      const Ignore().equals(fetchTopicsMetaData, other.fetchTopicsMetaData) &&
      screenSize == other.screenSize &&
      splashScreenIconPath == other.splashScreenIconPath &&
      realTimeMessagingMetadata == other.realTimeMessagingMetadata &&
      matchmakingRequestsMetadata == other.matchmakingRequestsMetadata &&
      chatroomCreationMetadata == other.chatroomCreationMetadata;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + const Ignore().hash(fetchTopicsMetaData);
    result = 37 * result + screenSize.hashCode;
    result = 37 * result + splashScreenIconPath.hashCode;
    result = 37 * result + realTimeMessagingMetadata.hashCode;
    result = 37 * result + matchmakingRequestsMetadata.hashCode;
    result = 37 * result + chatroomCreationMetadata.hashCode;
    return result;
  }
}

class _SplashScreenViewModel$Change {
  _SplashScreenViewModel$Change._(
    this.fetchTopicsMetaData,
    this.screenSize,
    this.splashScreenIconPath,
    this.realTimeMessagingMetadata,
    this.matchmakingRequestsMetadata,
    this.chatroomCreationMetadata,
  );

  VoidCallback fetchTopicsMetaData;
  Size screenSize;
  String splashScreenIconPath;
  TopicMetadataResponse? realTimeMessagingMetadata;
  TopicMetadataResponse? matchmakingRequestsMetadata;
  TopicMetadataResponse? chatroomCreationMetadata;
}

// ignore: avoid_classes_with_only_static_members
class SplashScreenViewModel$ {
  static final fetchTopicsMetaData = Lens<SplashScreenViewModel, VoidCallback>(
    (fetchTopicsMetaDataContainer) =>
        fetchTopicsMetaDataContainer.fetchTopicsMetaData,
    (fetchTopicsMetaDataContainer, fetchTopicsMetaData) =>
        fetchTopicsMetaDataContainer.copyWith(
            fetchTopicsMetaData: fetchTopicsMetaData),
  );

  static final screenSize = Lens<SplashScreenViewModel, Size>(
    (screenSizeContainer) => screenSizeContainer.screenSize,
    (screenSizeContainer, screenSize) =>
        screenSizeContainer.copyWith(screenSize: screenSize),
  );

  static final splashScreenIconPath = Lens<SplashScreenViewModel, String>(
    (splashScreenIconPathContainer) =>
        splashScreenIconPathContainer.splashScreenIconPath,
    (splashScreenIconPathContainer, splashScreenIconPath) =>
        splashScreenIconPathContainer.copyWith(
            splashScreenIconPath: splashScreenIconPath),
  );

  static final realTimeMessagingMetadata =
      Lens<SplashScreenViewModel, TopicMetadataResponse?>(
    (realTimeMessagingMetadataContainer) =>
        realTimeMessagingMetadataContainer.realTimeMessagingMetadata,
    (realTimeMessagingMetadataContainer, realTimeMessagingMetadata) =>
        realTimeMessagingMetadataContainer.copyWith(
            realTimeMessagingMetadata: realTimeMessagingMetadata),
  );

  static final matchmakingRequestsMetadata =
      Lens<SplashScreenViewModel, TopicMetadataResponse?>(
    (matchmakingRequestsMetadataContainer) =>
        matchmakingRequestsMetadataContainer.matchmakingRequestsMetadata,
    (matchmakingRequestsMetadataContainer, matchmakingRequestsMetadata) =>
        matchmakingRequestsMetadataContainer.copyWith(
            matchmakingRequestsMetadata: matchmakingRequestsMetadata),
  );

  static final chatroomCreationMetadata =
      Lens<SplashScreenViewModel, TopicMetadataResponse?>(
    (chatroomCreationMetadataContainer) =>
        chatroomCreationMetadataContainer.chatroomCreationMetadata,
    (chatroomCreationMetadataContainer, chatroomCreationMetadata) =>
        chatroomCreationMetadataContainer.copyWith(
            chatroomCreationMetadata: chatroomCreationMetadata),
  );
}

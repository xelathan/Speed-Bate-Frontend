// ignore_for_file: annotate_overrides

import 'package:flutter/widgets.dart';
import 'package:functional_data/functional_data.dart';
import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/splash_screen/actions.dart';
import 'package:speed_bate_frontend/splash_screen/topic_metadata_response.dart';
import 'package:speed_bate_frontend/state.dart';

part 'splash_screen_view_model.g.dart';

@immutable
@FunctionalData()
class SplashScreenViewModel extends _$SplashScreenViewModel {
  const SplashScreenViewModel({
    required this.screenSize,
    required this.splashScreenIconPath,
    required this.fetchTopicsMetaData,
    required this.realTimeMessagingMetadata,
    required this.matchmakingRequestsMetadata,
    required this.chatroomCreationMetadata,
  });

  factory SplashScreenViewModel.fromState({
    required Size screenSize,
    required Store<AppState> store,
  }) {
    return SplashScreenViewModel(
      screenSize: screenSize,
      splashScreenIconPath: "assets/images/speed_bate_icon.svg",
      fetchTopicsMetaData: () {
        store.dispatch(
          FetchTopicsMetaData(),
        );
      },
      realTimeMessagingMetadata: store.state.realTimeMessagingMetaData,
      matchmakingRequestsMetadata: store.state.matchmakingMetaData,
      chatroomCreationMetadata: store.state.chatroomCreationMetaData,
    );
  }

  @CustomEquality(Ignore())
  final VoidCallback fetchTopicsMetaData;

  final Size screenSize;

  final String splashScreenIconPath;

  final TopicMetadataResponse? realTimeMessagingMetadata;
  final TopicMetadataResponse? matchmakingRequestsMetadata;
  final TopicMetadataResponse? chatroomCreationMetadata;
}

// ignore_for_file: annotate_overrides

import 'package:flutter/widgets.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/home/state.dart';
import 'package:speed_bate_frontend/splash_screen/state.dart';
import 'package:speed_bate_frontend/splash_screen/topic_metadata_response.dart';

part 'state.g.dart';

@immutable
@FunctionalData()
class AppState extends _$AppState {
  const AppState({
    required this.homeState,
    required this.splashScreenState,
    required this.chatroomCreationMetaData,
    required this.realTimeMessagingMetaData,
    required this.matchmakingMetaData,
  });

  final SplashScreenState splashScreenState;
  final TopicMetadataResponse? chatroomCreationMetaData;
  final TopicMetadataResponse? realTimeMessagingMetaData;
  final TopicMetadataResponse? matchmakingMetaData;
  final HomeState homeState;

  factory AppState.initial() => AppState(
        splashScreenState: SplashScreenState.initial(),
        homeState: HomeState.initial(),
        chatroomCreationMetaData: null,
        realTimeMessagingMetaData: null,
        matchmakingMetaData: null,
      );

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
}

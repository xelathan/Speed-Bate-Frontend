import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/actions.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/splash_screen/actions.dart';
import 'package:speed_bate_frontend/state.dart';

AppState reducer(AppState state, Object? action) => combineReducers<AppState>([
      TypedReducer<AppState, SplashScreenActions>(_splashScreenActions).call,
      TypedReducer<AppState, UpdateTopicMetaData>(_updateTopicsMetaData).call,
      TypedReducer<AppState, HomeActions>(_homeActions).call,
    ])(
      state,
      action,
    );

AppState _splashScreenActions(
  AppState state,
  SplashScreenActions action,
) =>
    state.copyWith(
      splashScreenState: state.splashScreenState.copyWith(),
    );

AppState _updateTopicsMetaData(
  AppState state,
  UpdateTopicMetaData action,
) =>
    state.copyWith(
      chatroomCreationMetaData: action.chatroomCreationMetaData,
      realTimeMessagingMetaData: action.realTimeMessagingMetaData,
      matchmakingMetaData: action.matchmakingMetaData,
    );

AppState _homeActions(
  AppState state,
  HomeActions action,
) =>
    state.copyWith(homeState: state.homeState.copyWith());

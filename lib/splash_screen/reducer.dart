import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/splash_screen/actions.dart';
import 'package:speed_bate_frontend/splash_screen/state.dart';

SplashScreenState reducer(SplashScreenState state, Object? action) =>
    combineReducers(
      [
        TypedReducer<SplashScreenState, FetchTopicsMetaData>(
                _fetchTopicsMetaData)
            .call,
      ],
    )(
      state,
      action,
    );

SplashScreenState _fetchTopicsMetaData(
        SplashScreenState state, FetchTopicsMetaData action) =>
    state.copyWith();

import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/home/state.dart';

HomeState reducer(HomeState state, Object? action) => combineReducers(
      [
        TypedReducer<HomeState, StartMatchmakingAction>(_startMatchmaking).call,
      ],
    )(
      state,
      action,
    );

HomeState _startMatchmaking(HomeState state, StartMatchmakingAction action) =>
    state.copyWith();

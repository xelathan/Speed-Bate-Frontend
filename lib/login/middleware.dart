import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/login/actions.dart';
import 'package:speed_bate_frontend/login/utils.dart';
import 'package:speed_bate_frontend/state.dart';

void loginMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) async {
  if (action is LoginUserAction) {
    final token = await loginUser(
      phoneNumber: action.phoneNumber,
      password: action.password,
      client: action.client,
    );

    print(token);
  }
}

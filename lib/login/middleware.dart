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
    try {
      final token = await loginUser(
        phoneNumber: action.phoneNumber,
        password: action.password,
        client: action.client.client,
      );
      action.client.upgradeProtected(token);

      store.dispatch(
        GetUserDataAction(
          token: token,
          user: action.user,
          client: action.client,
          toHomeScreen: action.toHomeScreen,
          toVerifyPhoneNumberScreen: action.toVerifyPhoneNumberScreen,
        ),
      );
      action.setErrorPhoneNumber(null);
      action.setErrorPassword(null);
    } on PasswordException catch (e) {
      action.setErrorPassword(e.message);
    } on PhoneNumberException catch (e) {
      action.setErrorPhoneNumber(e.message);
    } catch (e) {
      action.setErrorPassword(e.toString());
    }
  } else if (action is GetUserDataAction) {
    try {
      final userData = await getUserData(
        client: action.client.client,
      );

      action.user.fromLogin(userData, action.token);
      if (action.user.verified) {
        action.toHomeScreen();
      } else {
        action.toVerifyPhoneNumberScreen();
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  next(action);
}

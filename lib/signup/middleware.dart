import 'package:redux/redux.dart';
import 'package:speed_bate_frontend/signup/actions.dart';
import 'package:speed_bate_frontend/signup/utils.dart';
import 'package:speed_bate_frontend/state.dart';

void signupMiddleware(
  Store<AppState> store,
  Object? action,
  NextDispatcher next,
) async {
  if (action is SignupActionSignUp) {
    try {
      final token = await signUpUser(
        phoneNumber: action.phoneNumber,
        password: action.password,
        username: action.username,
        client: action.client.client,
      );

      action.client.upgradeProtected(token);
      final userId = await getUserId(client: action.client.client);
      action.user.fromSignup(
        token: token,
        userId: userId,
        username: action.username,
        phoneNumber: action.phoneNumber,
      );

      action.setUsernameError(null);
      action.setPhoneNumberError(null);
      action.setPasswordError(null);

      action.toVerifyPhoneNumberScreen();
    } on UsernameException catch (e) {
      action.setUsernameError(e.message);
      action.setPhoneNumberError(null);
      action.setPasswordError(null);
    } on PhoneNumberException catch (e) {
      action.setPhoneNumberError(e.message);
      action.setUsernameError(null);
      action.setPasswordError(null);
    } catch (e) {
      action.setPasswordError(e.toString());
      action.setPhoneNumberError(null);
      action.setUsernameError(null);
    }
  }

  next(action);
}

// ignore_for_file: annotate_overrides

import 'package:flutter/widgets.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/login/actions.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

part 'login_screen_view_model.g.dart';

@immutable
@FunctionalData()
class LoginScreenViewModel extends _$LoginScreenViewModel {
  const LoginScreenViewModel({
    required this.onSignUp,
    required this.onLogin,
  });

  factory LoginScreenViewModel.fromState({
    required VoidCallback onSignUp,
    required VoidCallback toHomeScreen,
    required VoidCallback toVerifyPhoneNumberScreen,
    required GraphQlClientProvider client,
    required void Function(dynamic) dispatcher,
    required User user,
  }) =>
      LoginScreenViewModel(
        onSignUp: onSignUp,
        onLogin:
            (phoneNumber, password, setErrorPhoneNumber, setErrorPassword) {
          dispatcher(
            LoginUserAction(
              phoneNumber: phoneNumber,
              password: password,
              client: client,
              setErrorPhoneNumber: setErrorPhoneNumber,
              setErrorPassword: setErrorPassword,
              user: user,
              toHomeScreen: toHomeScreen,
              toVerifyPhoneNumberScreen: toVerifyPhoneNumberScreen,
            ),
          );
        },
      );

  final VoidCallback onSignUp;
  final void Function(
    String,
    String,
    void Function(String?),
    void Function(String?),
  ) onLogin;
}

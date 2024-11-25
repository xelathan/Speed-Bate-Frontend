import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/signup/actions.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

part 'signup_view_model.g.dart';

@immutable
@FunctionalData()
class SignupViewModel extends _$SignupViewModel {
  const SignupViewModel({
    required this.onSignUp,
  });

  factory SignupViewModel.fromState({
    required void Function(dynamic) dispatcher,
    required User user,
    required GraphQlClientProvider client,
    required VoidCallback toHomeScreen,
  }) =>
      SignupViewModel(
        onSignUp: (username, phoneNumber, password, setUsernameError,
                setPhoneNumberError, setConfirmPasswordError) =>
            dispatcher(
          SignupActionSignUp(
            username: username,
            phoneNumber: phoneNumber,
            password: password,
            setPhoneNumberError: setPhoneNumberError,
            setPasswordError: setConfirmPasswordError,
            setUsernameError: setUsernameError,
            client: client,
            user: user,
            toHomeScreen: toHomeScreen,
          ),
        ),
      );

  final void Function(
    String,
    String,
    String,
    void Function(String?),
    void Function(String?),
    void Function(String?),
  ) onSignUp;
}

// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/home/actions.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

part 'verify_phone_number_view_model.g.dart';

@immutable
@FunctionalData()
class VerifyPhoneNumberViewModel extends _$VerifyPhoneNumberViewModel {
  const VerifyPhoneNumberViewModel({
    required this.onVerifyCode,
    required this.onResendCode,
  });

  factory VerifyPhoneNumberViewModel.fromState({
    required User user,
    required void Function(dynamic) dispatcher,
    required GraphQlClientProvider graphQlClientProvider,
    required VoidCallback toHomeScreen,
  }) =>
      VerifyPhoneNumberViewModel(
        onVerifyCode: (code, setErrorMessage) => dispatcher(
          VerifyPhoneNumberAction(
            code: code,
            client: graphQlClientProvider,
            setIsVerified: () => user.verified = true,
            toHomeScreen: toHomeScreen,
            setError: setErrorMessage,
          ),
        ),
        onResendCode: () => dispatcher(
          GenerateNewCodeAction(
            client: graphQlClientProvider,
          ),
        ),
      );

  final void Function(
    String,
    void Function(String),
  ) onVerifyCode;
  final VoidCallback onResendCode;
}

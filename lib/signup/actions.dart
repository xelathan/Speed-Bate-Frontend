import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

sealed class SignupAction {}

@immutable
class SignupActionSignUp implements SignupAction {
  const SignupActionSignUp({
    required this.phoneNumber,
    required this.password,
    required this.username,
    required this.setPhoneNumberError,
    required this.setPasswordError,
    required this.setUsernameError,
    required this.client,
    required this.user,
    required this.toHomeScreen,
  });

  final String phoneNumber;
  final String password;
  final String username;

  final void Function(String?) setPhoneNumberError;
  final void Function(String?) setPasswordError;
  final void Function(String?) setUsernameError;

  final GraphQlClientProvider client;
  final User user;

  final VoidCallback toHomeScreen;
}

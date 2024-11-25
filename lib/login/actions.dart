import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/graphql/client.dart';
import 'package:speed_bate_frontend/user/user_model.dart';

sealed class LoginAction {}

@immutable
class LoginUserAction extends LoginAction {
  final String phoneNumber;
  final String password;
  final GraphQlClientProvider client;
  final User user;
  final void Function(String?) setErrorPhoneNumber;
  final void Function(String?) setErrorPassword;
  final VoidCallback toHomeScreen;

  LoginUserAction({
    required this.phoneNumber,
    required this.password,
    required this.client,
    required this.setErrorPassword,
    required this.setErrorPhoneNumber,
    required this.toHomeScreen,
    required this.user,
  });
}

@immutable
class GetUserDataAction extends LoginAction {
  final String token;
  final User user;
  final VoidCallback toHomeScreen;
  final GraphQlClientProvider client;

  GetUserDataAction({
    required this.token,
    required this.user,
    required this.client,
    required this.toHomeScreen,
  });
}

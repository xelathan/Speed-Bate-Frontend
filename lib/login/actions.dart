import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

sealed class LoginAction {}

@immutable
class LoginUserAction extends LoginAction {
  final String phoneNumber;
  final String password;
  final GraphQLClient client;

  LoginUserAction({
    required this.phoneNumber,
    required this.password,
    required this.client,
  });
}

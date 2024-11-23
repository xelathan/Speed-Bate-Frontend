// ignore_for_file: annotate_overrides

import 'package:flutter/widgets.dart';
import 'package:functional_data/functional_data.dart';

part 'login_screen_view_model.g.dart';

@immutable
@FunctionalData()
class LoginScreenViewModel extends _$LoginScreenViewModel {
  const LoginScreenViewModel({
    required this.onSignUp,
  });

  factory LoginScreenViewModel.fromState({
    required VoidCallback onSignUp,
  }) =>
      LoginScreenViewModel(
        onSignUp: onSignUp,
      );

  final VoidCallback onSignUp;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$LoginScreenViewModel {
  const _$LoginScreenViewModel();

  VoidCallback get onSignUp;

  LoginScreenViewModel copyWith({
    VoidCallback? onSignUp,
  }) =>
      LoginScreenViewModel(
        onSignUp: onSignUp ?? this.onSignUp,
      );

  LoginScreenViewModel copyUsing(
      void Function(_LoginScreenViewModel$Change change) mutator) {
    final change = _LoginScreenViewModel$Change._(
      this.onSignUp,
    );
    mutator(change);
    return LoginScreenViewModel(
      onSignUp: change.onSignUp,
    );
  }

  @override
  String toString() => "LoginScreenViewModel(onSignUp: $onSignUp)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is LoginScreenViewModel &&
      other.runtimeType == runtimeType &&
      onSignUp == other.onSignUp;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return onSignUp.hashCode;
  }
}

class _LoginScreenViewModel$Change {
  _LoginScreenViewModel$Change._(
    this.onSignUp,
  );

  VoidCallback onSignUp;
}

// ignore: avoid_classes_with_only_static_members
class LoginScreenViewModel$ {
  static final onSignUp = Lens<LoginScreenViewModel, VoidCallback>(
    (onSignUpContainer) => onSignUpContainer.onSignUp,
    (onSignUpContainer, onSignUp) =>
        onSignUpContainer.copyWith(onSignUp: onSignUp),
  );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$LoginScreenViewModel {
  const _$LoginScreenViewModel();

  VoidCallback get onSignUp;
  void Function(String, String, void Function(String?), void Function(String?))
      get onLogin;

  LoginScreenViewModel copyWith({
    VoidCallback? onSignUp,
    void Function(
            String, String, void Function(String?), void Function(String?))?
        onLogin,
  }) =>
      LoginScreenViewModel(
        onSignUp: onSignUp ?? this.onSignUp,
        onLogin: onLogin ?? this.onLogin,
      );

  LoginScreenViewModel copyUsing(
      void Function(_LoginScreenViewModel$Change change) mutator) {
    final change = _LoginScreenViewModel$Change._(
      this.onSignUp,
      this.onLogin,
    );
    mutator(change);
    return LoginScreenViewModel(
      onSignUp: change.onSignUp,
      onLogin: change.onLogin,
    );
  }

  @override
  String toString() =>
      "LoginScreenViewModel(onSignUp: $onSignUp, onLogin: $onLogin)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is LoginScreenViewModel &&
      other.runtimeType == runtimeType &&
      onSignUp == other.onSignUp &&
      onLogin == other.onLogin;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + onSignUp.hashCode;
    result = 37 * result + onLogin.hashCode;
    return result;
  }
}

class _LoginScreenViewModel$Change {
  _LoginScreenViewModel$Change._(
    this.onSignUp,
    this.onLogin,
  );

  VoidCallback onSignUp;
  void Function(String, String, void Function(String?), void Function(String?))
      onLogin;
}

// ignore: avoid_classes_with_only_static_members
class LoginScreenViewModel$ {
  static final onSignUp = Lens<LoginScreenViewModel, VoidCallback>(
    (onSignUpContainer) => onSignUpContainer.onSignUp,
    (onSignUpContainer, onSignUp) =>
        onSignUpContainer.copyWith(onSignUp: onSignUp),
  );

  static final onLogin = Lens<
      LoginScreenViewModel,
      void Function(
          String, String, void Function(String?), void Function(String?))>(
    (onLoginContainer) => onLoginContainer.onLogin,
    (onLoginContainer, onLogin) => onLoginContainer.copyWith(onLogin: onLogin),
  );
}

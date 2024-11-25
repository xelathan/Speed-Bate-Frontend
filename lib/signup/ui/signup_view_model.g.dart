// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$SignupViewModel {
  const _$SignupViewModel();

  void Function(String, String, String, void Function(String?),
      void Function(String?), void Function(String?)) get onSignUp;

  SignupViewModel copyWith({
    void Function(String, String, String, void Function(String?),
            void Function(String?), void Function(String?))?
        onSignUp,
  }) =>
      SignupViewModel(
        onSignUp: onSignUp ?? this.onSignUp,
      );

  SignupViewModel copyUsing(
      void Function(_SignupViewModel$Change change) mutator) {
    final change = _SignupViewModel$Change._(
      this.onSignUp,
    );
    mutator(change);
    return SignupViewModel(
      onSignUp: change.onSignUp,
    );
  }

  @override
  String toString() => "SignupViewModel(onSignUp: $onSignUp)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SignupViewModel &&
      other.runtimeType == runtimeType &&
      onSignUp == other.onSignUp;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return onSignUp.hashCode;
  }
}

class _SignupViewModel$Change {
  _SignupViewModel$Change._(
    this.onSignUp,
  );

  void Function(String, String, String, void Function(String?),
      void Function(String?), void Function(String?)) onSignUp;
}

// ignore: avoid_classes_with_only_static_members
class SignupViewModel$ {
  static final onSignUp = Lens<
      SignupViewModel,
      void Function(String, String, String, void Function(String?),
          void Function(String?), void Function(String?))>(
    (onSignUpContainer) => onSignUpContainer.onSignUp,
    (onSignUpContainer, onSignUp) =>
        onSignUpContainer.copyWith(onSignUp: onSignUp),
  );
}

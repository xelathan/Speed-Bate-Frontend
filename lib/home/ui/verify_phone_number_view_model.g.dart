// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_number_view_model.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class _$VerifyPhoneNumberViewModel {
  const _$VerifyPhoneNumberViewModel();

  void Function(String, void Function(String)) get onVerifyCode;
  VoidCallback get onResendCode;

  VerifyPhoneNumberViewModel copyWith({
    void Function(String, void Function(String))? onVerifyCode,
    VoidCallback? onResendCode,
  }) =>
      VerifyPhoneNumberViewModel(
        onVerifyCode: onVerifyCode ?? this.onVerifyCode,
        onResendCode: onResendCode ?? this.onResendCode,
      );

  VerifyPhoneNumberViewModel copyUsing(
      void Function(_VerifyPhoneNumberViewModel$Change change) mutator) {
    final change = _VerifyPhoneNumberViewModel$Change._(
      this.onVerifyCode,
      this.onResendCode,
    );
    mutator(change);
    return VerifyPhoneNumberViewModel(
      onVerifyCode: change.onVerifyCode,
      onResendCode: change.onResendCode,
    );
  }

  @override
  String toString() =>
      "VerifyPhoneNumberViewModel(onVerifyCode: $onVerifyCode, onResendCode: $onResendCode)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is VerifyPhoneNumberViewModel &&
      other.runtimeType == runtimeType &&
      onVerifyCode == other.onVerifyCode &&
      onResendCode == other.onResendCode;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + onVerifyCode.hashCode;
    result = 37 * result + onResendCode.hashCode;
    return result;
  }
}

class _VerifyPhoneNumberViewModel$Change {
  _VerifyPhoneNumberViewModel$Change._(
    this.onVerifyCode,
    this.onResendCode,
  );

  void Function(String, void Function(String)) onVerifyCode;
  VoidCallback onResendCode;
}

// ignore: avoid_classes_with_only_static_members
class VerifyPhoneNumberViewModel$ {
  static final onVerifyCode = Lens<VerifyPhoneNumberViewModel,
      void Function(String, void Function(String))>(
    (onVerifyCodeContainer) => onVerifyCodeContainer.onVerifyCode,
    (onVerifyCodeContainer, onVerifyCode) =>
        onVerifyCodeContainer.copyWith(onVerifyCode: onVerifyCode),
  );

  static final onResendCode = Lens<VerifyPhoneNumberViewModel, VoidCallback>(
    (onResendCodeContainer) => onResendCodeContainer.onResendCode,
    (onResendCodeContainer, onResendCode) =>
        onResendCodeContainer.copyWith(onResendCode: onResendCode),
  );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetPasswordController on ResetPasswordControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'ResetPasswordControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ResetPasswordControllerBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: 'ResetPasswordControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$loadingAtom = Atom(name: 'ResetPasswordControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$sendResetPassswordAsyncAction =
      AsyncAction('ResetPasswordControllerBase.sendResetPasssword');

  @override
  Future<void> sendResetPasssword(BuildContext context) {
    return _$sendResetPassswordAsyncAction
        .run(() => super.sendResetPasssword(context));
  }

  final _$ResetPasswordControllerBaseActionController =
      ActionController(name: 'ResetPasswordControllerBase');

  @override
  void setEmail(String v) {
    final _$actionInfo = _$ResetPasswordControllerBaseActionController
        .startAction(name: 'ResetPasswordControllerBase.setEmail');
    try {
      return super.setEmail(v);
    } finally {
      _$ResetPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
loading: ${loading},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid}
    ''';
  }
}

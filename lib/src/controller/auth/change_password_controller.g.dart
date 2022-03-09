// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordController on ChangePasswordControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'ChangePasswordControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'ChangePasswordControllerBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ChangePasswordControllerBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: 'ChangePasswordControllerBase.email');

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

  final _$currentPasswordAtom =
      Atom(name: 'ChangePasswordControllerBase.currentPassword');

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: 'ChangePasswordControllerBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$newPasswordAtom =
      Atom(name: 'ChangePasswordControllerBase.newPassword');

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  final _$loadingAtom = Atom(name: 'ChangePasswordControllerBase.loading');

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

  final _$loggedInAtom = Atom(name: 'ChangePasswordControllerBase.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$changePassswordAsyncAction =
      AsyncAction('ChangePasswordControllerBase.changePasssword');

  @override
  Future<void> changePasssword(BuildContext context) {
    return _$changePassswordAsyncAction
        .run(() => super.changePasssword(context));
  }

  final _$ChangePasswordControllerBaseActionController =
      ActionController(name: 'ChangePasswordControllerBase');

  @override
  void setEmail(String v) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setEmail');
    try {
      return super.setEmail(v);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPassword(String v) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setCurrentPassword');
    try {
      return super.setCurrentPassword(v);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisible() {
    final _$actionInfo =
        _$ChangePasswordControllerBaseActionController.startAction(
            name: 'ChangePasswordControllerBase.togglePasswordVisible');
    try {
      return super.togglePasswordVisible();
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String v) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setNewPassword');
    try {
      return super.setNewPassword(v);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
currentPassword: ${currentPassword},
passwordVisible: ${passwordVisible},
newPassword: ${newPassword},
loading: ${loading},
loggedIn: ${loggedIn},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid}
    ''';
  }
}

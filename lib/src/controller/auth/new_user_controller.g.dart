// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewUserController on NewUserControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'NewUserControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'NewUserControllerBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'NewUserControllerBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: 'NewUserControllerBase.email');

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

  final _$passwordAtom = Atom(name: 'NewUserControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: 'NewUserControllerBase.passwordVisible');

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

  final _$fullnameAtom = Atom(name: 'NewUserControllerBase.fullname');

  @override
  String get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  final _$phoneAtom = Atom(name: 'NewUserControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$cpfAtom = Atom(name: 'NewUserControllerBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$loadingAtom = Atom(name: 'NewUserControllerBase.loading');

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

  final _$NewUserControllerBaseActionController =
      ActionController(name: 'NewUserControllerBase');

  @override
  void setEmail(String v) {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.setEmail');
    try {
      return super.setEmail(v);
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.setPassword');
    try {
      return super.setPassword(v);
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisible() {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.togglePasswordVisible');
    try {
      return super.togglePasswordVisible();
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName(String v) {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.setFullName');
    try {
      return super.setFullName(v);
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String v) {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.setPhone');
    try {
      return super.setPhone(v);
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String v) {
    final _$actionInfo = _$NewUserControllerBaseActionController.startAction(
        name: 'NewUserControllerBase.setCPF');
    try {
      return super.setCPF(v);
    } finally {
      _$NewUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
fullname: ${fullname},
phone: ${phone},
cpf: ${cpf},
loading: ${loading},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogoutController on LogoutControllerBase, Store {
  final _$loggedInAtom = Atom(name: 'LogoutControllerBase.loggedIn');

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

  final _$userLogoutAsyncAction =
      AsyncAction('LogoutControllerBase.userLogout');

  @override
  Future<void> userLogout(BuildContext context) {
    return _$userLogoutAsyncAction.run(() => super.userLogout(context));
  }

  @override
  String toString() {
    return '''
loggedIn: ${loggedIn}
    ''';
  }
}

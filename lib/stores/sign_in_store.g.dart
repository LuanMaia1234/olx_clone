// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInStore.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignInStore.email');

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

  final _$passwordAtom = Atom(name: '_SignInStore.password');

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

  final _$emailErrorMessageAtom = Atom(name: '_SignInStore.emailErrorMessage');

  @override
  String get emailErrorMessage {
    _$emailErrorMessageAtom.reportRead();
    return super.emailErrorMessage;
  }

  @override
  set emailErrorMessage(String value) {
    _$emailErrorMessageAtom.reportWrite(value, super.emailErrorMessage, () {
      super.emailErrorMessage = value;
    });
  }

  final _$passwordErrorMessageAtom =
      Atom(name: '_SignInStore.passwordErrorMessage');

  @override
  String get passwordErrorMessage {
    _$passwordErrorMessageAtom.reportRead();
    return super.passwordErrorMessage;
  }

  @override
  set passwordErrorMessage(String value) {
    _$passwordErrorMessageAtom.reportWrite(value, super.passwordErrorMessage,
        () {
      super.passwordErrorMessage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SignInStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_SignInStore.signIn');

  @override
  Future<String> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$facebookSignInAsyncAction =
      AsyncAction('_SignInStore.facebookSignIn');

  @override
  Future<String> facebookSignIn() {
    return _$facebookSignInAsyncAction.run(() => super.facebookSignIn());
  }

  final _$googleSignInAsyncAction = AsyncAction('_SignInStore.googleSignIn');

  @override
  Future<String> googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  final _$_SignInStoreActionController = ActionController(name: '_SignInStore');

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMessage: ${passwordErrorMessage},
isLoading: ${isLoading},
isFormValid: ${isFormValid}
    ''';
  }
}

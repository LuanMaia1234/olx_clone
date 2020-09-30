// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStore.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_SignUpStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStore.email');

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

  final _$passwordAtom = Atom(name: '_SignUpStore.password');

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

  final _$nameErrorMessageAtom = Atom(name: '_SignUpStore.nameErrorMessage');

  @override
  String get nameErrorMessage {
    _$nameErrorMessageAtom.reportRead();
    return super.nameErrorMessage;
  }

  @override
  set nameErrorMessage(String value) {
    _$nameErrorMessageAtom.reportWrite(value, super.nameErrorMessage, () {
      super.nameErrorMessage = value;
    });
  }

  final _$emailErrorMessageAtom = Atom(name: '_SignUpStore.emailErrorMessage');

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
      Atom(name: '_SignUpStore.passwordErrorMessage');

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

  final _$isLoadingAtom = Atom(name: '_SignUpStore.isLoading');

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

  final _$_SignUpStoreActionController = ActionController(name: '_SignUpStore');

  @override
  void validateName(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
nameErrorMessage: ${nameErrorMessage},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMessage: ${passwordErrorMessage},
isLoading: ${isLoading},
isFormValid: ${isFormValid}
    ''';
  }
}

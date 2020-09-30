// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountDataStore on _AccountDataStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AccountDataStore.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_AccountDataStore.name');

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

  final _$documentAtom = Atom(name: '_AccountDataStore.document');

  @override
  String get document {
    _$documentAtom.reportRead();
    return super.document;
  }

  @override
  set document(String value) {
    _$documentAtom.reportWrite(value, super.document, () {
      super.document = value;
    });
  }

  final _$genderAtom = Atom(name: '_AccountDataStore.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AccountDataStore.isLoading');

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

  final _$nameErrorMessageAtom =
      Atom(name: '_AccountDataStore.nameErrorMessage');

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

  final _$documentErrorMessageAtom =
      Atom(name: '_AccountDataStore.documentErrorMessage');

  @override
  String get documentErrorMessage {
    _$documentErrorMessageAtom.reportRead();
    return super.documentErrorMessage;
  }

  @override
  set documentErrorMessage(String value) {
    _$documentErrorMessageAtom.reportWrite(value, super.documentErrorMessage,
        () {
      super.documentErrorMessage = value;
    });
  }

  final _$_AccountDataStoreActionController =
      ActionController(name: '_AccountDataStore');

  @override
  void validateName(String value) {
    final _$actionInfo = _$_AccountDataStoreActionController.startAction(
        name: '_AccountDataStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_AccountDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDocument(String value) {
    final _$actionInfo = _$_AccountDataStoreActionController.startAction(
        name: '_AccountDataStore.validateDocument');
    try {
      return super.validateDocument(value);
    } finally {
      _$_AccountDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(String value) {
    final _$actionInfo = _$_AccountDataStoreActionController.startAction(
        name: '_AccountDataStore.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_AccountDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
document: ${document},
gender: ${gender},
isLoading: ${isLoading},
nameErrorMessage: ${nameErrorMessage},
documentErrorMessage: ${documentErrorMessage},
isFormValid: ${isFormValid}
    ''';
  }
}

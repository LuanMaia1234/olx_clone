// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressStore on _AddressStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AddressStore.isFormValid'))
          .value;

  final _$zipCodeAtom = Atom(name: '_AddressStore.zipCode');

  @override
  String get zipCode {
    _$zipCodeAtom.reportRead();
    return super.zipCode;
  }

  @override
  set zipCode(String value) {
    _$zipCodeAtom.reportWrite(value, super.zipCode, () {
      super.zipCode = value;
    });
  }

  final _$streetAtom = Atom(name: '_AddressStore.street');

  @override
  String get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  final _$numberAtom = Atom(name: '_AddressStore.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$complementAtom = Atom(name: '_AddressStore.complement');

  @override
  String get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  final _$referenceAtom = Atom(name: '_AddressStore.reference');

  @override
  String get reference {
    _$referenceAtom.reportRead();
    return super.reference;
  }

  @override
  set reference(String value) {
    _$referenceAtom.reportWrite(value, super.reference, () {
      super.reference = value;
    });
  }

  final _$districtAtom = Atom(name: '_AddressStore.district');

  @override
  String get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$cityAtom = Atom(name: '_AddressStore.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$stateAtom = Atom(name: '_AddressStore.state');

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$zipCodeErrorMessageAtom =
      Atom(name: '_AddressStore.zipCodeErrorMessage');

  @override
  String get zipCodeErrorMessage {
    _$zipCodeErrorMessageAtom.reportRead();
    return super.zipCodeErrorMessage;
  }

  @override
  set zipCodeErrorMessage(String value) {
    _$zipCodeErrorMessageAtom.reportWrite(value, super.zipCodeErrorMessage, () {
      super.zipCodeErrorMessage = value;
    });
  }

  final _$streetErrorMessageAtom =
      Atom(name: '_AddressStore.streetErrorMessage');

  @override
  String get streetErrorMessage {
    _$streetErrorMessageAtom.reportRead();
    return super.streetErrorMessage;
  }

  @override
  set streetErrorMessage(String value) {
    _$streetErrorMessageAtom.reportWrite(value, super.streetErrorMessage, () {
      super.streetErrorMessage = value;
    });
  }

  final _$numberErrorMessageAtom =
      Atom(name: '_AddressStore.numberErrorMessage');

  @override
  String get numberErrorMessage {
    _$numberErrorMessageAtom.reportRead();
    return super.numberErrorMessage;
  }

  @override
  set numberErrorMessage(String value) {
    _$numberErrorMessageAtom.reportWrite(value, super.numberErrorMessage, () {
      super.numberErrorMessage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AddressStore.isLoading');

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

  final _$validateZipCodeAsyncAction =
      AsyncAction('_AddressStore.validateZipCode');



  final _$_AddressStoreActionController =
      ActionController(name: '_AddressStore');

  @override
  void validateStreet(String value) {
    final _$actionInfo = _$_AddressStoreActionController.startAction(
        name: '_AddressStore.validateStreet');
    try {
      return super.validateStreet(value);
    } finally {
      _$_AddressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNumber(String value) {
    final _$actionInfo = _$_AddressStoreActionController.startAction(
        name: '_AddressStore.validateNumber');
    try {
      return super.validateNumber(value);
    } finally {
      _$_AddressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$_AddressStoreActionController.startAction(
        name: '_AddressStore.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$_AddressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReference(String value) {
    final _$actionInfo = _$_AddressStoreActionController.startAction(
        name: '_AddressStore.setReference');
    try {
      return super.setReference(value);
    } finally {
      _$_AddressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zipCode: ${zipCode},
street: ${street},
number: ${number},
complement: ${complement},
reference: ${reference},
district: ${district},
city: ${city},
state: ${state},
zipCodeErrorMessage: ${zipCodeErrorMessage},
streetErrorMessage: ${streetErrorMessage},
numberErrorMessage: ${numberErrorMessage},
isLoading: ${isLoading},
isFormValid: ${isFormValid}
    ''';
  }
}

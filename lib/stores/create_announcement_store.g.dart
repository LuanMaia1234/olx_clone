// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_announcement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAnnouncementStore on _CreateAnnouncementStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CreateAnnouncementStore.isFormValid'))
          .value;

  final _$imagesAtom = Atom(name: '_CreateAnnouncementStore.images');

  @override
  ObservableList<File> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<File> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$titleAtom = Atom(name: '_CreateAnnouncementStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateAnnouncementStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CreateAnnouncementStore.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$zipCodeAtom = Atom(name: '_CreateAnnouncementStore.zipCode');

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

  final _$priceAtom = Atom(name: '_CreateAnnouncementStore.price');

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateAnnouncementStore.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CreateAnnouncementStore.isLoading');

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

  final _$zipCodeValidatedAtom =
      Atom(name: '_CreateAnnouncementStore.zipCodeValidated');

  @override
  bool get zipCodeValidated {
    _$zipCodeValidatedAtom.reportRead();
    return super.zipCodeValidated;
  }

  @override
  set zipCodeValidated(bool value) {
    _$zipCodeValidatedAtom.reportWrite(value, super.zipCodeValidated, () {
      super.zipCodeValidated = value;
    });
  }

  final _$titleErrorMessageAtom =
      Atom(name: '_CreateAnnouncementStore.titleErrorMessage');

  @override
  String get titleErrorMessage {
    _$titleErrorMessageAtom.reportRead();
    return super.titleErrorMessage;
  }

  @override
  set titleErrorMessage(String value) {
    _$titleErrorMessageAtom.reportWrite(value, super.titleErrorMessage, () {
      super.titleErrorMessage = value;
    });
  }

  final _$descriptionErrorMessageAtom =
      Atom(name: '_CreateAnnouncementStore.descriptionErrorMessage');

  @override
  String get descriptionErrorMessage {
    _$descriptionErrorMessageAtom.reportRead();
    return super.descriptionErrorMessage;
  }

  @override
  set descriptionErrorMessage(String value) {
    _$descriptionErrorMessageAtom
        .reportWrite(value, super.descriptionErrorMessage, () {
      super.descriptionErrorMessage = value;
    });
  }

  final _$categoryErrorMessageAtom =
      Atom(name: '_CreateAnnouncementStore.categoryErrorMessage');

  @override
  String get categoryErrorMessage {
    _$categoryErrorMessageAtom.reportRead();
    return super.categoryErrorMessage;
  }

  @override
  set categoryErrorMessage(String value) {
    _$categoryErrorMessageAtom.reportWrite(value, super.categoryErrorMessage,
        () {
      super.categoryErrorMessage = value;
    });
  }

  final _$zipCodeErrorMessageAtom =
      Atom(name: '_CreateAnnouncementStore.zipCodeErrorMessage');

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

  final _$imagesErrorMessageAtom =
      Atom(name: '_CreateAnnouncementStore.imagesErrorMessage');

  @override
  String get imagesErrorMessage {
    _$imagesErrorMessageAtom.reportRead();
    return super.imagesErrorMessage;
  }

  @override
  set imagesErrorMessage(String value) {
    _$imagesErrorMessageAtom.reportWrite(value, super.imagesErrorMessage, () {
      super.imagesErrorMessage = value;
    });
  }

  final _$validateZipCodeAsyncAction =
      AsyncAction('_CreateAnnouncementStore.validateZipCode');

  @override
  Future<void> validateZipCode(String value) {
    return _$validateZipCodeAsyncAction.run(() => super.validateZipCode(value));
  }

  final _$validateFieldsAsyncAction =
      AsyncAction('_CreateAnnouncementStore.validateFields');

  @override
  Future<void> validateFields(
      String title, String description, String category) {
    return _$validateFieldsAsyncAction
        .run(() => super.validateFields(title, description, category));
  }

  final _$_CreateAnnouncementStoreActionController =
      ActionController(name: '_CreateAnnouncementStore');

  @override
  void setImage(File image) {
    final _$actionInfo = _$_CreateAnnouncementStoreActionController.startAction(
        name: '_CreateAnnouncementStore.setImage');
    try {
      return super.setImage(image);
    } finally {
      _$_CreateAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage(int index) {
    final _$actionInfo = _$_CreateAnnouncementStoreActionController.startAction(
        name: '_CreateAnnouncementStore.removeImage');
    try {
      return super.removeImage(index);
    } finally {
      _$_CreateAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateAnnouncementStoreActionController.startAction(
        name: '_CreateAnnouncementStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_CreateAnnouncementStoreActionController.startAction(
        name: '_CreateAnnouncementStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images},
title: ${title},
description: ${description},
category: ${category},
zipCode: ${zipCode},
price: ${price},
hidePhone: ${hidePhone},
isLoading: ${isLoading},
zipCodeValidated: ${zipCodeValidated},
titleErrorMessage: ${titleErrorMessage},
descriptionErrorMessage: ${descriptionErrorMessage},
categoryErrorMessage: ${categoryErrorMessage},
zipCodeErrorMessage: ${zipCodeErrorMessage},
imagesErrorMessage: ${imagesErrorMessage},
isFormValid: ${isFormValid}
    ''';
  }
}

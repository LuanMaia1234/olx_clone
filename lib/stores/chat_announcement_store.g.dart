// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_announcement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatAnnouncementStore on _ChatAnnouncementStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ChatAnnouncementStore.isFormValid'))
          .value;

  final _$messageAtom = Atom(name: '_ChatAnnouncementStore.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$uidAtom = Atom(name: '_ChatAnnouncementStore.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$announcementIdAtom =
      Atom(name: '_ChatAnnouncementStore.announcementId');

  @override
  String get announcementId {
    _$announcementIdAtom.reportRead();
    return super.announcementId;
  }

  @override
  set announcementId(String value) {
    _$announcementIdAtom.reportWrite(value, super.announcementId, () {
      super.announcementId = value;
    });
  }

  final _$announcerAtom = Atom(name: '_ChatAnnouncementStore.announcer');

  @override
  bool get announcer {
    _$announcerAtom.reportRead();
    return super.announcer;
  }

  @override
  set announcer(bool value) {
    _$announcerAtom.reportWrite(value, super.announcer, () {
      super.announcer = value;
    });
  }

  final _$purchaserAtom = Atom(name: '_ChatAnnouncementStore.purchaser');

  @override
  bool get purchaser {
    _$purchaserAtom.reportRead();
    return super.purchaser;
  }

  @override
  set purchaser(bool value) {
    _$purchaserAtom.reportWrite(value, super.purchaser, () {
      super.purchaser = value;
    });
  }

  final _$_ChatAnnouncementStoreActionController =
      ActionController(name: '_ChatAnnouncementStore');

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_ChatAnnouncementStoreActionController.startAction(
        name: '_ChatAnnouncementStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUid(String value) {
    final _$actionInfo = _$_ChatAnnouncementStoreActionController.startAction(
        name: '_ChatAnnouncementStore.setUid');
    try {
      return super.setUid(value);
    } finally {
      _$_ChatAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnnouncementId(String value) {
    final _$actionInfo = _$_ChatAnnouncementStoreActionController.startAction(
        name: '_ChatAnnouncementStore.setAnnouncementId');
    try {
      return super.setAnnouncementId(value);
    } finally {
      _$_ChatAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnnouncer(bool value) {
    final _$actionInfo = _$_ChatAnnouncementStoreActionController.startAction(
        name: '_ChatAnnouncementStore.setAnnouncer');
    try {
      return super.setAnnouncer(value);
    } finally {
      _$_ChatAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPurchaser(bool value) {
    final _$actionInfo = _$_ChatAnnouncementStoreActionController.startAction(
        name: '_ChatAnnouncementStore.setPurchaser');
    try {
      return super.setPurchaser(value);
    } finally {
      _$_ChatAnnouncementStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
uid: ${uid},
announcementId: ${announcementId},
announcer: ${announcer},
purchaser: ${purchaser},
isFormValid: ${isFormValid}
    ''';
  }
}

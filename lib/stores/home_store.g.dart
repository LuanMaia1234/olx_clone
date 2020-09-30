// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<HomeState> _$stateComputed;

  @override
  HomeState get state => (_$stateComputed ??=
          Computed<HomeState>(() => super.state, name: '_HomeStore.state'))
      .value;

  final _$homeFutureAtom = Atom(name: '_HomeStore.homeFuture');

  @override
  ObservableFuture<dynamic> get homeFuture {
    _$homeFutureAtom.reportRead();
    return super.homeFuture;
  }

  @override
  set homeFuture(ObservableFuture<dynamic> value) {
    _$homeFutureAtom.reportWrite(value, super.homeFuture, () {
      super.homeFuture = value;
    });
  }

  final _$currentStateAtom = Atom(name: '_HomeStore.currentState');

  @override
  String get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(String value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  final _$currentCategoryAtom = Atom(name: '_HomeStore.currentCategory');

  @override
  String get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(String value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  Future<void> getAnnouncements({Map<String, dynamic> filter}) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getAnnouncements');
    try {
      return super.getAnnouncements(filter: filter);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentState(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setCurrentState');
    try {
      return super.setCurrentState(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeFuture: ${homeFuture},
currentState: ${currentState},
currentCategory: ${currentCategory},
state: ${state}
    ''';
  }
}

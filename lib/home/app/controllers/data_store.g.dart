// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  late final _$itemListAtom =
      Atom(name: '_DataStore.itemList', context: context);

  @override
  ObservableList<String> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(ObservableList<String> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$_DataStoreActionController =
      ActionController(name: '_DataStore', context: context);

  @override
  void addItem(String item) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(int index) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.deleteItem');
    try {
      return super.deleteItem(index);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItem(int index, String newItem) {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.editItem');
    try {
      return super.editItem(index, newItem);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList}
    ''';
  }
}

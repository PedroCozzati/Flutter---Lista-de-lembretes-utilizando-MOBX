// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$valueAtom = Atom(name: '_UserStore.value', context: context);

  @override
  bool get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(bool value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<dynamic> login(dynamic user, dynamic pwd) {
    return _$loginAsyncAction.run(() => super.login(user, pwd));
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void toggleValue() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.toggleValue');
    try {
      return super.toggleValue();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  late SharedPreferences _prefs;

  _DataStore() {
    loadPreferences();
  }

  @observable
  ObservableList<String> itemList = ObservableList<String>();

  @action
  void addItem(String item) {
    itemList.add(item);
    _savePreferences();
  }

  @action
  void deleteItem(int index) {
    itemList.removeAt(index);
    _savePreferences();
  }

  @action
  void editItem(int index, String newItem) {
    itemList[index] = newItem;
    _savePreferences();
  }

  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    itemList = ObservableList<String>.of(_prefs.getStringList('itemList') ?? []);
  }

  Future<void> _savePreferences() async {
    await _prefs.setStringList('itemList', itemList.toList());
  }
}
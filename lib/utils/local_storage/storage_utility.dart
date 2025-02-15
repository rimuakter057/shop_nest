
import 'package:get_storage/get_storage.dart';

class AppLocalStorage{
  static final AppLocalStorage _instance = AppLocalStorage._internal();
  factory AppLocalStorage() => _instance;
  AppLocalStorage._internal();
  final _storage= GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value)async{
    await _storage.write(key, value);
  }

  //generic method to get data
  T? readData<T>(String key){
    return _storage.read<T>(key);
  }

  //generic method to remove data
  Future<void> removeData(String key)async{
    await _storage.remove(key);
  }

  //generic method to clear all data
  Future<void> clearData()async{
    await _storage.erase();
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:middleman/core/services/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefStorageProvider = Provider<StorageService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return SharedPrefStorageService(sharedPreferences);
});

class SharedPrefStorageService implements StorageService {
  SharedPrefStorageService(this.prefs);

  final SharedPreferences prefs;

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  dynamic get(String key) {
    return prefs.get(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> set(String key, dynamic data) async {
    final runTimeType = data.runtimeType;

    switch (runTimeType) {
      case String:
        await prefs.setString(key, data);
        break;

      case int:
        await prefs.setInt(key, data);
        break;

      case double:
        await prefs.setDouble(key, data);
        break;

      case bool:
        await prefs.setBool(key, data);
        break;

      case const (List<String>):
        await prefs.setStringList(key, data);
        break;
    }
  }
}

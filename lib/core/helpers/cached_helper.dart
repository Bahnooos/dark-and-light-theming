import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:hive/hive.dart';

class CacheHelper {
  static late Box _box;

  /// Initialize Hive box
  static Future<void> init() async {
    HiveAdapters.registerAdapters();
    _box = await Hive.openBox('cacheBox');
  }

  /// Save data to cache
  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    await _box.put(key, value);
  }

  /// Get data from cache
  static dynamic getData(String key, {dynamic defaultValue}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  /// Check if key exists
  static bool contains(String key) {
    return _box.containsKey(key);
  }

  /// Remove single cached item
  static Future<void> remove(String key) async {
    await _box.delete(key);
  }

  /// Clear all cached data
  static Future<void> clear() async {
    await _box.clear();
  }
}

class HiveAdapters {
  static void registerAdapters() {
    Hive.registerAdapter(MovesResponseAdapter());
    Hive.registerAdapter(ResultsAdapter());
  }
}

// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// remove all values and keys from shared preferences
  static void clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  /// Removes a value from SharedPreferences with given [key].
  static void removeData({required String key}) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static void setData({required String key, required dynamic value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('the key is $key and the value is $value');
    switch (value.runtimeType) {
      case String:
        await prefs.setString(key, value);
        break;
      case int:
        await prefs.setInt(key, value);
        break;
      case double:
        await prefs.setDouble(key, value);
        break;
      case bool:
        await prefs.setBool(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets an String value from SharedPreferences with given [key].
  static Future<String?> getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : getString with key : $key');
    return prefs.getString(key) ?? '';
  }

  /// Gets an Int value from SharedPreferences with given [key].
  static Future<int> getInt({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return prefs.getInt(key) ?? 0;
  }

  /// Gets an Double value from SharedPreferences with given [key].
  static Future<double> getDouble({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return prefs.getDouble(key) ?? 0;
  }

  /// Gets an Bool value from SharedPreferences with given [key].
  static Future<bool> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return prefs.getBool(key) ?? false;
  }


}
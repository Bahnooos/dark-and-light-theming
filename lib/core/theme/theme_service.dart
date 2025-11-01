import 'package:dark_and_light_theming/core/helpers/shared_pref_helper.dart';
import 'package:flutter/material.dart';

class ThemeService {
  final String _themeKey = 'theme_mode';

  ThemeService();

  Future<ThemeMode> loadTheme() async {
    final themeMode = await SharedPrefHelper.getString(key: _themeKey);
    if (themeMode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  Future<void> saveTheme({required ThemeMode themeMode}) async {
    if (themeMode == ThemeMode.system) return;
     SharedPrefHelper.setData(key: _themeKey, value: themeMode.name);
  }
}

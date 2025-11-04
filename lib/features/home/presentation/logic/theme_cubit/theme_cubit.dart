import 'package:dark_and_light_theming/core/theme/theme_config.dart';
import 'package:dark_and_light_theming/core/theme/theme_service.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeService themeService;
  ThemeCubit(this.themeService)
    : super(ThemeState(themeData: ThemeConfig.lightTheme));
  Future<void> toggleTheme(bool isDarkMode) async {
    final newTheme = isDarkMode
        ? ThemeConfig.darkTheme
        : ThemeConfig.lightTheme;
    if (state.themeData == newTheme) return;

    await themeService.saveTheme(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
    emit(ThemeState(themeData: newTheme));
  }

  Future<void> _loadInitialTheme() async {
    final themeMode = await themeService.loadTheme();
    final isDarkMode = themeMode == ThemeMode.dark;
    // 4. Instead of adding an event, call the public method directly
    await toggleTheme(isDarkMode);
  }
}

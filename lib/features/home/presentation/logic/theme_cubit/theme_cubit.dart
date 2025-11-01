import 'package:dark_and_light_theming/core/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeService themeService;
  ThemeCubit(this.themeService, {required ThemeMode initialTheme})
    : super(initialTheme);

  void setTheme(ThemeMode themeMode)async {
    if (themeMode == ThemeMode.system) return;
    emit(themeMode);
   await themeService.saveTheme(themeMode: themeMode);
  }
}

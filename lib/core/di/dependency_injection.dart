import 'package:dark_and_light_theming/core/theme/theme_service.dart';
import 'package:dark_and_light_theming/features/home/data/repo/home_repo.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_cubit.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/remote/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // setup dio and api service
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // theming
  final themeService = ThemeService();
  getIt.registerSingleton<ThemeService>(themeService);

  final initialTheme = await themeService.loadTheme();
  getIt.registerSingleton<ThemeMode>(
    initialTheme,
    instanceName: 'initialTheme',
  );
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit(getIt<ThemeService>()));
}

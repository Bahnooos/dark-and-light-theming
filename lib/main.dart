import 'package:dark_and_light_theming/core/di/dependency_injection.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_cubit.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        child: DarkAndLightTheming(appRouter: AppRouter()),
      ),
    ),
  );
}

class DarkAndLightTheming extends StatelessWidget {
  const DarkAndLightTheming({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,

          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}

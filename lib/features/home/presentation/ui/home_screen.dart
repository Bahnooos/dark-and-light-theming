import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 16.w),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.movie_creation_outlined, size: 20.r),
            6.horizontalSpace,
            Text('Movies'),
          ],
        ),
        centerTitle: true,
        actions: [
         
               InkWell(
                onTap: () {
                   final mode= context.watch<ThemeCubit>().state;
                final newMode  = (mode == ThemeMode.light)
                      ? ThemeMode.dark
                      : ThemeMode.light;
                  context.read<ThemeCubit>().themeService.saveTheme(
                    themeMode: newMode,
                  );
                },
                child: Icon( context.watch<ThemeCubit>().state == ThemeMode.light
                ? Icons.dark_mode_outlined 
                : Icons.light_mode_outlined,),
              ),
          
        ],
      ),
    );
  }
}

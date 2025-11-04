import 'package:cached_network_image/cached_network_image.dart';
import 'package:dark_and_light_theming/core/theme/theme_config.dart';
import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/theme_cubit/theme_cubit.dart';
import 'package:dark_and_light_theming/features/home/presentation/ui/move_item.dart';
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
              final bool isCurrentlyDark =
                  context.read<ThemeCubit>().state.themeData ==
                  ThemeConfig.darkTheme;
              context.read<ThemeCubit>().toggleTheme(!isCurrentlyDark);
            },
            child: Icon(
              context.watch<ThemeCubit>().state.themeData ==
                      ThemeConfig.darkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      MoveItem(movesResponse: movesResponse),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

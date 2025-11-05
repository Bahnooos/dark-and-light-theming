import 'package:dark_and_light_theming/core/theme/theme_config.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_cubit.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_state.dart';
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

      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeLoading ||
            current is HomeSuccess ||
            current is HomeError,
        builder: (context, state) {
          final scrollController = context.read<HomeCubit>().scrollController;
          switch (state) {
            case HomeLoading():
              return const Center(child: CircularProgressIndicator());
            case HomeSuccess():
              return RefreshIndicator(
                onRefresh: () => context.read<HomeCubit>().fetchFirstPage(),
                child: ListView.builder(
                  itemCount: state.data.length + 1,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (index < state.data.length) {
                      return MoveItem(results: state.data[index]);
                    } else {
                      if (state.isLoadingMore) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      if (state.nextPageError != null) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(state.nextPageError!),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<HomeCubit>().fetchNextPage();
                                },
                                child: const Text("Retry"),
                              ),
                            ],
                          ),
                        );
                      }

                      // End of list, show nothing
                      return const SizedBox.shrink();
                    }
                  },
                ),
              );

            case HomeError():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 50, color: Colors.red),
                    Text(state.errorMessage ?? ''),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<HomeCubit>().fetchFirstPage(),
                      child: Text("Retry"),
                    ),
                  ],
                ),
              );

            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

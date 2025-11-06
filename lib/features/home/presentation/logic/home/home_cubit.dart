import 'package:dark_and_light_theming/core/helpers/cached_helper.dart';
import 'package:dark_and_light_theming/core/helpers/pagination_service.dart';
import 'package:dark_and_light_theming/core/helpers/scroll_manager_mixin.dart';
import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:dark_and_light_theming/features/home/data/repo/home_repo.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> with ScrollManagerMixin {
  final HomeRepo homeRepo;
  late final PaginationService<Results> paginationService;
  List<Results> _allITems = [];

  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    paginationService = PaginationService<Results>(
      homeRepo.getMovies,
      pageSize: 20,
    );
    initScrollListener();
    fetchFirstPage();
  }

  Future<void> fetchFirstPage() async {
    emit(HomeLoading());
    paginationService.refresh();
    final response = await paginationService.fetchNextPage();
    response?.when(
      success: (data) {
        _allITems = data;
        CacheHelper.saveData(key: 'results', value: _allITems);
        return emit(
          HomeSuccess(
            data: _allITems,
            isLoadingMore: false,
            nextPageError: null,
          ),
        );
      },
      failure: (failure) {
        final cacheMovies = CacheHelper.getData('results');
        if (cacheMovies != null) {
          return emit(
            HomeSuccess(
              data: cacheMovies,
              isLoadingMore: false,
              nextPageError: null,
            ),
          );
        }
        return emit(HomeError(errorMessage: failure.message));
      },
    );
  }

  Future<void> fetchNextPage() async {
    if (state is! HomeSuccess) return;
    final currentState = state as HomeSuccess;
    if (currentState.isLoadingMore) return;
    emit(
      HomeSuccess(data: _allITems, isLoadingMore: true, nextPageError: null),
    );
    final response = await paginationService.fetchNextPage();
    if (response == null) {
      emit(
        HomeSuccess(
          data: currentState.data,
          isLoadingMore: false,
          nextPageError: null,
        ),
      );
      return; // Stop the function
    }
    response.when(
      success: (data) {
        if (data.isEmpty) {
          emit(
            HomeSuccess(
              data: currentState.data,
              isLoadingMore: false,
              nextPageError: null,
            ),
          );
          return;
        }
        CacheHelper.saveData(key: 'results', value: _allITems);

        _allITems.addAll(data);
        return emit(
          HomeSuccess(
            data: _allITems,
            isLoadingMore: false,
            nextPageError: null,
          ),
        );
      },
      failure: (failure) => emit(
        HomeSuccess(
          data: currentState.data,
          isLoadingMore: false,
          nextPageError: failure.message,
        ),
      ),
    );
  }

  @override
  void onScrollNearBottom() {
    fetchNextPage();
  }

  @override
  Future<void> close() {
    disposeScrollListener();
    return super.close();
  }
}

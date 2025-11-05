import 'package:dark_and_light_theming/core/helpers/pagination_service.dart';
import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:dark_and_light_theming/features/home/data/repo/home_repo.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  late final PaginationService<Results> paginationService;
  List<Results> _allITems = [];

  HomeCubit(this.homeRepo) : super(HomeInitial());
  int page = 0;

  Future<void> fetchFirstPage() async {
    emit(HomeLoading());
    paginationService.refresh();
    final response = await paginationService.fetchNextPage();
    response?.when(
      success: (data) {
        _allITems = data ?? [];
        return emit(
          HomeSuccess(
            data: _allITems,
            isLoadingMore: false,
            nextPageError: null,
          ),
        );
      },
      failure: (failure) => emit(HomeError(errorMessage: failure.message)),
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
    response?.when(
      success: (data) {
        if (data == null || data.isEmpty) {
          emit(
            HomeSuccess(
              data: currentState.data,
              isLoadingMore: false,
              nextPageError: null,
            ),
          );
          return;
        }
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

}

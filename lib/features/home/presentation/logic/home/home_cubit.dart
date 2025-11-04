import 'package:dark_and_light_theming/core/networking/api_result.dart';
import 'package:dark_and_light_theming/features/home/data/repo/home_repo.dart';
import 'package:dark_and_light_theming/features/home/presentation/logic/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  int page = 0;

  Future<void> emitHomeStates() async {
    emit(HomeLoading());
    final response = await homeRepo.getMovies(page: page);
    response.when(
      success: (data) => emit(HomeSuccess(data: data)),
      failure: (errorMessage) =>
          emit(HomeError(errorMessage: errorMessage.message)),
    );
  }
}

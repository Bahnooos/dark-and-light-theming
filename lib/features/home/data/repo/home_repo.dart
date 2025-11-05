import 'package:dark_and_light_theming/core/networking/api_result.dart';
import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:dark_and_light_theming/features/home/data/remote/api_service.dart';

import '../../../../core/networking/api_errror_handler.dart';

class HomeRepo {
  final ApiService apiService;

  const HomeRepo({required this.apiService});

  Future<ApiResult<List<Results>>> getMovies({required int page}) async {
    try {
      final response = await apiService.getPopularMovies(page);
      return ApiResult.success(response.results??[]);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

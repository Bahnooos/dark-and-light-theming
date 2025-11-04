import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.popular)
  Future<List<MovesResponse>> getPopularMovies(
    @Query('page') int page, {
    @Query('language') String language = 'en',
  });
}

import 'package:dark_and_light_theming/core/networking/api_errror_handler.dart';
import 'package:dark_and_light_theming/core/networking/api_result.dart';

typedef PageFetcher<T> = Future<List<T>> Function({required int page});

class PaginationService<T> {
  final PageFetcher<T> _fetcher;
  final int _pageSize;
  int _currentPage = 0;
  bool _hasReachedMax = false;
  bool isLoading = false;

  PaginationService(this._fetcher, {int pageSize = 10}) : _pageSize = pageSize;

  Future<ApiResult<List<T>?>?> fetchNextPage() async {
    if (isLoading || _hasReachedMax) {
      return null;
    }
    isLoading = true;
    try {
      final newItems = await _fetcher(page: _currentPage);
      if (newItems.length < _pageSize) {
        _hasReachedMax = true;
      }
      _currentPage++;
      isLoading = false;
      return ApiResult.success(newItems);
    } catch (e) {
      isLoading = false;
      ApiResult.failure(ApiErrorHandler.handle(e));
      rethrow;
    }
  }

  void refresh() {
    _currentPage = 1;
    isLoading = false;
    _hasReachedMax = false;
  }
}

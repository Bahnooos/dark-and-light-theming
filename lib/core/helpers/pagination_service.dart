import 'package:dark_and_light_theming/core/networking/api_result.dart';

typedef PageFetcher<T> =
    Future<ApiResult<List<T>>> Function({required int page});

class PaginationService<T> {
  final PageFetcher<T> _fetcher;
  final int _pageSize;

  // FIX 1: Page numbers almost always start at 1.
  int _currentPage = 1;
  bool _hasReachedMax = false;
  bool isLoading = false;

  PaginationService(this._fetcher, {int pageSize = 10}) : _pageSize = pageSize;

  /// Returns the ApiResult for the Cubit, or null if already loading/maxed.
  Future<ApiResult<List<T>>?> fetchNextPage() async {
    if (isLoading || _hasReachedMax) {
      return null;
    }
    isLoading = true;

    final ApiResult<List<T>> result = await _fetcher(page: _currentPage);

    result.when(
      success: (List<T> newItems) {
        if (newItems.length < _pageSize) {
          _hasReachedMax = true;
        }
        _currentPage++;
        isLoading = false;
      },
      failure: (error) {
        isLoading = false;
      },
    );

    // Return the original result for the Cubit to read
    return result;
  }

  void refresh() {
    _currentPage = 1;
    isLoading = false;
    _hasReachedMax = false;
  }
}

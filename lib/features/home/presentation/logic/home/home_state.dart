// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess<T> extends HomeState {
  T? data;
  final bool isLoadingMore;

  final String? nextPageError;
  HomeSuccess({this.data, this.isLoadingMore = false, this.nextPageError});
}

class HomeError extends HomeState {
  final String? errorMessage;

  HomeError({required this.errorMessage});
}

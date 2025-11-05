import 'package:json_annotation/json_annotation.dart';
part 'moves_response.g.dart';

@JsonSerializable()
class MovesResponse {
  @JsonKey(name: 'backdrop_path')
  final int? page;
  final List<Results>? results;


  const MovesResponse(this.page, this.results,);
  factory MovesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovesResponseFromJson(json);
}

@JsonSerializable()
class Results {
  @JsonKey(name: 'backdrop_path')
  final String? image;
  final String? title;
  final String? overview;
  @JsonKey(name: 'vote_average')
  final String? rate;

  const Results(this.image, this.title, this.overview, this.rate);
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

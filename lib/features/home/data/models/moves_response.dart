import 'package:json_annotation/json_annotation.dart';
part 'moves_response.g.dart';

@JsonSerializable()
class MovesResponse {
  @JsonKey(name: 'backdrop_path')
  final String? image;
  final String? title;
  final String? overview;
  @JsonKey(name: 'vote_average')
  final String? rate;

  const MovesResponse(this.image, this.title, this.overview, this.rate);
  factory MovesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovesResponseFromJson(json);
}

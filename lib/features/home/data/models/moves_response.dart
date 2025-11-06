import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moves_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class MovesResponse extends HiveObject {
  @JsonKey(name: 'backdrop_path')
  @HiveField(0)
  final int? page;
  @HiveField(1)
  final List<Results>? results;

  MovesResponse(this.page, this.results);

  factory MovesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovesResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 1)
class Results extends HiveObject {
  @JsonKey(name: 'backdrop_path')
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? overview;
  @JsonKey(name: 'vote_average')
  @HiveField(3)
  final int? rate;

  Results(this.image, this.title, this.overview, this.rate);
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

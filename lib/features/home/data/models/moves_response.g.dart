// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovesResponse _$MovesResponseFromJson(Map<String, dynamic> json) =>
    MovesResponse(
      (json['backdrop_path'] as num?)?.toInt(),
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovesResponseToJson(MovesResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.page,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      json['backdrop_path'] as String?,
      json['title'] as String?,
      json['overview'] as String?,
      (json['vote_average'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'backdrop_path': instance.image,
      'title': instance.title,
      'overview': instance.overview,
      'vote_average': instance.rate,
    };

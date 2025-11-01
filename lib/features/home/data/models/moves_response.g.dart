// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovesResponse _$MovesResponseFromJson(Map<String, dynamic> json) =>
    MovesResponse(
      json['backdrop_path'] as String?,
      json['title'] as String?,
      json['overview'] as String?,
      json['vote_average'] as String?,
    );

Map<String, dynamic> _$MovesResponseToJson(MovesResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.image,
      'title': instance.title,
      'overview': instance.overview,
      'vote_average': instance.rate,
    };

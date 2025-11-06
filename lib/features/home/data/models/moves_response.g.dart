// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovesResponseAdapter extends TypeAdapter<MovesResponse> {
  @override
  final int typeId = 0;

  @override
  MovesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovesResponse(
      fields[0] as int?,
      (fields[1] as List?)?.cast<Results>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovesResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 1;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.errors,this.message, this.statusCode});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  String getAllErrorsMessages() {
    return errors!.entries.map((entry) {
      final value = entry.value;
      return '${value.join(', ')}';
    }).join('\n');
  }
}
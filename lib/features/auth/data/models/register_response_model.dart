import 'package:graphql_shoal_app/features/auth/data/models/json_converter.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/register_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable(converters: [RegisterDataConverter()])
class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.apiResponseStatus,
    required super.httpStatus,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

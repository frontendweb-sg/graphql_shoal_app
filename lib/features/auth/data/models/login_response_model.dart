import 'package:graphql_shoal_app/features/auth/data/models/json_converter.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(converters: [LoginDataConverter()])
class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required super.apiResponseStatus,
    required super.httpStatus,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

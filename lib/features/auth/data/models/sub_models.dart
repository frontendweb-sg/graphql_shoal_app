import 'package:graphql_shoal_app/features/auth/domain/entities/sub_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part "sub_models.g.dart";

///
/// Login data model
///
@JsonSerializable()
class LoginDataModel extends LoginDataEntity {
  const LoginDataModel({
    required super.accessToken,
    required super.refreshToken,
    required super.expiresIn,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}

///
/// Register data model
///
@JsonSerializable()
class RegisterDataModel extends RegisterDataEntity {
  const RegisterDataModel({required super.message});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
}

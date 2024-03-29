import 'package:equatable/equatable.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/sub_entities.dart';

class RegisterResponseEntity extends Equatable {
  final String? apiResponseStatus;
  final int? httpStatus;
  final String? message;
  final RegisterDataEntity? data;
  final List<dynamic>? errors;

  const RegisterResponseEntity({
    this.apiResponseStatus,
    this.httpStatus,
    this.message,
    this.data,
    this.errors,
  });

  @override
  List<Object?> get props => [
        apiResponseStatus,
        httpStatus,
        message,
        data,
        errors,
      ];
}

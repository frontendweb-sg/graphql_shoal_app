import 'package:equatable/equatable.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/sub_entities.dart';

class LoginResponseEntity extends Equatable {
  final String? apiResponseStatus;
  final int? httpStatus;
  final String? message;
  final LoginDataEntity? data;
  final List<dynamic>? errors;

  const LoginResponseEntity({
    this.apiResponseStatus,
    this.httpStatus,
    this.message,
    this.data,
    required this.errors,
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

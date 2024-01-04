import 'package:dartz/dartz.dart';
import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/register_response_entity.dart';

///
/// Abstract class that will wrap the implementation
/// Abstract is simply a interface class
///

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseEntity>> login(
      Map<String, dynamic> payload);
  Future<Either<Failure, RegisterResponseEntity>> register(
      Map<String, dynamic> payload);
}

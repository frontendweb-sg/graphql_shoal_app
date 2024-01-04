import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/features/auth/data/datasource/auth_service.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/register_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImp(this._authService);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      Map<String, dynamic> payload) async {
    try {
      final httpResponse = await _authService.login(payload);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(httpResponse.response.data);
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Left(error);
    }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
      Map<String, dynamic> payload) async {
    try {
      final httpResponse = await _authService.register(payload);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(httpResponse.response.data);
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Left(error);
    }
  }
}

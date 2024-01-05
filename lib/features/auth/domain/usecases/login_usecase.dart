import 'package:dartz/dartz.dart';
import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/core/usecases/usecase.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';

///
/// Login usecase
///
class LoginUseCase extends UseCase<Either<Failure, LoginResponseEntity>,
    Map<String, dynamic>> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call({
    Map<String, dynamic>? params,
  }) async {
    return await _authRepository.login(params!);
  }
}

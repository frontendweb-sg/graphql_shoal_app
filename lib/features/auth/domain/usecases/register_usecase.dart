import 'package:dartz/dartz.dart';
import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/core/usecases/usecase.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/register_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';

///
/// Register usecase
///
class RegisterUseCase extends UseCase<Either<Failure, RegisterResponseEntity>,
    Map<String, dynamic>> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, RegisterResponseEntity>> call(
      {Map<String, dynamic>? params}) async {
    return _authRepository.register(params!);
  }
}

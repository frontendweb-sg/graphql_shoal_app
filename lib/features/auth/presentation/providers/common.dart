import 'package:graphql_shoal_app/features/auth/data/datasource/auth_service.dart';
import 'package:graphql_shoal_app/features/auth/data/repository/auth_repository_imp.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';
import 'package:graphql_shoal_app/shared/providers/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Auth service provider
/// Initialize service for interact with api
///
final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(
    ref.watch(dioClientProvider),
  ),
);

///
/// Auth repository provider
/// Initialize repository to interact with auth service
///
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImp(
    ref.watch(authServiceProvider),
  ),
);

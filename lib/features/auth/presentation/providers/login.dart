import 'package:graphql_shoal_app/core/constants/constants.dart';
import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';
import 'package:graphql_shoal_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:graphql_shoal_app/features/auth/presentation/providers/common.dart';
import 'package:graphql_shoal_app/globals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Login notifier
///
class LoginNotifier extends StateNotifier<AsyncValue<LoginResponseEntity?>> {
  final AuthRepository _authRepository;
  LoginNotifier(this._authRepository) : super(const AsyncValue.data(null));

  ///
  /// Login method
  ///
  Future<void> login(Map<String, dynamic> payload) async {
    try {
      // start loading
      state = const AsyncLoading();

      // hit url for authenticating
      final response =
          await LoginUseCase(_authRepository).call(params: payload);

      // store response success / failure in state
      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) {
          // set auth token in local storage
          Globals.storageService.setValue(
            AppConstants.APP_AUTH_TOKEN,
            r.data!.accessToken,
          );

          // save success response in state
          return AsyncValue.data(r);
        },
      );
    } on Failure catch (error) {
      // catch and store error
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }
}

///
/// Login provider
///
final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginResponseEntity?>>(
  (ref) => LoginNotifier(
    ref.watch(authRepositoryProvider),
  ),
);

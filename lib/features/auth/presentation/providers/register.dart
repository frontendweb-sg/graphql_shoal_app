import 'package:graphql_shoal_app/core/errors/failure.dart';
import 'package:graphql_shoal_app/features/auth/domain/entities/register_response_entity.dart';
import 'package:graphql_shoal_app/features/auth/domain/repository/auth_repository.dart';
import 'package:graphql_shoal_app/features/auth/presentation/providers/common.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Register notifier
///
class RegisterNotifier
    extends StateNotifier<AsyncValue<RegisterResponseEntity?>> {
  final AuthRepository _authRepositoryImp;
  RegisterNotifier(this._authRepositoryImp)
      : super(const AsyncValue.data(null));

  ///
  /// register method
  ///
  void register(Map<String, dynamic> payload) async {
    try {
      // start loading
      state = const AsyncLoading();

      // hit url for authenticating
      final response = await _authRepositoryImp.register(payload);

      // store response success / failure in state
      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) => AsyncValue.data(r),
      );
    } on Failure catch (error) {
      // catch and store error
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }
}

///
/// Register provider
///
final registerProvider = StateNotifierProvider<RegisterNotifier,
    AsyncValue<RegisterResponseEntity?>>(
  (ref) => RegisterNotifier(
    ref.watch(authRepositoryProvider),
  ),
);

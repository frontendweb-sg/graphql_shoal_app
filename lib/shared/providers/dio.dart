import 'package:dio/dio.dart';
import 'package:graphql_shoal_app/core/network/dio_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// A global dio client provider
///
///
final dioClientProvider = Provider<Dio>((ref) {
  DioClient client = DioClient();
  return client.apiClient;
});

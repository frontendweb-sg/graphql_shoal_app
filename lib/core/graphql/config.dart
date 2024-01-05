import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../constants/constants.dart';

///
/// Graphql configuration
///
///
class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(AppConstants.APP_BASE_GRAPHQL_URL);

  ValueNotifier<GraphQLClient> init() {
    return ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
  }

  AuthLink authLink(String token) {
    return AuthLink(
      getToken: () => 'Bearer $token',
    );
  }
}

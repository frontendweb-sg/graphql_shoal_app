import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_shoal_app/config/theme/theme.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/core/services/storage_service.dart';
import 'package:graphql_shoal_app/features/auth/presentation/pages/login_screen.dart';
import 'package:graphql_shoal_app/features/home/presentation/pages/home_screen.dart';
import 'package:graphql_shoal_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:graphql_shoal_app/globals.dart';
import 'package:graphql_shoal_app/shared/providers/theme_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  // global configuration
  await Globals.initialization();

  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: Globals.graphqlClient,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StorageService storageService = Globals.storageService;
    bool isFirstTime = storageService.userFirstTimeOpenApp();
    bool isToken = storageService.userIsAuthenticated;

    Widget screen = const SplashScreen();
    if (isFirstTime && !isToken) {
      screen = const LoginScreen();
    } else if (isToken) {
      screen = const HomeScreen();
    }

    return MaterialApp(
      title: AppContent.strAppName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: screen,
    );
  }
}

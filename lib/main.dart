import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_shoal_app/config/theme/theme.dart';
import 'package:graphql_shoal_app/features/home/presentation/pages/home_screen.dart';
import 'package:graphql_shoal_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:graphql_shoal_app/gloabl.dart';
import 'package:graphql_shoal_app/shared/riverpods/theme_riverpod.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
        home:
            const HomeScreen() //!isFirstTime ? const SplashScreen() : const HomeScreen(),,
        );
  }
}

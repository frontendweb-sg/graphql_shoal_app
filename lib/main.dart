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
  await Globals.initialization();

  // DioClient client = DioClient();
  // final Logger logger = Logger();
  // final AuthService authService = AuthService(client.apiClient);
  // final AuthRepositoryImp authRepositoryImp = AuthRepositoryImp(authService);
  // authRepositoryImp.login({"userName": "pkumar", "password": "Admin@123"}).then(
  //     (value) => logger.i(value));

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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   final String readJobs = """
//    query JobQuery{
//   jobs {
//     id
//   }
// }
// """;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             button(
//               context,
//               onPressed: () {},
//               label: 'Hello world',
//               variant: Variant.text,
//             ),
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             Query(
//               options: QueryOptions(document: gql(readJobs)),
//               builder: (QueryResult result,
//                   {VoidCallback? refetch, FetchMore? fetchMore}) {
//                 return const Center(
//                   child: Text('hello'),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

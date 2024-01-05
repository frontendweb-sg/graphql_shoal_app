import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/core/graphql/config.dart';
import 'package:graphql_shoal_app/core/services/host_override_service.dart';
import 'package:graphql_shoal_app/core/services/storage_service.dart';

///
/// Global initializer
/// 1. intialize hive storage for local caching
/// 2. change system statusbar color
/// 3. initialize storage
/// 4. initialize graphql
///
class Globals {
  static late StorageService storageService;
  static late ValueNotifier<GraphQLClient> graphqlClient;

  static Future initialization() async {
    WidgetsFlutterBinding.ensureInitialized();

    // host
    if (Platform.isAndroid) {
      HttpOverrides.global = HostOverrideService();
    }

    //initialize hive
    await initHiveForFlutter();

    // change status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.kTransparent,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // initialize storage
    storageService = await StorageService().init();

    // initialize graphql client
    graphqlClient = GraphQLConfig().init();
  }
}

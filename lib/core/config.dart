import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:gowagr_assessment/features/Dashboard/data/models/response/events.dart';
import 'package:gowagr_assessment/features/Dashboard/data/models/response/markerts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

enum Environment { development, production }

class AppConfig {
  AppConfig._();

  static late Map<String, dynamic> _constants;

 

  static Future<void> initDependencies() async {
   // WidgetsFlutterBinding.ensureInitialized();
     
    AppConfig.setEnvironment(Environment.production);
  //    final dir = await getApplicationDocumentsDirectory();
  // Hive.init(dir.path);


  // Hive.registerAdapter(EventsAdapter());
  // Hive.registerAdapter(MarketsAdapter());
  //   await Hive.openBox('gowagrBox');

  //await Hive.openBox<List>('eventsBox');
 
 
   // await GetStorage.init();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static void setEnvironment(Environment environment) {
    switch (environment) {
      case Environment.development:
        log('SETTING UP DEV ENVIRONEMNT ========== ');
        _constants = _Constants.developmentConstants;
        break;

      case Environment.production:
        log('SETTING UP PROD ENVIRONEMNT ========== ');
        _constants = _Constants.prodConstants;
        break;
    }
  }

  static String get baseUrl {
    return _constants[_Constants.baseUrl]!;
  }

  static String get appName {
    return _constants[_Constants.appName]!;
  }

  static Environment get environment {
    return _constants[_Constants.environment]!;
  }
}

class _Constants {
  static const baseUrl = 'https://api.gowagr.app/pm/events/public-events';

  static const appName = 'APP_NAME';
  static const environment = 'ENVIRONMENT';

  static Map<String, dynamic> developmentConstants = {
    baseUrl: baseUrl,
    appName: 'Gowagr Dev',
    environment: Environment.development,
  };

  static Map<String, dynamic> prodConstants = {
    baseUrl: baseUrl,
    appName: 'Gowagr Prod',
    environment: Environment.production,
  };
}

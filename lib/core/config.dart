import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

enum Environment { development, production }

class AppConfig {
  AppConfig._();

  static late Map<String, dynamic> _constants;

  // dynamicLinking(BuildContext context) {
  //   StreamSubscription<String?>? _sub;

  //   _sub = linkStream.listen((String? link) {
  //     if (link != null) {
  //       _navigateToLink(link, context);
  //     }
  //   }, onError: (err) {
  //     // Handle error
  //   });
  // }

  // void _navigateToLink(String link, BuildContext context) {
  //   // Parse the link and navigate to a specific screen
  //   if (link.contains("DealsPage")) {
  //     MiddlemanNavigator.of(context).push(DealsRoute());
  //     // Navigator.pushNamed(context, '/specific-section');
  //   }
  // }

  static Future<void> initDependencies() async {
    //  PushNotificationService().initialize();
    // pushNotificationService.initialise();
    await GetStorage.init();
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
  static const baseUrl = 'https://igbigi-app-b20c541150a8.herokuapp.com';

  static const appName = 'APP_NAME';
  static const environment = 'ENVIRONMENT';

  static Map<String, dynamic> developmentConstants = {
    baseUrl: baseUrl,
    appName: 'XCel DEV',
    environment: Environment.development,
  };

  static Map<String, dynamic> prodConstants = {
    baseUrl: baseUrl,
    appName: 'XCel',
    environment: Environment.production,
  };
}

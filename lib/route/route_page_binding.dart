
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../main_counter.dart';
import '../page/test/testpage.dart';

class RoutePaths {

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    // '/': (settings, uniqueId) {
    //   return PageRouteBuilder<dynamic>(
    //       settings: settings, pageBuilder: (_, __, ___) => Container());
    // },
    'mainPage': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const MyHomePage(title: 'Flutter Demo Home Page');
          });
    },
    'simplePage': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            Map<String, Object> map = settings.arguments as Map<String, Object>;
            String data = map['data'] as String;
            return SimplePage(
              title: data,
            );
          });
    },
  };

}
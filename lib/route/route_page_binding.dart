import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:vp_module/app/env.dart';
import 'package:vp_module/route/route_paths.dart';

import '../main_counter.dart';
import '../page/test/testpage.dart';

class RoutePathsBinding {

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    // '/': (settings, uniqueId) {
    //   return PageRouteBuilder<dynamic>(
    //       settings: settings, pageBuilder: (_, __, ___) => Container());
    // },
    Paths.pageMain: (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const MyHomePage(title: Env.appEnv);
          });
    },
    Paths.pageSimple: (settings, uniqueId) {
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


import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class AppGlobalPageVisibilityObserver extends GlobalPageVisibilityObserver {
  @override
  void onPagePush(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageCreate route:${route.settings.name}');
  }

  @override
  void onPageShow(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageShow route:${route.settings.name}');
  }

  @override
  void onPageHide(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageHide route:${route.settings.name}');
  }

  @override
  void onPagePop(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageDestroy route:${route.settings.name}');
  }

  @override
  void onForeground(Route route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onForeground route:${route.settings.name}');
  }

  @override
  void onBackground(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onBackground route:${route.settings.name}');
  }
}

class BoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('boost-didPush${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('boost-didPop${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('boost-didRemove${route.settings.name}');
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('boost-didStartUserGesture${route.settings.name}');
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'main_origin.dart';

void main() {
  PageVisibilityBinding.instance
      .addGlobalObserver(AppGlobalPageVisibilityObserver());
  CustomFlutterBinding();
  runApp(const MyApp());
}

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

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class CustomInterceptor2 extends BoostInterceptor {
  @override
  void onPrePush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Logger.log('CustomInterceptor#onPrePush2~~~, $option');
    // Add extra arguments
    option.arguments!['CustomInterceptor2'] = "2";
    if (!option.isFromHost! && option.name == "interceptor") {
      handler.resolve(<String, dynamic>{'result': 'xxxx'});
    } else {
      handler.next(option);
    }
  }

  @override
  void onPostPush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Logger.log('CustomInterceptor#onPostPush2~~~, $option');
    handler.next(option);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name!];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory, interceptors: [
      CustomInterceptor2(),
    ]);
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

class MainPage extends StatelessWidget {
  const MainPage({super.key, required Object data});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Main Page')),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    Logger.log(title ?? '');
    return const Scaffold(
      body: Center(child: Text('SimplePage')),
    );
  }
}
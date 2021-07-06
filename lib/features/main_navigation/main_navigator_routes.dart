import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/home_navigator.dart';
import 'package:nested_navigation_demo_flutter/features/main_navigation/main_navigation.dart';
import 'package:nested_navigation_demo_flutter/features/report/report_page.dart';

class MainNavigatorRoutes {
  static const String root = '/';
  static const String report = '/report';
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigatorRoutes.root:
        return MaterialPageRoute(builder: (_) => MainNavigation());
      case HomeNavigatorRoutes.report:
        return MaterialPageRoute(
          builder: (_) => ReportPage(),
          fullscreenDialog: true,
        );
    }
    return null;
  }
}

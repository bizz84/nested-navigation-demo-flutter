
import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/detail_page.dart';
import 'package:nested_navigation_demo_flutter/master_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context)
        )
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => MasterPage(
        color: TabHelper.color(tabItem),
        title: TabHelper.description(tabItem),
        onPush: () => _push(context),
      ),
      TabNavigatorRoutes.detail: (context) => DetailPage(
        color: TabHelper.color(tabItem),
        title: TabHelper.description(tabItem),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {

    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return routeBuilders[routeSettings.name](context);
              }
          );
        });
  }
}
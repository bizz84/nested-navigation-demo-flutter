import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/detail_page.dart';
import 'package:nested_navigation_demo_flutter/master_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class RouteState {
  RouteState({this.name});
  String name;
  final navigatorKey = GlobalKey<NavigatorState>();
}

class AppState extends State<App> {
  static final String rootRoute = '/';
  static final String detailRoute = '/detail';

  TabItem currentTab = TabItem.red;
  Map<TabItem, RouteState> routes = {
    TabItem.red: RouteState(name: rootRoute),
    TabItem.green: RouteState(name: rootRoute),
    TabItem.blue: RouteState(name: rootRoute),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _push() async {
    routes[currentTab].name = detailRoute;
    await routes[currentTab].navigatorKey.currentState.pushNamed(detailRoute);
    routes[currentTab].name = rootRoute;
    print('pop');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabRootNavigation(
        currentTab: currentTab,
        initialRoute: routes[currentTab].name,
        navigatorKey: routes[currentTab].navigatorKey,
        onPush: _push,
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}

class TabRootNavigation extends StatelessWidget {
  TabRootNavigation({this.currentTab, this.initialRoute, this.navigatorKey, this.onPush});
  final TabItem currentTab;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onPush;

  static final String rootRoute = '/';
  static final String detailRoute = '/detail';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: TabHelper.color(currentTab),
      ),
      initialRoute: initialRoute,
      routes: {
        rootRoute: (context) => MasterPage(
              color: TabHelper.color(currentTab),
              title: TabHelper.description(currentTab),
              onPush: onPush,
            ),
        detailRoute: (context) => DetailPage(),
      },
    );
  }
}

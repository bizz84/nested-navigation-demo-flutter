import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/detail_page.dart';
import 'package:nested_navigation_demo_flutter/master_page.dart';

class AppRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class RouteState {
  RouteState({this.name: AppRoutes.root});
  String name;
  final navigatorKey = GlobalKey<NavigatorState>();
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> with NavigatorObserver {

  TabItem currentTab = TabItem.red;
  Map<TabItem, RouteState> routes = {
    TabItem.red: RouteState(),
    TabItem.green: RouteState(),
    TabItem.blue: RouteState(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _push() async {
    print('push ${TabHelper.description(currentTab)}');
    routes[currentTab].name = AppRoutes.detail;
    await routes[currentTab].navigatorKey.currentState.pushNamed(AppRoutes.detail);
    routes[currentTab].name = AppRoutes.root;
    print('pop ${TabHelper.description(currentTab)}');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        currentTab: currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }

  Widget _buildBody() {
    return MaterialApp(
      navigatorKey: routes[currentTab].navigatorKey,
      navigatorObservers: [ this ],
      theme: ThemeData(
        primarySwatch: TabHelper.color(currentTab),
      ),
      initialRoute: routes[currentTab].name,
      routes: {
        AppRoutes.root: (context) => MasterPage(
          color: TabHelper.color(currentTab),
          title: TabHelper.description(currentTab),
          onPush: _push,
        ),
        AppRoutes.detail: (context) => DetailPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/detail_page.dart';
import 'package:nested_navigation_demo_flutter/master_page.dart';

class AppNavigationState {
  TabNavigators navigators = TabNavigators();
  TabItem currentTab = TabItem.red;
}

class TabNavigators {
  final _redNavigatorKey = GlobalKey<NavigatorState>();
  final _greenNavigatorKey = GlobalKey<NavigatorState>();
  final _blueNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> navigator({TabItem tabItem}) {
    switch (tabItem) {
      case TabItem.red:
        return _redNavigatorKey;
      case TabItem.green:
        return _greenNavigatorKey;
      case TabItem.blue:
        return _blueNavigatorKey;
    }
    return null;
  }
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem currentTab = TabItem.red;
  TabNavigators navigators = TabNavigators();

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _push() {
    NavigatorState navigatorState =
        navigators.navigator(tabItem: currentTab).currentState;
    navigatorState.pushNamed("/detail");
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
      navigatorKey: navigators.navigator(tabItem: currentTab),
      theme: ThemeData(
        primarySwatch: TabHelper.color(currentTab),
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => MasterPage(
          color: TabHelper.color(currentTab),
          title: TabHelper.description(currentTab),
          onPush: _push,
        ),
        "/detail" : (context) => DetailPage(),
      },
    );
  }
}

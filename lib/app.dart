import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/global.dart';
import 'package:nested_navigation_demo_flutter/other_page.dart';
import 'package:nested_navigation_demo_flutter/tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.red;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Global.pageNavigatorKey.currentState.canPop()) {
          Global.pageNavigatorKey.currentState.pop();
          print("return false");
          return false;
        }

        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        String currentRoute = ModalRoute.of(context).settings.name;
        print("current route name is " + currentRoute);

        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.red) {
            _selectTab(TabItem.red);
            //* back button handled by app
            print("return false");
            return false;
          }
        }

        print("returned is " + isFirstRouteInCurrentTab.toString());

        return isFirstRouteInCurrentTab;
      },
      child: Navigator(
        key: Global.pageNavigatorKey,
        onGenerateRoute: (settings) {
          print(settings.name);
          if (settings.name == '/other') {
            return MaterialPageRoute(
              builder: (context) => OtherPage(),
            );
          }

          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Stack(
                children: <Widget>[
                  _buildOffstageNavigator(TabItem.red),
                  _buildOffstageNavigator(TabItem.green),
                  _buildOffstageNavigator(TabItem.blue),
                ],
              ),
              bottomNavigationBar: BottomNavigation(
                currentTab: _currentTab,
                onSelectTab: _selectTab,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

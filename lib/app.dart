import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';

class MasterPage extends StatelessWidget {
  MasterPage({this.color, this.onPush});
  final Color color;
  final VoidCallback onPush;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          'PUSH',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        onPressed: onPush,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class TabNavigators {

  final redNavigatorKey = GlobalKey<NavigatorState>();
  final greenNavigatorKey = GlobalKey<NavigatorState>();
  final blueNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> navigator({TabItem tabItem}) {
    switch (tabItem) {
      case TabItem.red:
        return redNavigatorKey;
      case TabItem.green:
        return greenNavigatorKey;
      case TabItem.blue:
        return blueNavigatorKey;
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
    NavigatorState navigatorState = navigators.navigator(tabItem: currentTab).currentState;
    navigatorState.push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return DetailPage();
      },
    ));
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            TabHelper.description(currentTab),
          ),
          backgroundColor: TabHelper.color(currentTab),
        ),
        body: MasterPage(
          color: TabHelper.color(currentTab),
          onPush: _push,
        )
      ),
    );
  }
}

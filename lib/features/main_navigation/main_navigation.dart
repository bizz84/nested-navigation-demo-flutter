import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/help/help_page.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/home_navigator.dart';
import 'package:nested_navigation_demo_flutter/features/main_navigation/bottom_navigation.dart';
import 'package:nested_navigation_demo_flutter/features/payments/payments_page.dart';
import 'package:nested_navigation_demo_flutter/tab_item.dart';

class MainNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  // Note: these variables encapsulate state that is only accessible to this AppState instance.
  // If you want to share state between multiple widget instances, you have a couple of options:
  // 1. Use Navigator 2.0 (https://flutter.io/docs/widgets/Navigator-2.0)
  // 2. Move this state to a separate class that can be shared between widgets.
  final _pageController = PageController(initialPage: 0);
  var _currentTab = TabItem.home;

  // Navigator key used for nested navigation in the home page
  final _homeNavigatorKey = GlobalKey<NavigatorState>();

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      if (_currentTab == TabItem.home) {
        // pop to first route
        _homeNavigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
    } else {
      setState(() {
        _pageController.jumpToPage(tabItem.index);
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MainNavigation rebuild');
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab == TabItem.home) {
          return !await _homeNavigatorKey.currentState!.maybePop();
          // if (isFirstRouteInCurrentTab) {
          //   // if not on the 'main' tab
          //   if (_currentTab != TabItem.home) {
          //     // select 'main' tab
          //     _selectTab(TabItem.home);
          //     // back button handled by app
          //     return false;
          //   }
          // }
          // let system handle back button if we're on the first route
          //return isFirstRouteInCurrentTab;
        }
        return true;
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // TODO: Stack not preserved when tabs are switched
            HomeNavigator(
              navigatorKey: _homeNavigatorKey,
            ),
            PaymentsPage(),
            HelpPage(
              onHome: () => _selectTab(TabItem.home),
              onPayments: () => _selectTab(TabItem.payments),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}

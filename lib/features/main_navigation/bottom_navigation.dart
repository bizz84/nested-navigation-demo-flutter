import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final selectedItemColor = Theme.of(context).primaryColor;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.home, selectedItemColor),
        _buildItem(TabItem.payments, selectedItemColor),
        _buildItem(TabItem.help, selectedItemColor),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: selectedItemColor,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, Color selectedItemColor) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        color: currentTab == tabItem ? selectedItemColor : Colors.grey,
      ),
      label: tabName[tabItem],
    );
  }
}

import 'package:flutter/material.dart';

enum TabItem { home, payments, help }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.payments: 'Payments',
  TabItem.help: 'Help',
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.payments: Icons.payment,
  TabItem.help: Icons.help,
};

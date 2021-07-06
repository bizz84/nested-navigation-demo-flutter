import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/home_page.dart';
import 'package:nested_navigation_demo_flutter/features/home_page/models/transaction.dart';
import 'package:nested_navigation_demo_flutter/features/transaction_details/transaction_details.dart';

class HomeNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
  static const String report = '/report';
}

class HomeNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeNavigatorRoutes.root:
        return MaterialPageRoute(builder: (_) => HomePage());
      case HomeNavigatorRoutes.detail:
        final transaction = settings.arguments as Transaction;
        return MaterialPageRoute(
            builder: (_) => TransactionDetails(transaction: transaction)
            // fullscreenDialog: false,
            );
    }
    return null;
  }
}

class HomeNavigator extends StatelessWidget {
  HomeNavigator({required this.navigatorKey});
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      // TODO: Need to change this and persist it somewhere!!!
      initialRoute: HomeNavigatorRoutes.root,
      onGenerateRoute: HomeNavigatorRouter.generateRoute,
    );
  }
}

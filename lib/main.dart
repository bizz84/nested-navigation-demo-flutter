import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/features/main_navigation/main_navigator_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: MainNavigatorRoutes.root,
      onGenerateRoute: MainNavigatorRouter.generateRoute,
    );
  }
}

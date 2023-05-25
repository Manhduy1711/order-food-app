import 'package:dhk_food/screen/home/category.dart';
import 'package:dhk_food/screen/home/home-screen.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case "/":
                  return const HomeScreen();
                case "/category":
                  return  Category(category: (settings.arguments as Map)["category"],);
                default:
                  return AppBar(title: Text("Error"),);
              }
            });
      },
    );
  }
}

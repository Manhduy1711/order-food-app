import 'package:dhk_food/screen/cart/cart-screen.dart';
import 'package:dhk_food/screen/cart/checkout-processing.dart';
import 'package:flutter/material.dart';

class CartRoute extends StatelessWidget {
  const CartRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case "/":
                return const CartScreen();
              case "checkout":
                return CheckoutProcessing();
              default:
                return AppBar(title: Text("Error"),);
            }
          }
        );
      },
    );
  }
}

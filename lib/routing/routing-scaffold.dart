import 'package:dhk_food/providers/cart-provider.dart';
import 'package:dhk_food/routing/cart-route.dart';
import 'package:dhk_food/routing/home-route.dart';
import 'package:dhk_food/screen/auth/login-screen.dart';
import 'package:dhk_food/screen/history/history-screnn.dart';
import 'package:dhk_food/screen/home/home-screen.dart';
import 'package:dhk_food/screen/setting/setting-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class RoutingScaffold extends StatefulWidget {
  const RoutingScaffold({Key? key}) : super(key: key);

  @override
  State<RoutingScaffold> createState() => _RoutingScaffoldState();
}

class _RoutingScaffoldState extends State<RoutingScaffold> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          color: Colors.grey.shade700,
          activeColor: Colors.white,
          onTabChange: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            },
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabBackgroundGradient: const LinearGradient(
            colors: [Colors.deepOrange, Colors.deepOrangeAccent, Color(
                0xFFFDA766)]
          ),
          tabs:  [
            const GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
              leading: Badge(
                largeSize: 25,
                offset: const Offset(12,-16),
                label: Text("${context.watch<Cart>().getTotalAmountOrders()}", style: const TextStyle(
                  fontSize: 16
                ),),
                child: Icon(
                  Icons.shopping_cart,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey.shade700,
                ),
              ),
            ),
            const GButton(
              icon: Icons.history,
              text: "History",
            ),
            const GButton(
              icon: Icons.settings,
              text: "Setting",
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children:  [
          const HomeRoute(),
          const CartRoute(),
          const HistoryScreen(),
          SettingScreen()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class NavScreen extends StatefulWidget {
  static String route = "/";
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selected = 0;
  var pages = [const HomeScreen(), const CartScreen(), const OrderScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Nav(
          index: selected,
          onTap: (int index) {
            setState(() {
              selected = index;
            });
          },
          inputs: const [
            NavItem(
              icon: Icons.home,
              tite: "Home",
            ),
            NavItem(
              icon: Icons.card_travel_outlined,
              tite: "Cart",
            ),
            NavItem(
              icon: Icons.receipt_long_outlined,
              tite: "Orders",
            ),
          ],
        ),
        body: pages[selected]);
  }
}

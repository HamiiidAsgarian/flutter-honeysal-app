import 'package:bakery/model/app_initializer.dart';
import 'package:bakery/model/core_models/order_model.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/model/home_elements_models/home_model.dart';
import 'package:flutter/cupertino.dart';
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
  late AppInitializer appInit;
  @override
  void initState() {
    appInit = AppInitializer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late List<Widget> pages;

    return FutureBuilder(
        future: appInit.getApiData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            appInit.updateTheState(context);
            List<Product> favoriteData = appInit.appdata.favorites;

            List<Product> cartData = appInit.appdata.cart;
            List<Order> orderData = appInit.appdata.orders;
            HomePageElements homeElements = appInit.appdata.homePageElements;
            pages = [
              HomeScreen(data: homeElements, favorites: favoriteData),
              CartScreen(data: cartData),
              OrderScreen(data: orderData)
            ];
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
          return const CupertinoActivityIndicator();
        }));
  }
}

class ShiminLoading extends StatelessWidget {
  const ShiminLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 75,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
              )),
            ],
          ),
        )
      ],
    ));
  }
}

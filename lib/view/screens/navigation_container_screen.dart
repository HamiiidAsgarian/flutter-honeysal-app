import 'package:bakery/consts.dart';
import 'package:bakery/core/app_initializer.dart';
import 'package:bakery/model/core_models/order_model.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/model/home_elements_models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cart_bloc.dart';
import '../widgets/nav_bar.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class NavScreen extends StatefulWidget {
  static String route = "/1";
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selected = 0;
  final ValueNotifier<int> _selected = ValueNotifier(0);
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
        future: appInit.getApiData(context),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            appInit.updateTheState(context);
            // BlocProvider.of<CartBloc>(context).add(GetCartData(data: appdata.cart));

            List<Product> favoriteData = appInit.appdata.favorites;

            List<Product> cartData = appInit.appdata.cart;
            List<Order> orderData = appInit.appdata.orders;
            HomePageElements homeElements = appInit.appdata.homePageElements;
            pages = [
              HomeScreen(data: homeElements, favorites: favoriteData),
              CartScreen(data: cartData),
              OrderScreen(data: orderData)
            ];
            return ValueListenableBuilder(
                valueListenable: _selected,
                builder: ((context, value, child) {
                  return Scaffold(
                      bottomNavigationBar: Nav(
                        index: value,
                        onTap: (int index) {
                          _selected.value = index;
                        },
                        inputs: [
                          const NavItem(
                            icon: Icons.home,
                            tite: "Home",
                          ),
                          Stack(
                            children: [
                              const NavItem(
                                icon: Icons.card_travel_outlined,
                                tite: "Cart",
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  if (state.cartData.isNotEmpty) {
                                    return Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          backgroundColor: AppConst.mainRed,
                                          radius: 7.5,
                                          child: FittedBox(
                                              child: Text(
                                                  "${state.cartData.length}")),
                                        ));
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              )
                            ],
                          ),
                          const NavItem(
                            icon: Icons.receipt_long_outlined,
                            tite: "Orders",
                          ),
                        ],
                      ),
                      body: pages[value]);
                }));
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

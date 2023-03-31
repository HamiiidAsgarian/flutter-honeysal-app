import 'package:bakery/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cart_bloc.dart';
import '../widgets/nav_bar.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class NavScreen extends StatelessWidget {
  final int initScreen;
  static String route = "/1";
  const NavScreen({super.key, this.initScreen = 0});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selected = ValueNotifier(initScreen);

    late List<Widget> pages = [
      const HomeScreen(),
      const CartScreen(),
      const OrderScreen()
    ];

    return ValueListenableBuilder(
        valueListenable: selected,
        builder: ((context, value, child) {
          return Scaffold(
              bottomNavigationBar: Nav(
                index: value,
                onTap: (int index) {
                  selected.value = index;
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
                                      child: Text("${state.cartData.length}")),
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
}

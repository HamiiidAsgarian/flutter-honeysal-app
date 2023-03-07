import 'package:bakery/model/product_model.dart';
import 'package:bakery/view_model/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(GetAllProducts());
    var pages = [const HomeScreen(), const CartScreen(), const OrderScreen()];

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.products.isEmpty) {
          return const CupertinoActivityIndicator();
        }
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
      },
    );
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

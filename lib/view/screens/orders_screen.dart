import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/pickup_screen.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utilities.dart';
import '../../model/cart_screen_models/cart_item_model.dart';
import '../../model/core_models/order_model.dart';
import '../../view_model/orders_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/time_and_date.dart';

class OrderScreen extends StatelessWidget {
  static String route = "/OrderScreen";
  // final List<Order> data;
  final bool backButton;

  const OrderScreen(
      {super.key,
      // this.data = const [],
      this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Orders", backButton: backButton),
      // bottomNavigationBar: const MyNav(),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.orderData.isEmpty ? 1 : state.orderData.length,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.appHorizontalPadding, vertical: 10),
              itemBuilder: (context, index) {
                if (state.orderData.isEmpty) {
                  return const Text("There is no order",
                      style: AppConst.normalDescriptionStyle);
                } else {
                  return TweenAnimationBuilder(
                    duration: AppConst.cartsAppearDurationMaker(index),
                    tween: Tween(
                        begin: MediaQuery.of(context).size.width, end: 0.0),
                    builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Transform.translate(
                            offset: Offset(value, 0),
                            child: OrderCard(data: state.orderData[index]))),
                  );
                }
              });
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order data;
  // final String orderNumber;
  // final String price;
  // final List
  const OrderCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CountedProductItem> productSet =
        productsListToCartItemSet(data.products);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(data.stage.status!.name,
                style: AppConst.normalDescriptionStyle)
          ],
        ),
        const SizedBox(height: 15),
        Container(
            //For the shadow to appear
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppConst.mainWhite,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, color: AppConst.mainGrey)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order#: ${data.id}",
                        style: AppConst.sectionTitleStyle),
                    Text("\$${data.totalCost}",
                        style: AppConst.sectionTitleStyle)
                  ],
                ),
                const SizedBox(height: 5),
                TimeAndDate(time: data.time, date: data.date),
                const SizedBox(height: 10),
                Column(
                    // itemCount: 5,
                    children: List.generate(productSet.length, (index) {
                  return Column(
                    children: [
                      index == 0
                          ? const SizedBox()
                          : Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Divider(
                                thickness: 2,
                                height: 2,
                                color: AppConst.borderGrey,
                              )),
                      OrderFactorItem(product: productSet[index])
                    ],
                  );
                })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyRoundButton(
                        isActive: true,
                        type: CutomRoundedButtonType.pusher,
                        icon: Icons.list_alt_outlined,
                        onTap: (isSelected) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => PickupScreen(
                                      closeButton: false,
                                      backButton: true,
                                      data: data))));
                        }),
                    const SizedBox(width: 25),
                    MyRoundButton(
                        isActive: true,
                        type: CutomRoundedButtonType.pusher,
                        icon: Icons.shopping_bag_outlined,
                        onTap: (isSelected) {
                          showSnackBar(
                              context,
                              "This order has been added to the cart",
                              SnackbarType.add);
                          BlocProvider.of<CartBloc>(context)
                              .add(AddListToCart(item: data.products));
                        }),
                  ],
                )
              ],
            ))
      ],
    );
  }
}

class OrderFactorItem extends StatelessWidget {
  final CountedProductItem product;

  const OrderFactorItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            //NOTE might need a little fix how to handle title overflow
            child: Row(
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  // color: Colors.green,
                  child: CachedNetworkImage(imageUrl: product.product.imageUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text("${product.product.title} (x${product.count})",
                      style: AppConst.normalDescriptionStyle),
                )
              ],
            ),
          ),
          Text("\$${product.product.price}", style: AppConst.sectionTitleStyle)
        ],
      ),
    );
  }
}

import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:bakery/view/widgets/horizontal_card.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/core_models/product_model.dart';

class CartScreen extends StatelessWidget {
  static String route = "/CartScreen";

  final List<Product> data;
  final bool backButton;

  const CartScreen({super.key, this.data = const [], this.backButton = false});

  @override
  Widget build(BuildContext context) {
    int length = a(context).first.length;
    List items2 = a(context)[0];
    List items3 = a(context)[1];

    print(items2);
    return Scaffold(
        appBar: CustomAppbar(
          backButton: backButton,
          title: "Cart",
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          top: 20,
                          right: AppConst.appHorizontalPadding,
                          left: AppConst.appHorizontalPadding),
                      child: HorizontalCard(
                          style: HorizontalCardStyle.counter,
                          counterInitValue: items3[index],
                          data: items2[index],
                          onChangeCounter: (int index) {
                            print(index);
                          }),
                    );
                  }),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: AppConst.borderGrey))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConst.appHorizontalPadding,
                        vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecieptRow(
                          title: "Subtotal",
                          price: "\$${totalSumCalc()[0]}",
                        ),
                        RecieptRow(
                          title: "Discount",
                          price: "\$${totalSumCalc()[1]}",
                        ),
                        RecieptRow(
                          title: "Total",
                          price: "\$${totalSumCalc()[2]}",
                          style: RecieptRowStyle.bold,
                        ),
                        MainButton(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, CheckoutScreen.route);
                            },
                            title: "Checkout")
                      ],
                    )))
          ],
        ));
  }

  List<List> a(context) {
    Map<dynamic, int> temp = {};
    List products = [];

    List<Product> cartItems = BlocProvider.of<CartBloc>(context).state.cartData;

    for (var element in cartItems) {
      if (temp.containsKey("${element.title}${element.price}")) {
        temp["${element.title}${element.price}"] =
            temp["${element.title}${element.price}"]! + 1;
      } else {
        products.add(element);
        temp["${element.title}${element.price}"] = 0;
      }
    }
    return [products, temp.values.toList()];
  }

  List<String> totalSumCalc() {
    double discountPercentage = 0.01;
    double subTotal = 0;
    double discount = 0;
    double total = 0;

    for (Product element in data) {
      subTotal += element.price;
    }

    discount = (subTotal * discountPercentage);
    total = subTotal - discount;
    return [
      subTotal.toStringAsFixed(2),
      discount.toStringAsFixed(2),
      total.toStringAsFixed(2)
    ];
  }
}

class RecieptRow extends StatelessWidget {
  final String? title;
  final String? price;
  final RecieptRowStyle? style;

  const RecieptRow({
    Key? key,
    this.title,
    this.price,
    this.style = RecieptRowStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title ?? "",
          style: style == RecieptRowStyle.normal
              ? AppConst.normalDescriptionStyle
              : AppConst.detailPriceStyle),
      Text(price ?? "",
          style: style == RecieptRowStyle.normal
              ? AppConst.normalDescriptionStyle
              : AppConst.detailPriceStyle),
    ]);
  }
}

enum RecieptRowStyle { normal, bold }

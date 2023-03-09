import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:bakery/view/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';

import '../../model/core_models/product_model.dart';

class CartScreen extends StatelessWidget {
  static String route = "/CartScreen";

  final List<Product> data;

  const CartScreen({super.key, this.data = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: "Cart",
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(
                            top: 20,
                            right: AppConst.appHorizontalPadding,
                            left: AppConst.appHorizontalPadding),
                        child: HorizontalCard(
                          style: HorizontalCardStyle.counter,
                          data: data[index],
                        ),
                      )),
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
                        const RecieptRow(
                          title: "Subtotal",
                          price: "\$${29.8}",
                        ),
                        const RecieptRow(
                          title: "Discount",
                          price: "\$${29.8}",
                        ),
                        const RecieptRow(
                          title: "Total",
                          price: "\$${29.8}",
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

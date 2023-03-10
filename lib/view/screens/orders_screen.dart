import 'package:bakery/consts.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../../model/core_models/order_model.dart';
import '../../model/core_models/product_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/time_and_date.dart';

class OrderScreen extends StatelessWidget {
  static String route = "/OrderScreen";
  final List<Order> data;
  final bool backButton;

  const OrderScreen({super.key, this.data = const [], this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Orders", backButton: backButton),
      // bottomNavigationBar: const MyNav(),
      body: ListView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.appHorizontalPadding, vertical: 10),
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: OrderCard(data: data[index]))),
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(data.stage, style: AppConst.normalDescriptionStyle)],
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
                    children: List.generate(data.products.length, (index) {
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
                      OrderFactorItem(data: data.products[index])
                    ],
                  );
                })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyRoundButton(
                        selectionStatus: true,
                        type: CutomRoundedButtonType.pusher,
                        icon: Icons.shopping_bag_outlined,
                        onTap: (isSelected) {})
                  ],
                )
              ],
            ))
      ],
    );
  }
}

class OrderFactorItem extends StatelessWidget {
  final Product data;
  const OrderFactorItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 75,
              height: 75,
              color: Colors.green,
              child: Image.network(data.imageUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(data.title, style: AppConst.normalDescriptionStyle)
          ],
        ),
        Text("\$${data.price}", style: AppConst.sectionTitleStyle)
      ],
    );
  }
}

import 'package:bakery/consts.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/nav_bar.dart';
import '../widgets/time_and_date.dart';

class OrderScreen extends StatelessWidget {
  static String route = "/OrderScreen";

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      bottomNavigationBar: const MyNav(),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.appHorizontalPadding, vertical: 10),
          itemCount: 5,
          itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 20), child: OrderCard())),
    );
  }
}

class OrderCard extends StatelessWidget {
  // final String orderNumber;
  // final String price;
  // final List
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("Ongoing", style: AppConst.normalDescriptionStyle)
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
                  children: const [
                    Text("Order#: 18889899", style: AppConst.sectionTitleStyle),
                    Text("\$${3.28}", style: AppConst.sectionTitleStyle)
                  ],
                ),
                const SizedBox(height: 5),
                const TimeAndDate(time: "09:45 PM", date: "31 Dec 2021"),
                const SizedBox(height: 10),
                Column(
                    // itemCount: 5,
                    children: List.generate(2, (index) {
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
                      const OrderFactorItem()
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
  const OrderFactorItem({
    Key? key,
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
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Wheat Bread X2", style: AppConst.normalDescriptionStyle)
          ],
        ),
        const Text("\$${2.99}", style: AppConst.sectionTitleStyle)
      ],
    );
  }
}

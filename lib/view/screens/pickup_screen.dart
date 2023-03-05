import 'package:bakery/consts.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:bakery/view/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/time_and_date.dart';

class PickupScreen extends StatelessWidget {
  static String route = "/PickupScreen";

  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      bottomNavigationBar: const MyNav(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConst.appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const DeliveryTimeSection(),
              const SizedBox(height: 35),
              const DeliveryStage(),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppConst.borderGrey,
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                child: const Center(
                  child: Text(
                      "plaesegive the track order to your employee to collect your order,thank you!",
                      textAlign: TextAlign.center,
                      style: AppConst.smallTextStyle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryStage extends StatelessWidget {
  const DeliveryStage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, top: 20, left: 20, right: 20),
      height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppConst.mainWhite,
          boxShadow: const [
            BoxShadow(blurRadius: 5, color: AppConst.mainGrey)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
                // color: Colors.red,
                border: Border(
                    bottom: BorderSide(width: 2, color: AppConst.borderGrey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Track Order",
                  style: AppConst.normalDescriptionStyle,
                ),
                Text(
                  "1866552",
                  style: AppConst.normalDescriptionStyle.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          OrderStage(
            leading: MyRoundButton(
                selectedColor: AppConst.mainGreen,
                // fillColor: AppConst.mainGreen,
                onTap: (e) {},
                icon: Icons.check_circle,
                selectionStatus: true),
            title: "Order placed and confirmed",
            time: "06:14 PM",
            date: "31 Dec 2023",
          ),
          OrderStage(
            leading: MyRoundButton(
              selectionStatus: true,
              selectedColor: AppConst.mainOrange,
              // fillColor: AppConst.mainOrange,
              onTap: (e) {},
              icon: Icons.delivery_dining,
            ),
            title: "Order processed",
            time: "08:17 PM",
            date: "31 Dec 2023",
          ),
          OrderStage(
            leading: MyRoundButton(
              selectionStatus: false,
              selectedColor: AppConst.mainBlue,
              // fillColor: AppConst.mainBlue,
              onTap: (e) {},
              icon: Icons.check,
            ),
            title: "Order ready to collect",
            time: "Soon",
            date: "soon",
          ),
        ],
      ),
    );
  }
}

class OrderStage extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final bool? isActive;
  final Widget? leading;

  const OrderStage({
    Key? key,
    this.title = "",
    this.time = "",
    this.date = "",
    this.isActive,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        leading != null ? leading! : const SizedBox(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppConst.normalDescriptionStyle),
            const SizedBox(height: 5),
            TimeAndDate(time: time, date: date)
          ],
        )
      ],
    );
  }
}

class DeliveryTimeSection extends StatelessWidget {
  const DeliveryTimeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Estimated DElivery",
            style: AppConst.normalDescriptionStyle),
        const SizedBox(height: 15),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("1 jan 2022", style: AppConst.detailPriceStyle),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: VerticalDivider(
                  width: 3,
                  thickness: 2,
                  color: AppConst.borderGrey,
                ),
              ),
              Text("05:00 Am", style: AppConst.detailPriceStyle)
            ],
          ),
        )
      ],
    );
  }
}

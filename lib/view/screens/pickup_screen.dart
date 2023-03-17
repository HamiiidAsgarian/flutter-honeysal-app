import 'package:bakery/consts.dart';
import 'package:bakery/model/core_models/order_model.dart';
import 'package:bakery/view/screens/navigation_container_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../widgets/time_and_date.dart';

class PickupScreen extends StatelessWidget {
  static String route = "/PickupScreen";
  final bool backButton;
  final Order data;

  const PickupScreen({super.key, this.backButton = false, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        backButton: backButton,
        action: MyRoundButton(
          icon: Icons.close,
          onTap: (e) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const NavScreen()),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConst.appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              DeliveryTimeSection(time: data.time, date: data.date),
              const SizedBox(height: 35),
              DeliveryStage(
                  data: data,
                  stage: "${data.stage.status}"), //NOTE: nullable id
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppConst.borderGrey,
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                child: const Center(
                  child: Text(
                      "plaese give the track order to your employee to collect your order,thank you!",
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
  final Order data;
  final String stage;
  const DeliveryStage({
    Key? key,
    required this.data,
    required this.stage,
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
                  "${data.id}",
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
                isActive: data.stage.confirm != null),
            title: "Order placed and confirmed",
            time:
                data.stage.confirm != null ? data.stage.confirm!.time! : "Soon",
            date:
                data.stage.confirm != null ? data.stage.confirm!.date! : "Soon",
          ),
          OrderStage(
            leading: MyRoundButton(
              isActive: data.stage.process != null,
              selectedColor: AppConst.mainOrange,
              // fillColor: AppConst.mainOrange,
              onTap: (e) {},
              icon: Icons.delivery_dining,
            ),
            title: "Order processed",
            time:
                data.stage.process != null ? data.stage.process!.time! : "Soon",
            date:
                data.stage.process != null ? data.stage.process!.date! : "Soon",
          ),
          OrderStage(
            leading: MyRoundButton(
              isActive: data.stage.ready != null,
              selectedColor: AppConst.mainBlue,
              // fillColor: AppConst.mainBlue,
              onTap: (e) {},
              icon: Icons.check,
            ),
            title: "Order ready to collect",
            time: data.stage.ready != null ? data.stage.ready!.time! : "Soon",
            date: data.stage.ready != null ? data.stage.ready!.date! : "Soon",
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
  final String time;
  final String date;
  const DeliveryTimeSection({
    Key? key,
    required this.time,
    required this.date,
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
            children: [
              Text(date, style: AppConst.detailPriceStyle),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: VerticalDivider(
                  width: 3,
                  thickness: 2,
                  color: AppConst.borderGrey,
                ),
              ),
              Text(time, style: AppConst.detailPriceStyle)
            ],
          ),
        )
      ],
    );
  }
}

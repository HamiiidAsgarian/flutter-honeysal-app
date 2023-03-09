import 'package:bakery/model/home_elements_models/promotion_model.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class PromotionCard extends StatelessWidget {
  final Promotion data;
  const PromotionCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConst.appHorizontalPadding, vertical: 10),
      height: 150, // NOTE may cause problem
      // margin: const EdgeInsets.only(
      //     right: 15, bottom: 5, top: 5), //Margin to show shadow
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: AppConst.mainOrange,
          borderRadius: BorderRadius.circular(5),
          // color: Colors.red,
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(110, 180, 180, 180),
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          AspectRatio(
            // widthFactor: 1,
            aspectRatio: 1,
            child: Container(
              color: Colors.white,
              child: Image.network(data.imageUrl),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //data title
                Text("---${data.title}", style: AppConst.productTitleStyle),
                Text(data.message.toString(),
                    style: AppConst.normalDescriptionStyle
                        .copyWith(fontWeight: FontWeight.bold)
                        .copyWith(color: AppConst.mainRed)),
                Text("Enter the code ${data.code} at checkout",
                    style: AppConst.productSubtitleStyle),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

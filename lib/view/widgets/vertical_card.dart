import 'package:bakery/view/widgets/heart_button.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../model/core_models/product_model.dart';

class VerticalCard extends StatelessWidget {
  final Product data;
  final Function onTapButton;
  final Function onTapFavorite;
  final bool isFavoriteSelected;
  const VerticalCard(
      {Key? key,
      required this.data,
      required this.onTapButton,
      required this.onTapFavorite,
      required this.isFavoriteSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      // height: 320,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          // color: Colors.red,
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(110, 180, 180, 180),
                spreadRadius: 2)
          ]),
      child: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                // widthFactor: 1,
                aspectRatio: 1,
                child: Container(
                    color: Colors.white, child: Image.network(data.imageUrl)),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title, style: AppConst.productTitleStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${data.left} Left",
                            style: AppConst.productSubtitleStyle),
                        const Text("  |  ",
                            style: AppConst.productSubtitleStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: AppConst.mainOrange,
                              size: 20,
                            ),
                            Text("${data.rate}",
                                style: AppConst.productSubtitleStyle)
                          ],
                        )
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: '\$${data.price} ',
                        style: AppConst.productTitleStyle,
                        children: const <TextSpan>[
                          TextSpan(
                            text: '/a piece',
                            style: AppConst.productSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 35, child: MainButton(onPress: onTapButton))
                  ],
                ),
              )
              // const SizedBox(width: 5),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: HeartButton(
              isActive: isFavoriteSelected,
              onTap: (isActive) {
                onTapFavorite(isActive);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final Color fillColor;
  final Color titleColor;

  const MainButton({
    Key? key,
    required this.onPress,
    this.title = "Add to Cart",
    this.fillColor = AppConst.mainOrange,
    this.titleColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: fillColor.withOpacity(.3),
              spreadRadius: .1,
              blurRadius: 30)
        ]),
        width: double.infinity,
        height: 50,
        child: MaterialButton(
            highlightColor: AppConst.lightOrange,
            elevation: 0,
            splashColor: AppConst.lightOrange,
            color: fillColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () => onPress(),
            child: Text(title,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 17,
                    color: titleColor,
                    fontWeight: FontWeight.w500))));
  }
}

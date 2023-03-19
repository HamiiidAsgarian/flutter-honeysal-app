import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/widgets/heart_button.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../model/core_models/product_model.dart';
import 'my_rounded_button.dart';

class HorizontalCard extends StatelessWidget {
  final Function(int index)? onChangeCounter;
  final Function? onTapDelete;

  final bool isFavoriteSelected;
  final bool isAddToCartSelected;

  final Function(bool isSelected)? onTapFavorite;
  final Function(bool isSelected)? onTapAddToCart;

  final Product data;

  final HorizontalCardStyle? style;
  final int? counterInitValue;
  const HorizontalCard({
    Key? key,
    this.style = HorizontalCardStyle.show,
    required this.data,
    this.onChangeCounter,
    this.counterInitValue = 0,
    this.onTapDelete,
    this.onTapFavorite,
    this.onTapAddToCart,
    this.isFavoriteSelected = false,
    this.isAddToCartSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 400),
        tween: Tween(begin: .0, end: 1.0),
        curve: Curves.easeInOut,
        builder: (context, value, child) => Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Container(
                  height: 150, // NOTE may cause problem
                  // margin: const EdgeInsets.only(
                  //     right: 15, bottom: 5, top: 5), //Margin to show shadow
                  width: style == HorizontalCardStyle.show
                      ? MediaQuery.of(context).size.width - 50
                      : double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // margin: EdgeInsets.all(7),
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              // widthFactor: 1,
                              aspectRatio: 1,
                              child: Container(
                                  color: Colors.white,
                                  child: Image.network(data.imageUrl)),
                            ),
                          ),
                          style == HorizontalCardStyle.counter
                              ? SizedBox(
                                  height: 40,
                                  child: RoundConter(
                                    initValue: counterInitValue ?? 0,
                                    onChangeCounter:
                                        onChangeCounter ?? (unsed) {},
                                  ))
                              : const SizedBox()
                        ],
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //data title
                          Text(data.title, style: AppConst.productTitleStyle),
                          Row(
                            children: [
                              //data left
                              Text(data.left.toString(),
                                  style: AppConst.productSubtitleStyle),
                              const Text("  |  ",
                                  style: AppConst.productSubtitleStyle),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: AppConst.mainOrange,
                                    size: 20,
                                  ),
                                  //data rate
                                  Text(data.rate.toString(),
                                      style: AppConst.productSubtitleStyle)
                                ],
                              )
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${data.price} ',
                              style: AppConst.productTitleStyle,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '/a piece',
                                  style: AppConst.productSubtitleStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          style == HorizontalCardStyle.show
                              ? HeartButton(
                                  isActive: isFavoriteSelected,
                                  onTap: (isSelected) {
                                    onTapFavorite != null
                                        ? onTapFavorite!(isSelected)
                                        : null;
                                  },
                                )
                              : MyRoundButton(
                                  // isActive: isAddToCartSelected,
                                  onTap: (e) {
                                    onTapDelete != null ? onTapDelete!() : null;
                                  },
                                  type: CutomRoundedButtonType.pusher,
                                  icon: Icons.delete_outline,
                                ),
                          style == HorizontalCardStyle.show
                              ? SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: MyRoundButton(
                                    isActive: isAddToCartSelected,
                                    icon: Icons.shopping_bag_outlined,
                                    iconSize: 20,
                                    onTap: (isSelected) {
                                      onTapAddToCart != null
                                          ? onTapAddToCart!(isSelected)
                                          : null;
                                    },
                                  ))
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}

enum HorizontalCardStyle { counter, show }

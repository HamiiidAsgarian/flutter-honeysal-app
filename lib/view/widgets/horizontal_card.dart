import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/widgets/heart_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../model/core_models/product_model.dart';
import 'my_rounded_button.dart';

class HorizontalCard extends StatefulWidget {
  final Function(int index)? onChangeCounter;
  final Function? onTapDelete;

  final bool isFavoriteSelected;
  final bool isAddToCartSelected;

  final Function(bool isSelected, AnimationController animCnt)? onTapFavorite;
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
  State<HorizontalCard> createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animCntrl;
  late Animation _frameAnimation;
  @override
  void initState() {
    _animCntrl = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _frameAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _animCntrl, curve: Curves.easeInOut));
    _animCntrl.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _frameAnimation,

        // duration: const Duration(milliseconds: 400),
        // tween: Tween(begin: .0, end: 1.0),
        // curve: Curves.easeInOut,
        builder: (context, child) => Transform.scale(
              scale: _frameAnimation.value,
              child: Opacity(
                opacity: _frameAnimation.value,
                child: Container(
                  height: 150, // NOTE may cause problem
                  // margin: const EdgeInsets.only(
                  //     right: 15, bottom: 5, top: 5), //Margin to show shadow
                  width: widget.style == HorizontalCardStyle.show
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
                                  child: CachedNetworkImage(
                                      imageUrl: widget.data.imageUrl)),
                            ),
                          ),
                          widget.style == HorizontalCardStyle.counter
                              ? SizedBox(
                                  height: 40,
                                  child: RoundConter(
                                    initValue: widget.counterInitValue ?? 0,
                                    onChangeCounter:
                                        widget.onChangeCounter ?? (unsed) {},
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
                          Text(widget.data.title,
                              style: AppConst.productTitleStyle),
                          Row(
                            children: [
                              //data left
                              Text("${widget.data.left} Left",
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
                                  Text(widget.data.rate.toString(),
                                      style: AppConst.productSubtitleStyle)
                                ],
                              )
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${widget.data.price} ',
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
                          widget.style == HorizontalCardStyle.show
                              ? HeartButton(
                                  isActive: widget.isFavoriteSelected,
                                  onTap: (isSelected) {
                                    widget.onTapFavorite != null
                                        ? widget.onTapFavorite!(
                                            isSelected, _animCntrl) //NOte

                                        : null;
                                  },
                                )
                              : MyRoundButton(
                                  // isActive: isAddToCartSelected,
                                  onTap: (e) {
                                    widget.onTapDelete != null
                                        ? widget.onTapDelete!()
                                        : null;
                                  },
                                  type: CutomRoundedButtonType.pusher,
                                  icon: Icons.delete_outline,
                                ),
                          widget.style == HorizontalCardStyle.show
                              ? SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: MyRoundButton(
                                    isActive: widget.isAddToCartSelected,
                                    icon: Icons.shopping_bag_outlined,
                                    iconSize: 20,
                                    onTap: (isSelected) {
                                      widget.onTapAddToCart != null
                                          ? widget.onTapAddToCart!(isSelected)
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

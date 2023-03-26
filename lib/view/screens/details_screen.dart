import 'package:bakery/consts.dart';
import 'package:bakery/model/core_models/icon_info_model.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:bakery/view_model/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  static String route = "/DetailsScreen";
  final Product item;
  const DetailsScreen({super.key, required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics:
            const BouncingScrollPhysics(), //This sliver just provides appbar navigation and product image and background
        slivers: [
          ProductDetailAppbarSliver(product: widget.item),
          ProductDetailDataSliver(item: widget.item
              // onChangeCounter: (int index) {
              //   ValueNotifier(index);
              //   print(index);
              //   indexNotifier.value = index;
              //   // setState(() {});
              // },
              )
        ],
      ),
    );
  }
}

class ProductDetailDataSliver extends StatelessWidget {
  final Product item;
  // final Function onPressAddToCart;

  const ProductDetailDataSliver({
    Key? key,
    required this.item,
    // required this.onPressAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedItemsCount = 1;

    return SliverToBoxAdapter(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          color: AppConst.mainWhite,
          child: Column(
            children: [
              DetailsTitle(title: item.title, rate: item.rate),
              const SizedBox(height: 20),
              DetailsInfo(
                  category: item.category, left: item.left, point: item.point),
              const SizedBox(height: 20),
              DetailsCounter(
                price: item.price,
                onChangeCounter: (int index) {
                  selectedItemsCount = index;
                },
              ),
              const SizedBox(height: 20),
              MainButton(onPress: () async {
                for (int i = 0; i < selectedItemsCount; i++) {
                  BlocProvider.of<CartBloc>(context).add(AddToCart(item: item));
                }
                await onpressAddtoCart(context, selectedItemsCount);
              }),
              const SizedBox(height: 20),
              Text(item.description, style: AppConst.normalDescriptionStyle),
              const SizedBox(height: 20),
              CustomExpansionTile(
                  title: 'Ingredients', items: item.ingredients),
              CustomExpansionTile(title: 'Allergens', items: item.ingredients),
            ],
          )),
    );
  }

  onpressAddtoCart(context, int count) {
    showDialog(
      context: context,
      builder: ((dialogContext) => AlertDialog(
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            backgroundColor: AppConst.mainWhite,
            title: Stack(children: [
              const Center(
                  child: Text("Success!", style: AppConst.detailPriceStyle)),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      child: const Icon(Icons.close, size: 25),
                      onTap: () {
                        Navigator.pop(context);
                      }))
            ]),
            content: Text(
              "You successfully added $count item to cart!",
              style: AppConst.normalDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            actions: [
              MainButton(
                  title: "Go to cart",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const CartScreen(backButton: true))));
                    // Navigator.pushReplacementNamed(
                    //     dialogContext, CartScreen.route);
                  }),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Text("Continue Shopping",
                        style: AppConst.normalDescriptionStyle
                            .copyWith(color: AppConst.burnedOrange))),
              )
            ],
          )),
    );
  }
}

class ProductDetailAppbarSliver extends StatelessWidget {
  // final String imageUrl;
  final Product product;
  const ProductDetailAppbarSliver({
    Key? key,
    required this.product,
    // required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double bottomsWithHeight = 75;
    const double bottomsPaddings = 25;

    return SliverAppBar(
      stretch: true,
      // centerTitle: true,
      // title: const Text("Details", style: AppConst.normalDescriptionStyle),
      expandedHeight: 250,
      collapsedHeight: bottomsWithHeight,
      toolbarHeight: bottomsWithHeight,
      // centerTitle: true,
      elevation: 0,
      pinned: true,
      floating: false,
      backgroundColor: AppConst.mainWhite,
      leadingWidth: bottomsWithHeight,
      leading: Container(
        // color: Colors.red,
        padding:
            const EdgeInsets.only(left: bottomsPaddings, top: bottomsPaddings),
        child: FractionallySizedBox(
          alignment: Alignment.centerRight,
          widthFactor: 1,
          child: MyRoundButton(
            type: CutomRoundedButtonType.pusher,
            icon: Icons.arrow_back_ios_outlined,
            fillColor: AppConst.mainWhite,
            onTap: (bool isSelected) {
              Navigator.pop(context);
            },
            isActive: false,
          ),
        ),
      ),

      // title: Text("aaaa"),
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            titlePadding: EdgeInsets.zero,
            background: Image.asset('asset/images/back.png', fit: BoxFit.cover),
            // centerTitle: true,

            title: SafeArea(
              child: Container(
                  // NOTE : fix if the image should resize by howmuch
                  padding: const EdgeInsets.only(top: 25),
                  // color: Colors.red,
                  width: double.infinity,
                  height: 150,
                  // height: 110,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppConst.mainWhite,
                              borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(35),
                                  topStart: Radius.circular(35))),
                          height: 50,
                        )),
                    SizedBox(
                        width: 500,
                        height: 500,
                        child: Image.network(product.imageUrl))
                  ])),
            ),
          ),
          //This is a filler for the gap between slivers that i cant find a solution to fill

          Align(
            alignment: const Alignment(0, 1.01),
            child: Container(
              height: 5,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          width: bottomsWithHeight,
          padding: const EdgeInsets.only(
              right: bottomsPaddings, top: bottomsPaddings),
          // color: Colors.red,
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
            bool isAlreadyInFavorites = false;
            if (state.favoriteData.contains(product)) {
              isAlreadyInFavorites = true;
            }

            return MyRoundButton(
              icon: Icons.favorite_border_outlined,
              fillColor: AppConst.mainWhite,
              selectedColor: AppConst.mainRed,
              onTap: (bool isSelected) {
                if (isAlreadyInFavorites == false) {
                  BlocProvider.of<FavoriteBloc>(context)
                      .add(AddToFavoriteData(item: product));
                } else {
                  BlocProvider.of<FavoriteBloc>(context)
                      .add(RemoveFromFavoriteData(item: product));
                }
              },
              isActive: isAlreadyInFavorites,
            );
          }),
        ),
        // Container(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: const Icon(Icons.ios_share))
      ],
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String? title;
  final List<IconInfo> items;

  const CustomExpansionTile({
    Key? key,
    this.title = "",
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent), //For deleting the divider
      child: ExpansionTile(
        iconColor: AppConst.iconGrey,
        collapsedIconColor: AppConst.iconGrey,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Text("$title", style: AppConst.sectionTitleStyle),
        children: [
          Wrap(
              spacing: 10,
              runSpacing: 10,
              children: items
                  .map((e) =>
                      IngredientBox(title: e.title, imageUrl: e.imageUrl))
                  .toList())
        ],
      ),
    );
  }
}

class IngredientBox extends StatelessWidget {
  final String title;
  final String imageUrl;

  const IngredientBox({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1, color: AppConst.borderGrey),
            color: AppConst.lightOrange),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50, height: 50, child: Image.network(imageUrl)),
            Text(title, style: AppConst.normalDescriptionStyle)
          ],
        ));
  }
}

class DetailsCounter extends StatelessWidget {
  final double price;
  final Function(int index) onChangeCounter;

  const DetailsCounter({
    Key? key,
    required this.price,
    required this.onChangeCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundConter(onChangeCounter: onChangeCounter),
        RichText(
          text: TextSpan(
            text: '\$$price ',
            style: AppConst.detailPriceStyle,
            children: const <TextSpan>[
              TextSpan(
                text: '/a piece',
                style: AppConst.productSubtitleStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoundConter extends StatefulWidget {
  final int initValue;
  final Function(int index) onChangeCounter;
  const RoundConter(
      {Key? key, required this.onChangeCounter, this.initValue = 1})
      : super(key: key);

  @override
  State<RoundConter> createState() => _RoundConterState();
}

class _RoundConterState extends State<RoundConter> {
  late int _counter;

  @override
  void initState() {
    _counter = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 135,
      height: 50,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: AppConst.borderGrey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _counter > 1 ? _counter-- : () {};
              });

              widget.onChangeCounter(_counter);
            },
            child: const Icon(Icons.remove),
          ),
          Text("$_counter", style: AppConst.productTitleStyle),
          GestureDetector(
            onTap: () {
              setState(() {
                _counter > 0 ? _counter++ : () {};
              });
              widget.onChangeCounter(_counter);
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class DetailsTitle extends StatelessWidget {
  final String title;
  final double rate;
  const DetailsTitle({
    Key? key,
    required this.title,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title, style: AppConst.detailTitleStyle),
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 20,
              color: AppConst.mainOrange,
            ),
            Text("$rate", style: AppConst.productSubtitleStyle),
            const Text("(49)", style: AppConst.productSubtitleStyle)
          ],
        )
      ],
    );
  }
}

class DetailsInfo extends StatelessWidget {
  final String category;
  final int left;
  final int point;

  const DetailsInfo({
    Key? key,
    required this.category,
    required this.left,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, //mainly because of [dividers] to appear
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: MyRoundedChip(
                onTap: (e) {},
                child: FittedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.cookie,
                          size: 20,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          category,
                          style: AppConst.productSubtitleStyle,
                        ),
                      ]),
                ),
              ),
            ),
          ),
          const VerticalDivider(
            indent: 5, endIndent: 5,
            color: AppConst.borderGrey, //color of divider
            thickness: 2, //thickness of divier line
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.signal_cellular_alt, color: AppConst.iconGrey),
                const SizedBox(width: 5),
                Text("$left left", style: AppConst.productSubtitleStyle)
              ],
            ),
          ),
          const VerticalDivider(
            indent: 5, endIndent: 5,

            color: AppConst.borderGrey, //color of divider
            thickness: 2, //thickness of divier line
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.badge_outlined, color: AppConst.iconGrey),
                const SizedBox(width: 5),
                Text("$point points", style: AppConst.productSubtitleStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

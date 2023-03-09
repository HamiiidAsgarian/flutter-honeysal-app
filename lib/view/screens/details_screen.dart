import 'package:bakery/consts.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:flutter/material.dart';

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
    // late Product item;
    // if (ModalRoute.of(context) != null) {
    //   item = ModalRoute.of(context)!.settings.arguments as Product;
    // } else {
    //   item = Product.filled();
    // }
    // item = item == null ? Product.filled() : item;
    return Scaffold(
      body: CustomScrollView(
        physics:
            const BouncingScrollPhysics(), //This sliver just provides appbar navigation and product image and background
        slivers: [
          ProductDetailAppbarSliver(imageUrl: widget.item.imageUrl),
          ProductDetailDataSliver(item: widget.item)
        ],
      ),
    );
  }
}

class ProductDetailDataSliver extends StatelessWidget {
  final Product item;
  const ProductDetailDataSliver({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          color: AppConst.mainWhite,
          child: Column(
            children: [
              DetailsTitle(title: item.title, rate: item.rate),
              const SizedBox(height: 20),
              DetailsInfo(category: item.category, left: item.left),
              const SizedBox(height: 20),
              DetailsCounter(price: item.price),
              const SizedBox(height: 20),
              MainButton(onPress: () async {
                await onpressAddtoCart(context);
              }),
              const SizedBox(height: 20),
              Text(item.description, style: AppConst.normalDescriptionStyle),
              const SizedBox(height: 20),
              const CustomExpansionTile(title: 'Ingredients'),
              const CustomExpansionTile(title: 'Allergens'),
            ],
          )),
    );
  }

  onpressAddtoCart(context) {
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
            content: const Text(
              "You successfully added the item to cart!",
              style: AppConst.normalDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            actions: [
              MainButton(
                  title: "Go to cart",
                  onPress: () {
                    Navigator.pushReplacementNamed(
                        dialogContext, CartScreen.route);
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
  final String imageUrl;
  const ProductDetailAppbarSliver({
    Key? key,
    required this.imageUrl,
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
            selectionStatus: false,
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
                        width: 500, height: 500, child: Image.network(imageUrl))
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
          child: MyRoundButton(
            icon: Icons.favorite_border_outlined,
            fillColor: AppConst.mainWhite,
            onTap: (bool isSelected) {},
            selectionStatus: false,
          ),
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
  const CustomExpansionTile({
    Key? key,
    this.title = "",
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
        title: Text(title!, style: AppConst.sectionTitleStyle),
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              IngredientBox(),
              IngredientBox(),
              IngredientBox(),
              IngredientBox(),
              IngredientBox(),
              IngredientBox(),
            ],
          )
        ],
      ),
    );
  }
}

class IngredientBox extends StatelessWidget {
  const IngredientBox({
    Key? key,
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
          children: const [
            Icon(Icons.egg_outlined, size: 50),
            Text("Egg", style: AppConst.normalDescriptionStyle)
          ],
        ));
  }
}

class DetailsCounter extends StatelessWidget {
  final double price;
  const DetailsCounter({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const RoundConter(),
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
  const RoundConter({
    Key? key,
  }) : super(key: key);

  @override
  State<RoundConter> createState() => _RoundConterState();
}

class _RoundConterState extends State<RoundConter> {
  int _counter = 0;
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
                _counter--;
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text("$_counter", style: AppConst.productTitleStyle),
          GestureDetector(
            onTap: () {
              setState(() {
                _counter++;
              });
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
  const DetailsInfo({
    Key? key,
    required this.category,
    required this.left,
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
              children: const [
                Icon(Icons.badge_outlined, color: AppConst.iconGrey),
                SizedBox(width: 5),
                Text("25 left", style: AppConst.productSubtitleStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

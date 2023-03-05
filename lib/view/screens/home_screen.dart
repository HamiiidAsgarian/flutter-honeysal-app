import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/screens/profile_screen.dart';
import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:bakery/view/widgets/title_and_all.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../widgets/vertical_card.dart';
import '../widgets/horizontal_card.dart';
import '../widgets/my_rounded_button.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNav(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Statusbar(),
              FavoritesSection(),
              OrderSection(),
              OrderSection(),
            ],
          ),
        ));
  }
}

class Statusbar extends StatefulWidget {
  const Statusbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Statusbar> createState() => _StatusbarState();
}

class _StatusbarState extends State<Statusbar> {
  bool searchMode = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConst.appHorizontalPadding),
      child: ClipPath(
        clipper: const ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Container(
          decoration: BoxDecoration(
            color: AppConst.borderGrey.withOpacity(.1),
            border: const Border(
                bottom: BorderSide(width: 5, color: AppConst.mainOrange)),
            // color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: titleGenerator(searchMode),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyRoundButton(
                    icon: Icons.search,
                    onTap: (isSelected) {
                      setState(() {
                        searchMode = isSelected;
                      });
                    },
                    selectionStatus: searchMode,
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, ProfileScreen.route),
                    child: const CircleAvatar(
                      backgroundColor: AppConst.mainOrange,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  titleGenerator(bool searchOn) {
    if (searchOn == true) {
      return TweenAnimationBuilder(
          key: UniqueKey(),
          duration: const Duration(milliseconds: 400),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (BuildContext context, double? value, Widget? child) {
            return Opacity(
              opacity: value ?? 0,
              child: const SizedBox(
                width: 50,
                height: 50,
                child: TextField(
                  cursorColor: AppConst.mainOrange,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: "Search products",
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            );
          });
    }

    return TweenAnimationBuilder(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (BuildContext context, double? value, Widget? child) {
        return Opacity(
          opacity: value ?? 0,
          child: const SizedBox(
            width: 50,
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Good morning',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.appHorizontalPadding),
              child: TitleAndAll(
                  title: 'Your favorite product', onPressAll: () {})),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConst.appHorizontalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    //For separating cards and also to display top and bottom shadows
                    return Container(
                        padding:
                            const EdgeInsets.only(right: 10, top: 7, bottom: 7),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, DetailsScreen.route);
                            },
                            child: const HorizontalCard()));
                  })))
        ],
      ),
    );
  }
}

class OrderSection extends StatefulWidget {
  const OrderSection({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  int? _selected;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.appHorizontalPadding),
          child: TitleAndAll(title: "Order", onPressAll: () {})),
      SizedBox(
        height: 40,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConst.appHorizontalPadding),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: MyRoundedChip(
                  onTap: (isSelected) {
                    setState(() {
                      _selected = index;
                    });
                  },
                  selectionStatus: _selected == index ? true : false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.cookie,
                          size: 20,
                        ),
                        SizedBox(width: 7),
                        Text("Cackes", style: AppConst.chipTextStyle),
                      ]),
                ),
              );
            }),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 330,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.appHorizontalPadding),
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 10, top: 7, bottom: 7),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.route);
                },
                child: const VertivalCard()),
          ),
        ),
      )
    ]);
  }
}

import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/model/home_elements_models/promotion_model.dart';
import 'package:bakery/view/screens/all_products_screen.dart';
import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/screens/profile_screen.dart';
import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:bakery/view/widgets/promotion_card.dart';
import 'package:bakery/view/widgets/title_and_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../consts.dart';
import '../../model/home_elements_models/board_model.dart';
import '../../model/home_elements_models/category_model.dart';
import '../../model/home_elements_models/home_model.dart';
import '../../view_model/favorite_bloc.dart';
import '../widgets/vertical_card.dart';
import '../widgets/horizontal_card.dart';
import '../widgets/my_rounded_button.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/home";

  final HomePageElements data;
  final List<Product> favorites;

  const HomeScreen({super.key, required this.data, this.favorites = const []});

  @override
  Widget build(BuildContext context) {
    itemsMaker();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ListView(
        children: [const Statusbar(), ...itemsMaker()],
      ),
    ));
  }

// To make elemnts structure of the screen based on data type and order
  /// there are three main types of homepage elemnts including [Promotion],[BoardList],[CategoryList]
  itemsMaker() {
    List items = [];

    for (var e in data.items) {
      // print(e.imageUrl);
      switch (e.runtimeType) {
        case Promotion:
          {
            items.add(PromotionCard(data: e as Promotion));
          }
          break;
        case BoardList:
          {
            items.add(
              FavoritesSection(data: e as BoardList),
            );
          }
          break;
        case CategoryList:
          {
            items.add(OrderSection(data: e as CategoryList));
          }
          break;
        default:
      }
    }
    if (favorites.isNotEmpty) {
      Widget facoriteBoardList = BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.favoriteData.isNotEmpty) {
            return FavoritesSection(
                data: BoardList(items: state.favoriteData, title: "Favorites"));
          }
          return const SizedBox();
        },
      );
      items.insert(1, facoriteBoardList);
    }

    return items;
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
  final BoardList data;
  const FavoritesSection({
    Key? key,
    required this.data,
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
                  title: data.title,
                  onPressAll: () {
                    Navigator.pushNamed(context, AllProductsScreen.route,
                        arguments: data.items);
                  })),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConst.appHorizontalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.items.length,
                  itemBuilder: ((context, index) {
                    //For separating cards and also to display top and bottom shadows
                    return Container(
                        padding:
                            const EdgeInsets.only(right: 10, top: 7, bottom: 7),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          item: data.items[index])));
                              // Navigator.pushNamed(context, DetailsScreen.route,
                              //     arguments: data.items[index]);
                            },
                            child: HorizontalCard(data: data.items[index])));
                  })))
        ],
      ),
    );
  }
}

class OrderSection extends StatefulWidget {
  final CategoryList data;
  const OrderSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.appHorizontalPadding),
          child: TitleAndAll(
              title: widget.data.title,
              onPressAll: () {
                Navigator.pushNamed(context, AllProductsScreen.route,
                    arguments: widget.data.categories[_selected].items);
              })),
      SizedBox(
        height: 40,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConst.appHorizontalPadding),
            itemCount: widget.data.categories.length,
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
                      children: [
                        SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.network(
                                widget.data.categories[index].iconUrl)),
                        const SizedBox(width: 7),
                        Text(widget.data.categories[index].title,
                            style: AppConst.chipTextStyle),
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
          itemCount: widget.data.categories[_selected].items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 10, top: 7, bottom: 7),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              item: widget
                                  .data.categories[_selected].items[index])));
                  // Navigator.pushNamed(context, DetailsScreen.route,
                  //     arguments:
                  //         widget.data.categories[_selected].items[index]);
                },
                child: VertivalCard(
                    data: widget.data.categories[_selected].items[index])),
          ),
        ),
      )
    ]);
  }
}

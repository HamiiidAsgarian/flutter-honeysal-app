import 'package:bakery/core/utilities.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/model/core_models/user_model.dart';
import 'package:bakery/model/home_elements_models/promotion_model.dart';
import 'package:bakery/view/screens/all_products_screen.dart';
import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/screens/profile_screen.dart';
import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:bakery/view/widgets/promotion_card.dart';
import 'package:bakery/view/widgets/title_and_all.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../consts.dart';
import '../../model/home_elements_models/carousel_model.dart';
import '../../model/home_elements_models/category_model.dart';
import '../../view_model/all_products_bloc.dart';
import '../../view_model/favorite_bloc.dart';
import '../widgets/vertical_card.dart';
import '../widgets/horizontal_card.dart';
import '../widgets/my_rounded_button.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/home";

  // final HomePageElements data;
  // final List<Product> favorites;

  const HomeScreen({
    super.key,
    // required this.data,
    //  this.favorites = const []
  });

  @override
  Widget build(BuildContext context) {
    // itemsMaker();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          return ListView(
            children: [
              Statusbar(
                  allProducts: state.allProducts, userData: state.userData!),
              ...itemsMaker(state.homePageElementsData.items)
            ],
          );
        },
      ),
    ));
  }

// To make elemnts structure of the screen based on data type and order
  /// there are three main types of homepage elemnts including [Promotion],[CarouselList],[CategoryList]
  itemsMaker(List<dynamic> data) {
    List items = [];

    for (var e in data) {
      // print(e.imageUrl);
      switch (e.runtimeType) {
        case Promotion:
          {
            items.add(PromotionCard(data: e as Promotion));
          }
          break;
        case CarouselList:
          {
            items.add(
              CarouselSection(data: e as CarouselList),
            );
          }
          break;
        case CategoryList:
          {
            items.add(CategoryListSection(data: e as CategoryList));
          }
          break;
        default:
      }
    }
    // if (favorites.isNotEmpty) {
    Widget facoriteBoardList = BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state.favoriteData.isNotEmpty) {
          return CarouselSection(
              data:
                  CarouselList(items: state.favoriteData, title: "Favorites"));
        }
        return const SizedBox();
      },
    );
    items.insert(1, facoriteBoardList);
    // }

    return items;
  }
}

class Statusbar extends StatelessWidget {
  final List<Product> allProducts;
  final User userData;
  const Statusbar({
    Key? key,
    required this.allProducts,
    required this.userData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ValueNotifier searchMode = ValueNotifier(false);
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
          child: ValueListenableBuilder(
            valueListenable: searchMode,
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: searchMode,
                    builder: (context, value, child) => AnimatedSwitcher(
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: titleGenerator(value)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRoundButton(
                      isActive: value,
                      icon: Icons.search,
                      onTap: (_) {
                        searchMode.value = !searchMode.value;
                      },
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfileScreen(
                                  data: userData, backButton: true)))),
                      child: CircleAvatar(
                          backgroundColor: AppConst.mainOrange,
                          backgroundImage:
                              NetworkImage(userData.imageUrl ?? "")),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//-------------

  Widget titleGenerator(bool searchOn) {
    if (searchOn == true) {
      return Container(
        key: Key("search"),
        // color: Colors.green,
        // width: 50,
        height: 50,
        child: Autocomplete<Product>(
          optionsBuilder: ((textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return List.empty(growable: false);
            } else {
              return allProducts.where((e) => e.title
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
            }
          }),
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) =>
                  TextField(
            autofocus: true,
            controller: textEditingController,
            focusNode: focusNode,
            onEditingComplete: onFieldSubmitted,
            cursorColor: AppConst.mainOrange,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
                hintText: "Search products",
                focusedBorder: InputBorder.none,
                border: InputBorder.none),
          ),
          optionsViewBuilder: (context, onSelected, options) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 500),
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: SingleChildScrollView(
                  child: Material(
                    child: Column(
                      children: List.generate(
                          options.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => DetailsScreen(
                                              item:
                                                  options.elementAt(index)))));
                                },
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    // height: 50,
                                    color: index.isEven
                                        ? AppConst.lightOrange
                                        : AppConst.whiteOrange,
                                    child: Text(options.elementAt(index).title,
                                        style:
                                            AppConst.normalDescriptionStyle)),
                              )),
                    ),
                  ),
                ),
              ),
            );
          },
          displayStringForOption: (option) {
            return option.title;
          },
        ),
        // child: ,
      );
    }

    return Container(
      // color: Colors.red,
      key: Key("goodMorning"),
      // width: 50,
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Good morning',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class CarouselSection extends StatelessWidget {
  final CarouselList data;
  const CarouselSection({
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              AllProductsScreen(items: data.items)),
                        ));
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
                        child: GestureDetector(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(item: data.items[index])));
                          // Navigator.pushNamed(context, DetailsScreen.route,
                          //     arguments: data.items[index]);
                        }, child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, favoriteState) {
                            return BlocBuilder<CartBloc, CartState>(
                              builder: (context, cartState) {
                                return TweenAnimationBuilder(
                                  tween: Tween<double>(begin: .0, end: 1.0),
                                  curve: Curves.easeOut,
                                  duration: Duration(milliseconds: 1200),
                                  builder: (BuildContext context, double value,
                                      Widget? child) {
                                    return Opacity(
                                      opacity: value,
                                      child: HorizontalCard(
                                          data: data.items[index],
                                          onTapFavorite: (isSelected) {
                                            FavoriteBloc favoriteStateTemp =
                                                BlocProvider.of<FavoriteBloc>(
                                                    context);

                                            isSelected == true
                                                ? favoriteStateTemp.add(
                                                    AddToFavoriteData(
                                                        item:
                                                            data.items[index]))
                                                : favoriteStateTemp.add(
                                                    RemoveFromFavoriteData(
                                                        item:
                                                            data.items[index]));
                                          },
                                          isFavoriteSelected: favoriteState
                                                      .favoriteData
                                                      .firstWhereOrNull((e) =>
                                                          e ==
                                                          data.items[index]) ==
                                                  null
                                              ? false
                                              : true,
                                          isAddToCartSelected: cartState
                                                      .cartSetData
                                                      .firstWhereOrNull((e) =>
                                                          e.product ==
                                                          data.items[index]) ==
                                                  null
                                              ? false
                                              : true,
                                          onTapAddToCart: ((isSelected) {
                                            CartBloc cartStateTemp =
                                                BlocProvider.of<CartBloc>(
                                                    context);

                                            isSelected == true
                                                ? cartStateTemp.add(AddToCart(
                                                    item: data.items[index]))
                                                : cartStateTemp.add(
                                                    RemoveAllofAnItemFromCart(
                                                        item:
                                                            data.items[index]));
                                          })),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        )));
                  })))
        ],
      ),
    );
  }
}

class CategoryListSection extends StatefulWidget {
  final CategoryList data;
  const CategoryListSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CategoryListSection> createState() => _CategoryListSectionState();
}

class _CategoryListSectionState extends State<CategoryListSection> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => AllProductsScreen(
                        items: widget.data.categories[_selected].items)),
                  ),
                );
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
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConst.appHorizontalPadding),
                itemCount: widget.data.categories[_selected].items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product currentProduct =
                      widget.data.categories[_selected].items[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 7, bottom: 7),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(item: currentProduct)));
                        },
                        child: VerticalCard(
                            data: currentProduct,
                            isFavoriteSelected: state.favoriteData
                                        .firstWhereOrNull(
                                            (e) => e == currentProduct) ==
                                    null
                                ? false
                                : true,
                            onTapFavorite: (isSelected) {
                              FavoriteBloc favoriteStateTemp =
                                  BlocProvider.of<FavoriteBloc>(context);

                              isSelected == true
                                  ? favoriteStateTemp.add(
                                      AddToFavoriteData(item: currentProduct))
                                  : favoriteStateTemp.add(
                                      RemoveFromFavoriteData(
                                          item: currentProduct));
                            },
                            onTapButton: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(AddToCart(item: currentProduct));
                            })),
                  );
                });
          },
        ),
      )
    ]);
  }
}

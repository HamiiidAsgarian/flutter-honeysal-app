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
import 'package:cached_network_image/cached_network_image.dart';
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

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            List<Widget> items = itemsMaker(state.homePageElementsData.items);
            double animationBeginValue =
                state.isFirstTime ? MediaQuery.of(context).size.width : 0;

            return Column(
              children: [
                Statusbar(
                    allProducts: state.allProducts, userData: state.userData!),
                Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: animationBeginValue, end: 0.0),
                          duration: AppConst.cartsAppearDurationMaker(index),
                          builder: ((context, value, child) =>
                              Transform.translate(
                                  offset: Offset(value, 0),
                                  child: items[index])))),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }

// To make elemnts structure of the screen based on data type and order
  /// there are three main types of homepage elemnts including [Promotion],[CarouselList],[CategoryList]
  List<Widget> itemsMaker(List<dynamic> data) {
    List<Widget> items = [];

    for (dynamic e in data) {
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
    Widget favoriteBoardList = BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return state.favoriteData.isNotEmpty
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutBack, //NOTE
                height: 220,
                child: SingleChildScrollView(
                  child: CarouselSection(
                      data: CarouselList(
                          items: state.favoriteData, title: "Favorites")),
                ),
              )
            : AnimatedContainer(
                curve: Curves.easeInBack, //NOTE

                duration: const Duration(milliseconds: 500),
                height: 0,
              );
      },
    );
    items.insert(1, favoriteBoardList);
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
                        transitionBuilder: (child, animation) => FadeTransition(
                              opacity: animation,
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
    FocusNode searchFocusNode = FocusNode();
    if (searchOn == true) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        key: const Key("search"),

        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [AppConst.lightOrange, Colors.white])),
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
              (context, textEditingController, focusNode, onFieldSubmitted) {
            searchFocusNode = focusNode;
            return TextField(
              autofocus: true,
              controller: textEditingController,
              focusNode: focusNode,
              onEditingComplete: onFieldSubmitted,
              cursorColor: AppConst.mainOrange,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: AppConst.mainWhite),
                  hintText: "Search products",
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 500),
              child: Container(
                padding: const EdgeInsets.only(right: 60),
                child: SingleChildScrollView(
                  child: Material(
                    elevation: 0,
                    color: Colors.white.withOpacity(0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: AppConst.mainOrange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        children: List.generate(
                            options.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    searchFocusNode.unfocus();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                DetailsScreen(
                                                    item: options
                                                        .elementAt(index)))));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? AppConst.whiteOrange
                                              : AppConst.lightOrange,
                                          borderRadius:
                                              BorderRadius.circular(7.5)),
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      // height: 50,

                                      child: Center(
                                        child: Text(
                                            options.elementAt(index).title,
                                            style: AppConst
                                                .normalDescriptionStyle),
                                      )),
                                )),
                      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.white])),
      key: const Key("goodMorning"),
      // width: 50,
      height: 50,
      child: const Align(
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
  final double height;

  const CarouselSection({
    Key? key,
    required this.data,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
                          builder: ((context) => AllProductsScreen(
                              items: data.items, header: data.title)),
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
                        // color: Colors.blue,
                        padding:
                            const EdgeInsets.only(right: 10, top: 7, bottom: 7),
                        child: GestureDetector(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(item: data.items[index])));
                        }, child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, favoriteState) {
                            return BlocBuilder<CartBloc, CartState>(
                              builder: (context, cartState) {
                                return HorizontalCard(
                                  key: Key(data.items[index].title),
                                  data: data.items[index],
                                  onTapFavorite:
                                      (isSelected, AnimationController anim) {
                                    Product currentProduct = data.items[index];

                                    FavoriteBloc favoriteStateTemp =
                                        BlocProvider.of<FavoriteBloc>(context);

                                    if (isSelected == true) {
                                      favoriteStateTemp.add(AddToFavoriteData(
                                          item: data.items[index]));

                                      showSnackBar(
                                          context,
                                          "${currentProduct.title} has been added to the favorites list",
                                          SnackbarType.add);
                                    } else {
                                      if (data.title == "Favorites") {
                                        //NOTE this must be an enum
                                        anim.reverse().then((value) {
                                          favoriteStateTemp.add(
                                              RemoveFromFavoriteData(
                                                  item: data.items[index]));
                                          showSnackBar(
                                              context,
                                              "${currentProduct.title} has been removed from the favorites list",
                                              SnackbarType.delete);
                                        });
                                      } else {
                                        favoriteStateTemp.add(
                                            RemoveFromFavoriteData(
                                                item: data.items[index]));
                                        showSnackBar(
                                            context,
                                            "${currentProduct.title} has been removed from the favorites list",
                                            SnackbarType.delete);
                                      }
                                    }
                                  },
                                  onTapAddToCart: ((isSelected) {
                                    Product currentProduct = data.items[index];

                                    CartBloc cartStateTemp =
                                        BlocProvider.of<CartBloc>(context);

                                    if (isSelected == true) {
                                      showSnackBar(
                                          context,
                                          "${currentProduct.title} has been added to the cart",
                                          SnackbarType.add);

                                      cartStateTemp.add(
                                          AddToCart(item: data.items[index]));
                                    } else {
                                      showSnackBar(
                                          context,
                                          "${currentProduct.title} has been deleted from the cart",
                                          SnackbarType.delete);

                                      cartStateTemp.add(
                                          RemoveAllofAnItemFromCart(
                                              item: data.items[index]));
                                    }
                                  }),
                                  isFavoriteSelected: favoriteState.favoriteData
                                              .firstWhereOrNull((e) =>
                                                  e == data.items[index]) ==
                                          null
                                      ? false
                                      : true,
                                  isAddToCartSelected: cartState.cartSetData
                                              .firstWhereOrNull((e) =>
                                                  e.product ==
                                                  data.items[index]) ==
                                          null
                                      ? false
                                      : true,
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
                        header: widget.data.categories[_selected].title,
                        items: widget.data.categories[_selected].items)),
                  ),
                );
              })),
      const SizedBox(height: 10),
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
                            child: CachedNetworkImage(
                                imageUrl:
                                    widget.data.categories[index].iconUrl)),
                        const SizedBox(width: 7),
                        Text(widget.data.categories[index].title,
                            style: AppConst.chipTextStyle),
                      ]),
                ),
              );
            }),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 330,
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return TweenAnimationBuilder(
                key: Key(widget.data.categories[_selected].title),
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 100.0, end: 0.0),
                builder: (context, value, child) {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConst.appHorizontalPadding),
                      itemCount: widget.data.categories[_selected].items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Product currentProduct =
                            widget.data.categories[_selected].items[index];
                        return Transform.translate(
                          offset: Offset(value * index, 0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 7, bottom: 7),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                              item: currentProduct)));
                                },
                                child: VerticalCard(
                                    data: currentProduct,
                                    isFavoriteSelected: state.favoriteData
                                                .firstWhereOrNull((e) =>
                                                    e == currentProduct) ==
                                            null
                                        ? false
                                        : true,
                                    onTapFavorite: (isSelected) {
                                      FavoriteBloc favoriteStateTemp =
                                          BlocProvider.of<FavoriteBloc>(
                                              context);

                                      if (isSelected == true) {
                                        showSnackBar(
                                            context,
                                            "${currentProduct.title} has been added to the cart",
                                            SnackbarType.add);
                                        favoriteStateTemp.add(AddToFavoriteData(
                                            item: currentProduct));
                                      } else {
                                        showSnackBar(
                                            context,
                                            "${currentProduct.title} has been removed from the cart",
                                            SnackbarType.delete);
                                        favoriteStateTemp.add(
                                            RemoveFromFavoriteData(
                                                item: currentProduct));
                                      }
                                    },
                                    onTapButton: () {
                                      showSnackBar(
                                          context,
                                          "${currentProduct.title} has been added to the cart",
                                          SnackbarType.add);
                                      BlocProvider.of<CartBloc>(context)
                                          .add(AddToCart(item: currentProduct));
                                    })),
                          ),
                        );
                      });
                });
          },
        ),
      )
    ]);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/core_models/product_model.dart';
import '../../view_model/cart_bloc.dart';
import '../../view_model/favorite_bloc.dart';

class AllProductsScreen extends StatelessWidget {
  // static String route = '/AllProducts';
  final List<Product> items;
  const AllProductsScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // final List<Product> items =
    //     ModalRoute.of(context)!.settings.arguments as List<Product>;
    return Scaffold(
        appBar: const CustomAppbar(
          title: "All Procusts",
          backButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(children: [
            Row(children: const []),
            Expanded(child: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return GridView.builder(
                    itemCount: items.length,
                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            // mainAxisSpacing: 10,
                            // crossAxisSpacing: 10,
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 1 / 2),
                    // crossAxisCount: 2,

                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreen(item: items[index])));
                              },
                              child: VerticalCard(
                                onTapFavorite: (isSelected) {
                                  FavoriteBloc favoriteStateTemp =
                                      BlocProvider.of<FavoriteBloc>(context);
                                  isSelected == true
                                      ? favoriteStateTemp.add(
                                          AddToFavoriteData(item: items[index]))
                                      : favoriteStateTemp.add(
                                          RemoveFromFavoriteData(
                                              item: items[index]));
                                },
                                isFavoriteSelected: state.favoriteData
                                            .firstWhereOrNull(
                                                (e) => e == items[index]) ==
                                        null
                                    ? false
                                    : true,
                                data: items[index],
                                onTapButton: () {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(AddToCart(item: items[index]));
                                },
                              )));
                    });
              },
            ))
          ]),
        ));
  }
}

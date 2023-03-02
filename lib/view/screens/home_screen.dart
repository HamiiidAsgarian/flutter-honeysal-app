import 'package:bakery/view/widgets/my_rounded_chip.dart';
import 'package:bakery/view/widgets/title_and_all.dart';
import 'package:flutter/material.dart';

import '../widgets/category_card.dart';
import '../widgets/favorite_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/statusbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNav(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Statusbar(),
              SizedBox(height: 25),
              FavoritesSection(),
              OrderSection(),
              OrderSection(),
            ],
          ),
        ));
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
      TitleAndAll(title: "Order", onPressAll: () {}),
      SizedBox(
        height: 30,
        child: ListView.builder(
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
                      children: [
                        const Icon(
                          Icons.cookie,
                          size: 10,
                        ),
                        const SizedBox(width: 7),
                        Text("${index * 77}"),
                      ]),
                ),
              );
            }),
      ),
      const SizedBox(height: 15),
      SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CategoryCard()))
    ]);
  }
}

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          TitleAndAll(title: ' Your favorite product', onPressAll: () {}),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return const FavoriteCard();
                  })))
        ],
      ),
    );
  }
}

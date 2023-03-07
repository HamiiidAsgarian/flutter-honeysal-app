import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  static String route = '/AllProducts';
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: "All Procusts",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(children: [
            Row(children: const []),
            Expanded(
                child: GridView.builder(
                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            // mainAxisSpacing: 10,
                            // crossAxisSpacing: 10,
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 1 / 2),
                    // crossAxisCount: 2,

                    itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, DetailsScreen.route);
                            },
                            child: const VertivalCard()))))
          ]),
        ));
  }
}

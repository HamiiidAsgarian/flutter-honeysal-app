import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:bakery/view/widgets/horizontal_card.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utilities.dart';
import '../../model/core_models/product_model.dart';

class CartScreen extends StatelessWidget {
  static String route = "/CartScreen";

  // final List<Product> data;
  final bool backButton;

  const CartScreen(
      {super.key,
      //  this.data = const [],
      this.backButton = false});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CartBloc>(context).add(CartItemsToCartSet());
    return Scaffold(
        appBar: CustomAppbar(
          backButton: backButton,
          title: "Cart",
        ),
        body: Column(
          children: [
            // const SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  // print("//// ${state.cartSetData.length}");
                  return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 15),
                      itemCount: state.cartSetData.isNotEmpty
                          ? state.cartSetData.length
                          : 1, //is there is no item then show the one text that says Cart is emoty...
                      itemBuilder: (context, index) {
                        if (state.cartSetData.isEmpty) {
                          return const Center(child: Text("Cart is empty..."));
                        } else {
                          double animationBeginValue =
                              MediaQuery.of(context).size.width;
                          return TweenAnimationBuilder(
                            duration: AppConst.cartsAppearDurationMaker(index),
                            tween: Tween(begin: animationBeginValue, end: 0.0),
                            builder: (context, value, child) =>
                                Transform.translate(
                              offset: Offset(value, 0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 20,
                                    right: AppConst.appHorizontalPadding,
                                    left: AppConst.appHorizontalPadding),
                                child: HorizontalCard(
                                    style: HorizontalCardStyle.counter,
                                    counterInitValue:
                                        state.cartSetData[index].count,
                                    data: state.cartSetData[index].product,
                                    onTapDelete: () {
                                      Product currentProduct =
                                          state.cartSetData[index].product;
                                      showSnackBar(
                                          context,
                                          "${currentProduct.title} has been deleted from the cart",
                                          SnackbarType.delete);

                                      BlocProvider.of<CartBloc>(context,
                                              listen: false)
                                          .add(RemoveAllofAnItemFromCart(
                                              item: currentProduct));
                                    },
                                    onChangeCounter: (int count) {
                                      List<Product> cartList =
                                          BlocProvider.of<CartBloc>(context,
                                                  listen: false)
                                              .state
                                              .cartData
                                              .where((element) =>
                                                  element.title ==
                                                  state.cartSetData[index]
                                                      .product.title)
                                              .toList();
                                      //if [counter] increase then item will be added to the bloc
                                      Product currentProduct =
                                          state.cartSetData[index].product;
                                      if (count > cartList.length) {
                                        showSnackBar(
                                            context,
                                            "${currentProduct.title} has been added to the cart",
                                            SnackbarType.add);

                                        BlocProvider.of<CartBloc>(context,
                                                listen: false)
                                            .add(AddToCart(
                                                item: currentProduct));
                                      } else if (cartList.length > 1 &&
                                          count < cartList.length) {
                                        showSnackBar(
                                            context,
                                            "${currentProduct.title} has been deleted from the cart",
                                            SnackbarType.delete);

                                        BlocProvider.of<CartBloc>(context,
                                                listen: false)
                                            .add(RemoveFromCart(
                                                item: currentProduct));
                                      }
                                    }),
                              ),
                            ),
                          );
                        }
                      });
                },
              ),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: AppConst.borderGrey))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConst.appHorizontalPadding,
                        vertical: 20),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        List<String> costsColculation =
                            costColculation(state.cartData);

                        return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RecieptRow(
                                title: "Subtotal",
                                price: "\$${costsColculation[0]}",
                              ),
                              RecieptRow(
                                title: "Discount",
                                price: "\$${costsColculation[1]}",
                              ),
                              RecieptRow(
                                title: "Total",
                                price: "\$${costsColculation[2]}",
                                style: RecieptRowStyle.bold,
                              ),
                              MainButton(
                                  onPress: () {
                                    // Navigator.pushNamed(
                                    //     context, CheckoutScreen.route);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                CheckoutScreen(
                                                  costs: costsColculation,
                                                  backButton: true,
                                                  order: state.cartData,
                                                ))));
                                  },
                                  title: "Checkout")
                            ]);
                      },
                    )))
          ],
        ));
  }

  List<String> costColculation(List<Product> products) {
    double discountPercentage = 0.01;
    double subTotal = 0;
    double discount = 0;
    double total = 0;

    for (Product element in products) {
      subTotal += element.price;
    }

    discount = (subTotal * discountPercentage);
    total = subTotal - discount;
    return [
      subTotal.toStringAsFixed(2),
      discount.toStringAsFixed(2),
      total.toStringAsFixed(2)
    ];
  }
}

class RecieptRow extends StatelessWidget {
  final String? title;
  final String? price;
  final RecieptRowStyle? style;

  const RecieptRow({
    Key? key,
    this.title,
    this.price,
    this.style = RecieptRowStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title ?? "",
          style: style == RecieptRowStyle.normal
              ? AppConst.normalDescriptionStyle
              : AppConst.detailPriceStyle),
      Text(price ?? "",
          style: style == RecieptRowStyle.normal
              ? AppConst.normalDescriptionStyle
              : AppConst.detailPriceStyle),
    ]);
  }
}

enum RecieptRowStyle { normal, bold }

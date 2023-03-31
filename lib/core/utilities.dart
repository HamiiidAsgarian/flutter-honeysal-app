import 'package:bakery/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/cart_screen_models/cart_item_model.dart';
import '../model/core_models/product_model.dart';

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

//-----------------------------------------------
List<CountedProductItem> productsListToCartItemSet(List<Product> products) {
  List<CountedProductItem> res = [];
  Set<Product> productsSet = products.toSet();

  for (var element in productsSet) {
    List repeateds = products.where((e) => e == element).toList();
    res.add(CountedProductItem(count: repeateds.length, product: element));
  }
  // print("++$res");

  return res;
}
//----

showLoadingDialogPanel(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.white,
              ),
              width: 140,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Stack(children: [
                      Center(child: Image.asset('asset/images/logo.png')),
                      const Center(child: CupertinoActivityIndicator())
                    ]),
                  )
                ],
              ),
            ),
          ));
}

showSnackBar(BuildContext context, String message, SnackbarType type) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: () {
        switch (type) {
          case SnackbarType.add:
            return Colors.greenAccent;
          case SnackbarType.delete:
            return Colors.redAccent;
          default:
            return Colors.black;
        }
      }(),
      content: Text(message,
          style:
              AppConst.normalDescriptionStyle.copyWith(color: Colors.white))));
}

enum SnackbarType { add, delete }

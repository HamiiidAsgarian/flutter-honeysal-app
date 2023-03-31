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

showLoadingDialogPanel(BuildContext context) {
  AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white.withAlpha(0),
      content: SizedBox(
        width: 150,
        height: 150,
        child: Stack(children: [
          Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Image.asset('asset/images/logo.png'))),
          const Center(child: CupertinoActivityIndicator())
        ]),
      ));
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
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

import 'package:bakery/model/cart_screen_models/cart_item_model.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Cart items generator", () {
    List<Product> testRawProductsList = List.generate(
      5,
      (index) => Product(
          id: index,
          title: "title $index",
          price: 1,
          category: "category",
          imageUrl: "imageUrl",
          description: "description",
          rate: 4,
          left: 4,
          point: 4,
          ingredients: [],
          allergens: []),
    );
    List<CartItem> modeledCartItems =
        cartItemsmaker(cartItems: testRawProductsList);

    expect(modeledCartItems.runtimeType, List<CartItem>);
    expect(modeledCartItems.length, testRawProductsList.length);
  });
}

List<CartItem> cartItemsmaker(
    {BuildContext? context, required List<Product> cartItems}) {
  Map<dynamic, int> temp = {};
  List products = [];

  // List<Product> cartItems = BlocProvider.of<CartBloc>(context).state.cartData;
  List<CartItem> res = [];

  for (var element in cartItems) {
    if (temp.containsKey("${element.id}${element.title}")) {
      temp["${element.id}${element.title}"] =
          temp["${element.id}${element.title}"]! + 1;
    } else {
      products.add(element);
      temp["${element.id}${element.title}"] = 1;
    }
  }

  for (int i = 0; i < products.length; i++) {
    res.add(CartItem(count: temp.values.toList()[i], product: products[i]));
  }

  return res;
}

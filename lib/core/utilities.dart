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

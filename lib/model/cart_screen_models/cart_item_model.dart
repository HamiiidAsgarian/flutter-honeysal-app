import 'package:bakery/model/core_models/product_model.dart';

class CartItem {
  Product product;
  int count;
  CartItem({required this.product, required this.count});
}

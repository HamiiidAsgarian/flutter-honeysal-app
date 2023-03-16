// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bakery/model/home_elements_models/home_model.dart';
import 'package:bakery/view_model/first_screen_bloc.dart';

import 'core_models/order_model.dart';
import 'core_models/product_model.dart';
import 'core_models/user_model.dart';

class AppData {
  User user;
  List<Product> cart;
  List<Product> favorites;
  List<Order> orders;
  HomePageElements homePageElements;
  List<Product> allProducts;

  AppData(
      {required this.user,
      required this.cart,
      required this.favorites,
      required this.orders,
      required this.homePageElements,
      required this.allProducts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'cart': cart.map((x) => x.toMap()).toList(),
      'favorites': favorites.map((x) => x.toMap()).toList(),
      'orders': orders.map((x) => x.toMap()).toList(),
      'homePageElements': homePageElements.toMap(),
      'allProducts': allProducts.map((x) => x.toMap()).toList(),
    };
  }

  factory AppData.fromMap(Map<String, dynamic> map) {
    return AppData(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      cart: List<Product>.from(
        (map['cart'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      favorites: List<Product>.from(
        (map['favorites'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      orders: List<Order>.from(
        (map['orders'] as List<Map<String, dynamic>>).map<Order>(
          (x) => Order.fromMap(x),
        ),
      ),
      homePageElements: HomePageElements.fromMap(
          map['homePageElements'] as List<Map<String, dynamic>>),
      allProducts: List<Product>.from(
        (map['allProducts'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppData.fromJson(String source) =>
      AppData.fromMap(json.decode(source) as Map<String, dynamic>);
}

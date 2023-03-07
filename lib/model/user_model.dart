// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'order_model.dart';
import 'product_model.dart';

class User {
  String id;
  String username;
  String email;
  String phone;
  String? imageUrl;
  List<Order>? orders;
  List<Product>? favorites;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    this.imageUrl,
    this.orders,
    this.favorites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'orders': orders != null ? orders!.map((x) => x.toMap()).toList() : [],
      'favorites':
          favorites != null ? favorites!.map((x) => x.toMap()).toList() : [],
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      orders: map['orders'] != null
          ? List<Order>.from(
              (map['orders'] as List<int>).map<Order?>(
                (x) => Order.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      favorites: map['favorites'] != null
          ? List<Product>.from(
              (map['favorites'] as List<int>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bakery/model/product_model.dart';

class Order {
  List<Product> products;
  DateTime date;
  String stage;
  Order({
    required this.products,
    required this.date,
    required this.stage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'date': date.millisecondsSinceEpoch,
      'stage': stage,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      stage: map['stage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product_model.dart';

class Order {
  int id;
  List<Product> products;
  String date;
  String time;

  String stage;
  double totalCost;
  Order({
    required this.id,
    required this.products,
    required this.date,
    required this.time,
    required this.stage,
    required this.totalCost,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'products': products.map((x) => x.toMap()).toList(),
  //     'date': date,
  //     'time': time,
  //     'stage': stage,
  //     'totalCost': totalCost,
  //   };
  // }

  // factory Order.fromMap(Map<String, dynamic> map) {
  //   return Order(
  //     id: map['id'] as int,
  //     totalCost: map['totalCost'] as double,
  //     products: List<Product>.from(
  //       (map['items'] as List<Map<String, dynamic>>).map<Product>(
  //         (x) => Product.fromMap(x),
  //       ),
  //     ),
  //     date: map['date'] as String,
  //     time: map['time'] as String,
  //     stage: map['stage'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Order.fromJson(String source) =>
  //     Order.fromMap(json.decode(source) as Map<String, dynamic>);

  // Order copyWith({
  //   int? id,
  //   List<Product>? products,
  //   String? date,
  //   String? time,
  //   String? stage,
  //   double? totalCost,
  // }) {
  //   return Order(
  //     id: id ?? this.id,
  //     products: products ?? this.products,
  //     date: date ?? this.date,
  //     time: time ?? this.time,
  //     stage: stage ?? this.stage,
  //     totalCost: totalCost ?? this.totalCost,
  //   );
  // }

  // @override
  // String toString() {
  //   return 'Order(id: $id, products: $products, date: $date, stage: $stage, totalCost: $totalCost)';
  // }

  // @override
  // bool operator ==(covariant Order other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       listEquals(other.products, products) &&
  //       other.date == date &&
  //       other.stage == stage &&
  //       other.totalCost == totalCost;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       products.hashCode ^
  //       date.hashCode ^
  //       stage.hashCode ^
  //       totalCost.hashCode;
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'date': date,
      'time': time,
      'stage': stage,
      'totalCost': totalCost,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      products: List<Product>.from(
        (map['products'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      date: map['date'] as String,
      time: map['time'] as String,
      stage: map['stage'] as String,
      totalCost: map['totalCost'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}

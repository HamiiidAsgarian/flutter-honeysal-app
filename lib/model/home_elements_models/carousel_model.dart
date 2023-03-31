import 'dart:convert';

import '../core_models/product_model.dart';

class CarouselList {
  String title;
  List<Product> items;
  CarouselList({
    required this.title,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CarouselList.fromMap(Map<String, dynamic> map) {
    return CarouselList(
      title: map['title'] as String,
      items: List<Product>.from(
        (map['items'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselList.fromJson(String source) =>
      CarouselList.fromMap(json.decode(source) as Map<String, dynamic>);
}

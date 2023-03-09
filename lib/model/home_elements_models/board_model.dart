import 'dart:convert';

import '../core_models/product_model.dart';

class BoardList {
  String title;
  List<Product> items;
  BoardList({
    required this.title,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory BoardList.fromMap(Map<String, dynamic> map) {
    return BoardList(
      title: map['title'] as String,
      items: List<Product>.from(
        (map['items'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardList.fromJson(String source) =>
      BoardList.fromMap(json.decode(source) as Map<String, dynamic>);
}

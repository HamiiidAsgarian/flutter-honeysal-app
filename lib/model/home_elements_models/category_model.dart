import 'dart:convert';

import '../core_models/product_model.dart';

class CategoryList {
  String title;
  List<Category> categories;
  // List<Product> items;
  CategoryList({
    required this.title,
    required this.categories,
    // required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categories': categories.map((x) => x.toMap()).toList(),
      // 'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      title: map['title'] as String,
      categories: List<Category>.from(
        (map['categories'] as List<Map<String, dynamic>>).map<Category>(
          (x) => Category.fromMap(x),
        ),
      ),
      // items: List<Product>.from(
      //   (map['items'] as List<int>).map<Product>(
      //     (x) => Product.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryList.fromJson(String source) =>
      CategoryList.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Category {
  String title;
  String iconUrl;
  List<Product> items;

  Category({required this.title, required this.iconUrl, required this.items});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'iconUrl': iconUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        title: map['title'] as String,
        iconUrl: map['iconUrl'] as String,
        items: (map['items'] as List).map((e) => Product.fromMap(e)).toList());
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

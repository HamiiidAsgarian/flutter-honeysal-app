import 'dart:convert';

import '../product_model.dart';

class Promotion {
  String title;
  String message;
  String code;
  Promotion({
    required this.title,
    required this.message,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'message': message,
      'code': code,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      title: map['title'] as String,
      message: map['message'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Promotion.fromJson(String source) =>
      Promotion.fromMap(json.decode(source) as Map<String, dynamic>);
}

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
        (map['items'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardList.fromJson(String source) =>
      BoardList.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryList {
  String title;
  List<Category> categories;
  List<Product> items;
  CategoryList({
    required this.title,
    required this.categories,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categories': categories.map((x) => x.toMap()).toList(),
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      title: map['title'] as String,
      categories: List<Category>.from(
        (map['categories'] as List<int>).map<Category>(
          (x) => Category.fromMap(x as Map<String, dynamic>),
        ),
      ),
      items: List<Product>.from(
        (map['items'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryList.fromJson(String source) =>
      CategoryList.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Category {
  String title;
  String iconUrl;
  Category({
    required this.title,
    required this.iconUrl,
  });

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
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

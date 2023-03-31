import 'dart:convert';

import 'package:bakery/model/core_models/icon_info_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int id;
  String title;
  double price;
  String category;
  String imageUrl;
  String description;
  double rate;
  int left;
  int point;
  List<IconInfo> ingredients;
  List<IconInfo> allergens;

  double? off;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.rate,
    required this.left,
    required this.point,
    required this.ingredients,
    required this.allergens,
    this.off,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'description': description,
      'rate': rate,
      'left': left,
      'point': point,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'allergens': allergens.map((x) => x.toMap()).toList(),
      // 'off': off,
    };
  }

//temp
  factory Product.filled() {
    return Product(
        id: 1,
        title: "filled",
        price: 898,
        category: "category",
        imageUrl: "imageUrl",
        description: "description",
        rate: 5,
        left: 2,
        point: 2,
        allergens: [],
        ingredients: []);
  }
//temp
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      rate: map['rate'] as double,
      left: map['left'] as int,
      point: map['point'] as int,
      ingredients: List<IconInfo>.from(
        (map['ingredients'] as List<Map<String, dynamic>>).map<IconInfo>(
          (x) => IconInfo.fromMap(x),
        ),
      ),
      allergens: List<IconInfo>.from(
        (map['allergens'] as List<Map<String, dynamic>>).map<IconInfo>(
          (x) => IconInfo.fromMap(x),
        ),
      ),
      // off: map['off'] != null ? map['off'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
    //  &&
    // other.price == price &&
    // other.category == category &&
    // other.imageUrl == imageUrl &&
    // other.description == description &&
    // other.rate == rate &&
    // other.left == left &&
    // other.point == point &&
    // listEquals(other.ingredients, ingredients) &&
    // listEquals(other.allergens, allergens) &&
    // other.off == off;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode;
    // price.hashCode ^
    // category.hashCode ^
    // imageUrl.hashCode ^
    // description.hashCode ^
    // rate.hashCode ^
    // left.hashCode ^
    // point.hashCode ^
    // ingredients.hashCode ^
    // allergens.hashCode;
  }
}

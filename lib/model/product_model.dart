import 'dart:convert';

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
    this.off,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'off': off,
      'category': category,
      'imageUrl': imageUrl,
      'description': description,
      'rate': rate,
      'left': left,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      off: map['off'] as double,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      rate: map['rate'] as double,
      left: map['left'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

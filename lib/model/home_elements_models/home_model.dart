// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../core_models/product_model.dart';

import 'carousel_model.dart';
import 'category_model.dart';
import 'promotion_model.dart';

class HomePageElements {
  final List<dynamic> items;
  HomePageElements({this.items = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
    };
  }

  factory HomePageElements.fromMap(List<Map<String, dynamic>> map) {
    List homeItems = [];
    for (Map<String, dynamic> element in map) {
      switch (element["type"]) {
        case "promotion":
          {
            homeItems.add(Promotion(
                title: element["title"],
                message: element["message"],
                code: element["code"],
                imageUrl: element["imageUrl"]));
          }
          break;
        case "category":
          {
            homeItems.add(CategoryList(
              title: element["title"],
              categories: (element["categories"] as List)
                  .map((e) => Category.fromMap(e))
                  .toList(),
            ));
          }
          break;
        case "board":
          {
            homeItems.add(CarouselList(
                title: element["title"],
                items: (element["items"] as List)
                    .map((e) => Product.fromMap(e))
                    .toList()));
          }
      }
    }
    return HomePageElements(items: homeItems);
  }

  String toJson() => json.encode(toMap());

  factory HomePageElements.fromJson(String source) => HomePageElements.fromMap(
      json.decode(source) as List<Map<String, dynamic>>);
}

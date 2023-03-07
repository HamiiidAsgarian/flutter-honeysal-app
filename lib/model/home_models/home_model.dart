// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bakery/model/product_model.dart';

import 'home_items_model.dart';

class HomeItems {
  final List items;
  HomeItems({this.items = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
    };
  }

  factory HomeItems.fromMap(Map<String, dynamic> map) {
    print(map["data"]);
    List homeItems = [];
    for (Map<String, dynamic> element in map["data"]) {
      switch (element["type"]) {
        case "promotion":
          {
            homeItems.add(Promotion(
                title: element["title"],
                message: element["message"],
                code: element["code"]));
          }
          break;
        case "category":
          {
            homeItems.add(CategoryList(
                title: element["title"],
                categories: (element["categories"] as List)
                    .map((e) =>
                        Category(title: e['title'], iconUrl: e['iconUrl']))
                    .toList(),
                items: (element["items"] as List)
                    .map((e) => Product(
                          id: 1,
                          title: e['title'],
                          price: e['price'],
                          category: e['category'],
                          imageUrl: e['imageUrl'],
                          description: e['description'],
                          rate: e['rate'],
                          left: e['left'],
                        ))
                    .toList()));
          }
          break;
        case "board":
          {
            homeItems.add(BoardList(
                title: element["title"],
                items: (element["items"] as List)
                    .map((e) => Product(
                        id: e['id'],
                        title: e['title'],
                        price: e['price'],
                        category: e['category'],
                        imageUrl: e['imageUrl'],
                        description: e['description'],
                        rate: e['rate'],
                        left: e['left'],
                        off: e["off"]))
                    .toList()));
          }
      }
    }
    return HomeItems(items: homeItems);
  }

  String toJson() => json.encode(toMap());

  factory HomeItems.fromJson(String source) =>
      HomeItems.fromMap(json.decode(source) as Map<String, dynamic>);
}

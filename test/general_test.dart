// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bakery/model/cart_screen_models/cart_item_model.dart';
// import 'package:bakery/model/core_models/product_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test("Cart items generator", () {
//     List<Product> testRawProductsList = List.generate(
//       5,
//       (index) => Product(
//           id: index,
//           title: "title $index",
//           price: 1,
//           category: "category",
//           imageUrl: "imageUrl",
//           description: "description",
//           rate: 4,
//           left: 4,
//           point: 4,
//           ingredients: [],
//           allergens: []),
//     );
//     List<CountedProductItem> modeledCartItems =
//         cartItemsmaker(cartItems: testRawProductsList);

//     expect(modeledCartItems.runtimeType, List<CountedProductItem>);
//     expect(modeledCartItems.length, testRawProductsList.length);
//   });
// }

// List<CountedProductItem> cartItemsmaker(
//     {BuildContext? context, required List<Product> cartItems}) {
//   Map<dynamic, int> temp = {};
//   List products = [];

//   // List<Product> cartItems = BlocProvider.of<CartBloc>(context).state.cartData;
//   List<CountedProductItem> res = [];

//   for (var element in cartItems) {
//     if (temp.containsKey("${element.id}${element.title}")) {
//       temp["${element.id}${element.title}"] =
//           temp["${element.id}${element.title}"]! + 1;
//     } else {
//       products.add(element);
//       temp["${element.id}${element.title}"] = 1;
//     }
//   }

//   for (int i = 0; i < products.length; i++) {
//     res.add(CountedProductItem(
//         count: temp.values.toList()[i], product: products[i]));
//   }

//   return res;
// }

void main() {
  // List<T1> t1s = [
  //   T1(id: 1, title: "1"),
  //   T1(id: 2, title: "9"),
  //   T1(id: 3, title: "3"),
  //   T1(id: 2, title: "2"),
  //   T1(id: 3, title: "3"),
  //   T1(id: 4, title: "4"),
  //   T1(id: 5, title: "5")
  // ];
  // var z = [];

  // for (var e in a) {
  //   z.add(Product.fromMap(e));
  // }
  // for (var element in z) {}
  // print((z[0] == z[1]));
  // print(z);
  // print(z.toSet());
  // Set<T1> t2 = t1s.toSet();
  // for (var e in t2) {
  //   print(e.title);
  // }
}

var a = [
  {
    'id': 2,
    'title': "i2",
    'price': 3200.2,
    'off': 32.0,
    'category': "category",
    'imageUrl':
        "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
    'description': "description",
    'rate': 4.5,
    'left': 4,
    'point': 8,
    'ingredients': [
      {'imageUrl': "", "title": "egg"},
      {'imageUrl': "", "title": "egg"}
    ],
    'allergens': [
      {'imageUrl': "", "title": "egg"},
      {'imageUrl': "", "title": "egg"}
    ]
  },
  {
    'id': 2,
    'title': "i2",
    'price': 3200.2,
    'off': 32.0,
    'category': "category",
    'imageUrl':
        "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
    'description': "description",
    'rate': 4.5,
    'left': 4,
    'point': 8,
    'ingredients': [
      {'imageUrl': "", "title": "egg"},
      {'imageUrl': "", "title": "egg"}
    ],
    'allergens': [
      {'imageUrl': "", "title": "egg"},
      {'imageUrl': "", "title": "egg"}
    ]
  },
];

class T1 {
  int id;
  String title;
  T1({
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(covariant T1 other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

import 'package:bakery/model/core_models/order_model.dart';

Future<Map<String, dynamic>> sendOrderData(Order order) async {
  await Future.delayed(const Duration(seconds: 1));
  return order.toMap();
  // return {
  //   "id": 333,
  //   "time": "33:89",
  //   "date": "33-23-9889",
  //   "stage": {
  //     "status": "process",
  //     "confirm": {'time': "19:12", "date": "2033/07/07"},
  //     "process": {'time': "19:12", "date": "2033/07/08"},
  //     "ready": {'time': "soon", "date": "soon"}
  //   },
  //   "totalCost": 2323.232,
  //   "products": [
  //     {
  //       'id': 2,
  //       'title': "i2",
  //       'price': 3200.2,
  //       'off': 32,
  //       'category': "category",
  //       'imageUrl':
  //           "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
  //       'description': "description",
  //       'rate': 4.5,
  //       'left': 4,
  //       'point': 8,
  //       'ingredients': [
  //         {'imageUrl': "", "title": "egg"},
  //         {'imageUrl': "", "title": "egg"}
  //       ],
  //       'allergens': [
  //         {'imageUrl': "", "title": "egg"},
  //         {'imageUrl': "", "title": "egg"}
  //       ]
  //     },
  //     {
  //       'id': 1,
  //       'title': "i1",
  //       'price': 3200.2,
  //       'off': 32,
  //       'category': "category",
  //       'imageUrl':
  //           "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
  //       'description': "description",
  //       'rate': 4.5,
  //       'left': 4,
  //       'point': 8,
  //       'ingredients': [
  //         {'imageUrl': "", "title": "egg"},
  //         {'imageUrl': "", "title": "egg"}
  //       ],
  //       'allergens': [
  //         {'imageUrl': "", "title": "egg"},
  //         {'imageUrl': "", "title": "egg"}
  //       ]
  //     },
  //   ]
  // };
}

Future<Map<String, dynamic>> sendOrderForm() async {
  await Future.delayed(const Duration(seconds: 1));

  return {
    "id": 111,
    "time": "99:99",
    "date": "21-23-9889",
    "stage": "deliverd",
    "totalCost": 2323.232,
    "products": [
      {
        'id': 2,
        'title': "i2",
        'price': 3200.2,
        'off': 32,
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
        'id': 1,
        'title': "i1",
        'price': 3200.2,
        'off': 32,
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
    ]
  };
}

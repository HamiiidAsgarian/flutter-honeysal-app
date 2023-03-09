Future<Map<String, dynamic>> getAllData() async {
  await Future.delayed(const Duration(seconds: 0));
  return {
    "user": {
      "id": 1,
      "username": "hamed",
      "email": "sdsd@df.com",
      "phone": "98998989",
      'imageUrl':
          "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
    },
    "cart": [
      {
        'id': 1,
        'title': "title1",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl':
            "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
        'description': "description",
        'rate': 4.5,
        'left': 4,
      },
      {
        'id': 1,
        'title': "title1",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl':
            "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
        'description': "description",
        'rate': 4.5,
        'left': 4,
      },
    ],
    "favorites": [
      {
        'id': 1,
        'title': "title1",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl':
            "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
        'description': "description",
        'rate': 4.5,
        'left': 4,
      },
      {
        'id': 1,
        'title': "title1",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl':
            "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
        'description': "description",
        'rate': 4.5,
        'left': 4,
      },
    ],
    "orders": [
      {
        "id": 1,
        "time": "99:99",
        "date": "21-23-9889",
        "stage": "deliverd",
        "totalCost": 2323.232,
        "products": [
          {
            'id': 1,
            'title': "tisss1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
        ]
      },
      {
        "id": 1,
        "time": "99:99",
        "date": "21-23-9889",
        "stage": "deliverd",
        "totalCost": 2323.232,
        "products": [
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          }
        ]
      },
    ],
    // "firstPage":

    "homePageElements": [
      {
        "type": "promotion",
        "title": "p1",
        "message": "m1",
        "code": "1A236",
        'imageUrl':
            "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
      },
      {
        "type": "board",
        "title": "t1",
        "items": [
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
        ]
      },
      {
        "type": "category",
        "title": "t1",
        // "message": "asasas",
        "categories": [
          {
            "title": "c1",
            "iconUrl":
                "https://cdn-icons-png.flaticon.com/128/1047/1047711.png",
            "items": [
              {
                'id': 1,
                'title': "c1",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl':
                    "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
                'description': "description",
                'rate': 4.5,
                'left': 4,
              },
              {
                'id': 1,
                'title': "c1",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl':
                    "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
                'description': "description",
                'rate': 4.5,
                'left': 4,
              },
            ]
          },
          {
            "title": "c2",
            "iconUrl":
                "https://cdn-icons-png.flaticon.com/128/1047/1047711.png",
            "items": [
              {
                'id': 1,
                'title': "c2",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl':
                    "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
                'description': "description",
                'rate': 4.5,
                'left': 4,
              },
              {
                'id': 1,
                'title': "c2",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl':
                    "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
                'description': "description",
                'rate': 4.5,
                'left': 4,
              },
              {
                'id': 1,
                'title': "c22",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl':
                    "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
                'description': "description",
                'rate': 4.5,
                'left': 4,
              },
            ]
          }
        ],
      },
      {
        "type": "board",
        "title": "t1",
        "items": [
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
          {
            'id': 1,
            'title': "title1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl':
                "https://www.cookingclassy.com/wp-content/uploads/2014/06/chocolate-chip-cookie-16-500x500.jpg",
            'description': "description",
            'rate': 4.5,
            'left': 4,
          },
        ]
      },
    ]
  };
}

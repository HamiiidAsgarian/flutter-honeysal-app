Future<Map<String, dynamic>> getAllData() async {
  await Future.delayed(const Duration(seconds: 1));
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
    ],
    "favorites": [
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
      {
        'id': 3,
        'title': "i3",
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
    ],
    "orders": [
      {
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
      },
      {
        "id": 222222,
        "time": "99:99",
        "date": "21-23-9889",
        "stage": "deliverd",
        "totalCost": 2323.232,
        "products": [
          {
            'id': 4,
            'title': "i4",
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
            'id': 5,
            'title': "i5",
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
                'id': 3,
                'title': "i3",
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
                'id': 4,
                'title': "i4",
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
          },
          {
            "title": "c2",
            "iconUrl":
                "https://cdn-icons-png.flaticon.com/128/1047/1047711.png",
            "items": [
              {
                'id': 10,
                'title': "i10",
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
                'id': 11,
                'title': "i11",
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
                'id': 12,
                'title': "i12",
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
                ],
              },
            ]
          }
        ],
      },
      {
        "type": "board",
        "title": "t7",
        "items": [
          {
            'id': 3,
            'title': "i3",
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
            'id': 8,
            'title': "i8",
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
            'id': 9,
            'title': "i9",
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
            'id': 5,
            'title': "i5",
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
      },
    ],
    "allProducts": [
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
      }
    ]
  };
}

Future<Map<String, dynamic>> getAllData() async {
  await Future.delayed(const Duration(seconds: 1));
  return {
    "user": {
      "id": 1,
      "username": "Jasmin",
      "email": "sdsd@df.com",
      "phone": "98998989",
      'imageUrl': "https://i.ibb.co/ZcbQkkq/profile.jpg",
    },
    "cart": [
      {
        'id': 1,
        'title': "i1",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
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
    ],
    "favorites": [
      {
        'id': 2,
        'title': "i2",
        'price': 3200.2,
        'off': 32,
        'category': "category",
        'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
        'description':
            "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
        'rate': 4.5,
        'left': 2,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png", "title": "Salt"},
          {'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png", "title": "Sugar"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
    ],
    "orders": [
      {
        "id": 969868,
        "time": "222:99",
        "date": "222-23-9889",
        "stage": {
          "status": "ready",
          "confirm": {'time': "19:12", "date": "2033/07/07"},
          "process": {'time': "19:12", "date": "2033/07/08"},
          "ready": {'time': "12:12", "date": "2023/01/01"}
        },
        "totalCost": 64.4,
        "products": [
          {
            'id': 2,
            'title': "i2",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 2,
            'title': "i2",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/S5RDVsj/org-1.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 1,
            'title': "i1",
            'price': 3200.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/JKWdH9R/black-1.png",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
        ]
      },
    ],
    // "firstPage":

    "homePageElements": [
      {
        "type": "promotion",
        "title": "New Year Discount",
        "message":
            "Happy new year, you can have a 10% discount for all your purchases.",
        "code": "A6325EC21",
        'imageUrl': "https://i.ibb.co/YpDm7wZ/3258561.png",
      },
      {
        "type": "category",
        "title": "Categories",
        // "message": "asasas",
        "categories": [
          {
            "title": "First Class Honey",
            "iconUrl": "https://i.ibb.co/7j46yYd/cata-3.png",
            "items": [
              {
                'id': 3,
                'title': "Hive-Top Special",
                'price': 36.0,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 4,
                'title': "Sabalan Sweet",
                'price': 38.99,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/g33tq8L/org-5.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 4,
                'title': "Natural Special-04",
                'price': 32.9,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/t3pPy8S/org-4.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 4,
                'title': "Hive Top-2",
                'price': 32.9,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/g33tq8L/org-5.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
            ]
          },
          {
            "title": "Sabal Honeys",
            "iconUrl": "https://i.ibb.co/5ncHfxv/cata-10.png",
            "items": [
              {
                'id': 10,
                'title': "Sabal H1",
                'price': 15.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/zf7rfmk/ir-3.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 111,
                'title': "Sabal H2",
                'price': 17.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/zf7rfmk/ir-3.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 11,
                'title': "Sahand H1",
                'price': 3200.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/8jx2sHd/ir-2.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 12,
                'title': "Gilan H2",
                'price': 19.99,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/q7HQXcr/ir-1.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 122,
                'title': "Gilan H1",
                'price': 18.00,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/q7HQXcr/ir-1.jpg",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
            ]
          },
          {
            "title": "Astara Shahd",
            "iconUrl": "https://i.ibb.co/ZKYBp10/cata-7.png",
            "items": [
              {
                'id': 10,
                'title': "Astara Sh1",
                'price': 15.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/JKWdH9R/black-1.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 111,
                'title': "Astara Sh2",
                'price': 17.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/Q95qS92/black-4.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
            ]
          },
          {
            "title": "Others",
            "iconUrl": "https://i.ibb.co/PMg09s1/cata-6.png",
            "items": [
              {
                'id': 10,
                'title': "Gold sweet 250g",
                'price': 15.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/RbCBxTw/others-4.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 111,
                'title': "Gold SWeet b2 250g",
                'price': 17.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/LQFWVYc/others-5.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 12,
                'title': "Gold SWeet b2 500g",
                'price': 17.2,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/ZhTdCrM/others-2.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
              {
                'id': 12,
                'title': "Gold SWeet b2 500g x2",
                'price': 35.9,
                'off': 32,
                'category': "category",
                'imageUrl': "https://i.ibb.co/680hxx7/others-3.png",
                'description':
                    "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
                'rate': 4.5,
                'left': 2,
                'point': 8,
                'ingredients': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                    "title": "Salt"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                    "title": "Sugar"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ],
                'allergens': [
                  {
                    'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                    "title": "Butter"
                  },
                  {
                    'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png",
                    "title": "Egg"
                  }
                ]
              },
            ]
          },
        ],
      },
      {
        "type": "board",
        "title": "Best Sellings",
        "items": [
          {
            'id': 12,
            'title': "Gold SWeet b2 500g",
            'price': 17.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/ZhTdCrM/others-2.png",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 3,
            'title': "Hive-Top Special",
            'price': 36.0,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 4,
            'title': "Sabalan Sweet",
            'price': 38.99,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/g33tq8L/org-5.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 111,
            'title': "Astara Sh2",
            'price': 17.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/Q95qS92/black-4.png",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          }
        ]
      },
      {
        "type": "promotion",
        "title": "18 days left",
        "message": "Don't loose our event sign up for latest production",
        "code": "2217",
        'imageUrl': "https://i.ibb.co/FVHW1mT/2268558.png",
      },
      {
        "type": "board",
        "title": "Latest products",
        "items": [
          {
            'id': 12,
            'title': "Gold SWeet b2 500g",
            'price': 17.2,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/pK8JGh8/others-1.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 3,
            'title': "Hive-Top Special 2",
            'price': 36.0,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/JKWdH9R/black-1.png",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
          {
            'id': 4,
            'title': "Sabalan Sweet",
            'price': 38.99,
            'off': 32,
            'category': "category",
            'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
            'description':
                "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
            'rate': 4.5,
            'left': 2,
            'point': 8,
            'ingredients': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {
                'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png",
                "title": "Salt"
              },
              {
                'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png",
                "title": "Sugar"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ],
            'allergens': [
              {
                'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
                "title": "Butter"
              },
              {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
            ]
          },
        ]
      },
    ],

    "allProducts": [
      {
        'id': 1,
        'title': "Sabal Pecial 250g",
        'price': 32.2,
        'off': 1,
        'category': "Sabal Pecial",
        'imageUrl': "https://i.ibb.co/JKWdH9R/black-1.png",
        'description':
            "Jacob’s biscuits are a household name in Ireland, and choosing just one from their wide choice of biscuits is nearly impossible. They have everything from Coconut Creams to Fig Rolls to Kimberley biscuits, but their show-stopper and true bakery magic has to be the Mikado.It consists of a biscuit base with mallow in two lines atop it, strawberry jam scooped into the middle, and coconut sprinkled all over the top. We’re drooling just thinking about it.",
        'rate': 4.5,
        'left': 2,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png", "title": "Salt"},
          {'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png", "title": "Sugar"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
      {
        'id': 2,
        'title': "Sabal Pecial 2 250g",
        'price': 35.2,
        'off': 1,
        'category': "Sabal Pecial",
        'imageUrl': "https://i.ibb.co/Q95qS92/black-4.png",
        'description':
            "While the weather in Ireland can be indecisive, the choice of buying a Twister ice cream never is. The Twister, easily recognised by its spiral shape and green and white colours, is an adored summer snack (or anytime snack).It consists of lime ice cream twirled around pineapple ice cream with strawberry filling smack-dab in the centre of the spiral. We loved it as kids and love it as much as adults. It’s got the perfect mix of flavours, texture, and refreshing taste.",
        'rate': 4.5,
        'left': 4,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
        ]
      },
      {
        'id': 3,
        'title': "Mountain Honey 500g",
        'price': 15.2,
        'off': 1,
        'category': "Mountain Honey",
        'imageUrl': "https://i.ibb.co/rf4WS9d/org-1.jpg",
        'description':
            "Clove Rock may be an acquired taste, but its existence in Irish homes is impossible to ignore. This boiled sweet flavoured with cloves and sugar in the shape of a red cylinder has been around for decades. It brings a burning to your tongue and paints your mouth red.While a little like Marmite (you either love them or hate them), they’re an Irish sweet you have to try.",
        'rate': 4.5,
        'left': 4,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
      {
        'id': 4,
        'title': "Mountain Honey 500g",
        'price': 15.2,
        'off': 1,
        'category': "Mountain Honey",
        'imageUrl': "https://i.ibb.co/S5RDVsj/org-2.jpg",
        'description':
            "Not to be confused with McVitie’s Jaffa Cakes, Jacob’s Jaffa Cakes are a lot better—take it from us. Consisting of a cake layer, jellied orange centre, and dark chocolate slathered on top, these treats have everything you could want from a snack.They’re perfect for dunking in a cup of tea or separating into sections and gobbling endlessly, and we guarantee you won’t be able to stop at just one.",
        'rate': 2.5,
        'left': 1,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png", "title": "Sugar"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
      {
        'id': 5,
        'title': "Mountain Honey 1 250g",
        'price': 15.2,
        'off': 1,
        'category': "Mountain Honey",
        'imageUrl': "https://i.ibb.co/q7HQXcr/ir-1.jpg",
        'description':
            "One look at the can or bottle brings back warm childhood memories. Club Orange is an orange soft drink made even more delicious and special because of the real bits of orange left in it.The perfect balance of bubbles, sugar, and orange, it’s a drink we could have every day for the rest of our lives without ever getting tired of it. Known for its bold flavours of Lemon, Rock Shandy, and Passion Fruit, you can’t beat the original. Club Orange will quench any thirst.",
        'rate': 4.5,
        'left': 4,
        'point': 8,
        'ingredients': [
          {'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png", "title": "Sugar"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
      {
        'id': 6,
        'title': "Mountain Honey 2 500g",
        'price': 45.2,
        'off': 1,
        'category': "Mountain Honey",
        'imageUrl': "https://i.ibb.co/g33tq8L/org-5.jpg",
        'description':
            "Need we even say anything because the name speaks for itself? Tayto is maybe Ireland’s most well-known snack. It has stood the test of time and even inspired its very own theme park in County Meath.While it boasts a wide range of flavours including Prawn Cocktail (one of our top picks), Salt and Vinegar, Curry Chip and Spring Onion, the classic Cheese and Onion flavour is what you need to try. Ask anybody from the island about Tayto and see for yourself how passionate we are about it.",
        'rate': 4.5,
        'left': 4,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png", "title": "Salt"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
      {
        'id': 7,
        'title': "RiverSilver 500g",
        'price': 17.2,
        'off': 1,
        'category': "Silver Honey",
        'imageUrl': "https://i.ibb.co/t3pPy8S/org-4.jpg",
        'description':
            "Whether it’s down to the milk produced here or the rationing laws active in the past, Irish Cadbury chocolate is the most delectable snack you can get on the island.The creamy milk chocolate is often paired with toppings and flavours like caramel and nuts, but you can’t beat a classic Dairy Milk bar, and you can’t beat Cadbury.There you have it—the top ten Irish snacks and sweets you need to taste. If nothing else, the range of choice is astounding, and whether you’re feeling like crisps, a refreshing drink, or a bar of chocolate, Ireland has plenty of options for your sweet tooth.",
        'rate': 4.5,
        'left': 4,
        'point': 8,
        'ingredients': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/Kst9zwJ/salt.png", "title": "Salt"},
          {'imageUrl': "https://i.ibb.co/CVJdcSZ/sugar.png", "title": "Sugar"},
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ],
        'allergens': [
          {
            'imageUrl': "https://i.ibb.co/qkMsS2S/butter.png",
            "title": "Butter"
          },
          {'imageUrl': "https://i.ibb.co/XZGBsBr/egg.png", "title": "Egg"}
        ]
      },
    ]
  };
}

//---
Future<Map<String, dynamic>> logInDataPost(dynamic response) async {
  await Future.delayed(const Duration(seconds: 1));

  if (response == true) {
    return {"status": 200};
  }
  return {"status": 400};
}

Future<Map<String, dynamic>> signUpDataPost(dynamic response) async {
  await Future.delayed(const Duration(seconds: 1));

  if (response == true) {
    return {"status": 200};
  }
  return {"status": 400};
}

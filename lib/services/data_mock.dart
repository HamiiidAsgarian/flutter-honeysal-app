Future<Map<String, dynamic>> firstPageData() async {
  await Future.delayed(const Duration(seconds: 2));
  return {
    "firstPage": {
      "data": [
        {"type": "promotion", "title": "p1", "message": "m1", "code": "1A236"},
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
              'imageUrl': "imageUrl",
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
              'imageUrl': "imageUrl",
              'description': "description",
              'rate': 4.5,
              'left': 4,
            },
          ]
        },
        {
          "type": "category",
          "title": "t1",
          "message": "asasas",
          "categories": [
            {"title": "t1", "iconUrl": "url1"},
            {"title": "t1", "iconUrl": "url1"}
          ],
          "items": [
            {
              'id': 1,
              'title': "title1",
              'price': 3200.2,
              'off': 32,
              'category': "category",
              'imageUrl': "imageUrl",
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
              'imageUrl': "imageUrl",
              'description': "description",
              'rate': 4.5,
              'left': 4,
            },
          ]
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
              'imageUrl': "imageUrl",
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
              'imageUrl': "imageUrl",
              'description': "description",
              'rate': 4.5,
              'left': 4,
            },
          ]
        },
      ]
    }
  };
}

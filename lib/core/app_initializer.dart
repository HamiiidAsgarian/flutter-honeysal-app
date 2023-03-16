import 'package:bakery/model/app_data_model.dart';
import 'package:bakery/services/app_start_data.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:bakery/view_model/favorite_bloc.dart';
import 'package:bakery/view_model/first_screen_bloc.dart';
import 'package:bakery/view_model/orders_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/all_products_bloc.dart';

class AppInitializer {
  late AppData appdata;

  Future<List> getApiData(BuildContext context) async {
    Map<String, dynamic> data = await getAllData();

    appdata = AppData.fromMap(data);

    return [
      appdata.favorites,
      appdata.cart,
      appdata.orders,
      appdata.homePageElements,
      // appdata.allProducts,
    ];
  }

  updateTheState(BuildContext context) {
    print(appdata.homePageElements.toMap());
    print(appdata.allProducts);

    // BlocProvider.of<FirstScreenBloc>(context)
    //     .add(GetHomeScreenData(appdata: appdata.homePageElements));
    // BlocProvider.of<CartBloc>(context).add(Ge(data: appdata.homePageElements));

    BlocProvider.of<CartBloc>(context).add(GetCartData(data: appdata.cart));

    BlocProvider.of<FavoriteBloc>(context)
        .add(GetFavoriteData(item: appdata.favorites));

    BlocProvider.of<OrderBloc>(context).add(GetOrderData(data: appdata.orders));

    try {
      BlocProvider.of<AllProductsBloc>(context)
          .add(GetFirstScreenElement(item: appdata.homePageElements));
    } catch (e) {
      print(e);
    }
  }
}

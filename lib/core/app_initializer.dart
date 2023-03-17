import 'package:bakery/model/app_data_model.dart';
import 'package:bakery/services/app_start_data.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:bakery/view_model/favorite_bloc.dart';
import 'package:bakery/view_model/orders_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/all_products_bloc.dart';

class AppInitializer {
  late AppData? _appdata;

  // Future<List>
  getApiData(BuildContext context) async {
    Map<String, dynamic> data = await getAllData();

    _appdata = AppData.fromMap(data);

    // return [
    //   appdata.favorites,
    //   appdata.cart,
    //   appdata.orders,
    //   appdata.homePageElements,
    //   // appdata.allProducts,
    // ];
  }

  updateTheState(BuildContext context) {
    if (_appdata != null) {
      BlocProvider.of<CartBloc>(context).add(GetCartData(data: _appdata!.cart));

      BlocProvider.of<FavoriteBloc>(context)
          .add(GetFavoriteData(item: _appdata!.favorites));

      BlocProvider.of<OrderBloc>(context)
          .add(GetOrderData(data: _appdata!.orders));

      BlocProvider.of<AllProductsBloc>(context).add(GetFirstScreenElement(
          userData: _appdata!.user,
          pageElements: _appdata!.homePageElements,
          allProducts: _appdata!.allProducts));
    }
  }
}

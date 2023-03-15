import 'package:bakery/model/app_data_model.dart';
import 'package:bakery/services/app_start_data.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:bakery/view_model/favorite_bloc.dart';
import 'package:bakery/view_model/orders_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitializer {
  late AppData appdata;

  Future<List> getApiData(BuildContext context) async {
    Map<String, dynamic> data = await getAllData();

    appdata = AppData.fromMap(data);

    return [
      appdata.favorites,
      appdata.cart,
      appdata.orders,
      appdata.homePageElements
    ];
  }

  updateTheState(BuildContext context) {
    // AppData appdata = AppData.fromMap(data);

    BlocProvider.of<CartBloc>(context).add(GetCartData(data: appdata.cart));

    // CartBloc().add(GetCartData(data: appdata.cart));

    BlocProvider.of<FavoriteBloc>(context)
        .add(GetFavoriteData(item: appdata.favorites));

    BlocProvider.of<OrderBloc>(context).add(GetOrderData(data: appdata.orders));
  }
}

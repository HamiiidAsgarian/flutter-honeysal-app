// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class GetCartData extends CartEvent {
  List<Product> data;
  GetCartData({required this.data});
}

//--------------------------------------------------------
abstract class CartState {
  CartState({required this.cartData});
  List<Product>? cartData;
}

class CartInitial extends CartState {
  CartInitial() : super(cartData: null);
}

class CartUpdate extends CartState {
  CartUpdate({required super.cartData});
}

//--------------------------------------------------------
class CartBloc extends Bloc<CartEvent, CartState> {
  List<Product> cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<GetCartData>(getApiCartData);
  }
  // Future<List<Data>>
  getApiCartData(GetCartData event, Emitter<CartState> emit) async {
    cartItems = event.data;
    emit(CartUpdate(cartData: cartItems));
  }
}

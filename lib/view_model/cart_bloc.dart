// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/core/utilities.dart';
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/cart_screen_models/cart_item_model.dart';

abstract class CartEvent {}

class GetCartData extends CartEvent {
  List<Product> data;
  GetCartData({required this.data});
}

class AddToCart extends CartEvent {
  Product item;
  AddToCart({required this.item});
}

class AddListToCart extends CartEvent {
  List<Product> item;
  AddListToCart({required this.item});
}

class RemoveFromCart extends CartEvent {
  Product item;
  RemoveFromCart({required this.item});
}

class RemoveAllofAnItemFromCart extends CartEvent {
  Product item;
  RemoveAllofAnItemFromCart({required this.item});
}

class EmptyTheCart extends CartEvent {
  EmptyTheCart();
}

class CartItemsToCartSet extends CartEvent {
  // List<Product> item;
  // CartItemsToCartSet({required this.item});
}

//--------------------------------------------------------
abstract class CartState {
  CartState({this.cartData = const [], required this.cartSetData});
  List<Product> cartData;
  List<CountedProductItem> cartSetData;
}

class CartInitial extends CartState {
  CartInitial() : super(cartData: [], cartSetData: []);
}

class CartUpdate extends CartState {
  CartUpdate({required super.cartData, super.cartSetData = const []});
}

class CartSetUpdate extends CartState {
  CartSetUpdate({
    required super.cartSetData,
    required super.cartData,
  });
}

//--------------------------------------------------------
class CartBloc extends Bloc<CartEvent, CartState> {
  List<Product> cartItems = [];
  List<CountedProductItem> cartItemsSet = [];

  CartBloc() : super(CartInitial()) {
    on<GetCartData>(getApiCartData);
    on<AddToCart>(addToCart);
    on<AddListToCart>(addListToCart);

    on<RemoveFromCart>(removeFromCart);
    on<RemoveAllofAnItemFromCart>(removeAllFromCart);
    on<EmptyTheCart>(emptyTheCart);

    // on<CartItemsToCartSet>(cartItemsToCartSet);
  }

//---------------------------------------------------------------

  getApiCartData(GetCartData event, Emitter<CartState> emit) {
    cartItems = event.data;

//Turn all existed products to cartItem format
    for (Product element in cartItems) {
      productsToCartItem(element); //Note is not a pure fuction
    }

    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }

//---------------------------------------------------------------
  addListToCart(AddListToCart event, Emitter<CartState> emit) {
    cartItems = [...cartItems, ...event.item];

    cartItemsSet = productsListToCartItemSet(cartItems);
    // productsToCartItem(event.item); //Note is not a pure fuction

    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }

  //---------------------------------------------------------------

  addToCart(AddToCart event, Emitter<CartState> emit) {
    cartItems.add(event.item);
    productsToCartItem(event.item); //Note is not a pure fuction

    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }

//---------------------------------------------------------------

  removeFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    // var a = cartItems.firstWhere((e) => e == event.item);
    cartItems.remove(event.item);
    cartItemsSet.where((e) => e.product.id == event.item.id).first.count -= 1;
    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }

//---------------------------------------------------------------

  removeAllFromCart(RemoveAllofAnItemFromCart event, Emitter<CartState> emit) {
    cartItems.removeWhere((e) => e == event.item);
    cartItemsSet.removeWhere((CountedProductItem e) => e.product == event.item);

    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }

//---------------------------------------------------------------

  emptyTheCart(EmptyTheCart event, Emitter<CartState> emit) {
    cartItems = [];
    cartItemsSet = [];

    emit(CartUpdate(cartData: cartItems, cartSetData: cartItemsSet));
  }
//---------------------------------------------------------------

  productsToCartItem(Product product) {
    CountedProductItem? selected =
        cartItemsSet.firstWhereOrNull((e) => product == e.product);

    if (selected != null) {
      selected.count += 1;
    } else {
      cartItemsSet.add(CountedProductItem(product: product, count: 1));
    }
  }
}

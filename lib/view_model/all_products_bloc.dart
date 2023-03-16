// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_elements_models/home_model.dart';

abstract class AllProductsEvent {}

class GetFirstScreenElement extends AllProductsEvent {
  HomePageElements item;
  GetFirstScreenElement({required this.item});
}

class GetAllProducts extends AllProductsEvent {
  List<Product> products;
  GetAllProducts({required this.products});
}

// class AddToFavoriteData extends AllProductsEvent {
//   Product item;
//   AddToFavoriteData({required this.item});
// }

// class RemoveFromFavoriteData extends AllProductsEvent {
//   Product item;
//   RemoveFromFavoriteData({required this.item});
// }

//--------------------------------------------------------
abstract class AllProductsState {
  AllProductsState({required this.favoriteData, required this.products});
  HomePageElements favoriteData;
  List<Product> products;
}

class FavoriteInitial extends AllProductsState {
  FavoriteInitial() : super(favoriteData: HomePageElements(), products: []);
}

class DataUpdate extends AllProductsState {
  DataUpdate({required super.favoriteData, required super.products});
}

//--------------------------------------------------------
class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  late HomePageElements screenData;
  List<Product> products = [];

  AllProductsBloc() : super(FavoriteInitial()) {
    on<GetFirstScreenElement>(getApiFavoriteData);
    // on<AddToFavoriteData>(addToFavoriteData);
    // on<RemoveFromFavoriteData>(removeFromFavoriteData);
  }
  // Future<List<Data>>
  getApiFavoriteData(
      GetFirstScreenElement event, Emitter<AllProductsState> emit) {
    screenData = event.item;
    emit(DataUpdate(favoriteData: screenData, products: products));
  }

  // addToFavoriteData(AddToFavoriteData event, Emitter<AllProductsState> emit) {
  //   favoriteItems.add(event.item);
  //   emit(FavoriteUpdate(favoriteData: favoriteItems));
  // }

  // removeFromFavoriteData(
  //     RemoveFromFavoriteData event, Emitter<AllProductsState> emit) {
  //   favoriteItems.removeWhere((e) => e.id == event.item.id);
  //   emit(FavoriteUpdate(favoriteData: favoriteItems));
  // }
}

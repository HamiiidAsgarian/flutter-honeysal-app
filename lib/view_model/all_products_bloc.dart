// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/product_model.dart';
import 'package:bakery/model/core_models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_elements_models/home_model.dart';

abstract class AllProductsEvent {}

class GetFirstScreenElement extends AllProductsEvent {
  HomePageElements pageElements;
  List<Product> allProducts;
  User userData;

  GetFirstScreenElement(
      {required this.pageElements,
      required this.allProducts,
      required this.userData});
}

class GetAllProducts extends AllProductsEvent {
  List<Product> products;
  GetAllProducts({required this.products});
}

//--------------------------------------------------------
abstract class AllProductsState {
  AllProductsState(
      {required this.homePageElementsData,
      required this.allProducts,
      required this.userData});
  HomePageElements homePageElementsData;
  List<Product> allProducts;
  User? userData;
}

class FavoriteInitial extends AllProductsState {
  FavoriteInitial()
      : super(
            homePageElementsData: HomePageElements(),
            allProducts: [],
            userData: User(id: 00, username: "NA", email: "NA", phone: "NA"));
}

class DataUpdate extends AllProductsState {
  DataUpdate(
      {required super.homePageElementsData,
      required super.allProducts,
      required super.userData});
}

//--------------------------------------------------------
class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  late HomePageElements screenData;
  List<Product> allProducts = [];
  late User? userData;

  AllProductsBloc() : super(FavoriteInitial()) {
    on<GetFirstScreenElement>(getApiFavoriteData);
    // on<AddToFavoriteData>(addToFavoriteData);
    // on<RemoveFromFavoriteData>(removeFromFavoriteData);
  }
  // Future<List<Data>>
  getApiFavoriteData(
      GetFirstScreenElement event, Emitter<AllProductsState> emit) {
    screenData = event.pageElements;
    allProducts = event.allProducts;
    userData = event.userData;
    emit(DataUpdate(
        homePageElementsData: screenData,
        allProducts: allProducts,
        userData: userData));
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

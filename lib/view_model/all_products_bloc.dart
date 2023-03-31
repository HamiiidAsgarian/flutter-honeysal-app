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

class IsFirstShow extends AllProductsEvent {
  // bool isFirstShow;
  IsFirstShow();
}

//--------------------------------------------------------
abstract class AllProductsState {
  AllProductsState(
      {required this.homePageElementsData,
      required this.allProducts,
      required this.userData,
      required this.isFirstTime});
  HomePageElements homePageElementsData;
  List<Product> allProducts;
  User? userData;
  bool isFirstTime = true;
}

class FavoriteInitial extends AllProductsState {
  FavoriteInitial()
      : super(
            homePageElementsData: HomePageElements(),
            allProducts: [],
            userData: User(id: 00, username: "NA", email: "NA", phone: "NA"),
            isFirstTime: true);
}

class DataUpdate extends AllProductsState {
  DataUpdate(
      {required super.homePageElementsData,
      required super.allProducts,
      required super.userData,
      required super.isFirstTime});
}

//--------------------------------------------------------
class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  late HomePageElements screenData;
  List<Product> allProducts = [];
  late User? userData;
  bool isFirstTime = true;

  AllProductsBloc() : super(FavoriteInitial()) {
    on<GetFirstScreenElement>(getApiFavoriteData);
    on<IsFirstShow>(isFirstShow);
  }
  // Future<List<Data>>
  getApiFavoriteData(
      GetFirstScreenElement event, Emitter<AllProductsState> emit) {
    screenData = event.pageElements;
    allProducts = event.allProducts;
    userData = event.userData;

    emit(DataUpdate(
        isFirstTime: isFirstTime,
        homePageElementsData: screenData,
        allProducts: allProducts,
        userData: userData));
  }

  isFirstShow(IsFirstShow event, Emitter<AllProductsState> emit) {
    // screenData = event.pageElements;
    // allProducts = event.allProducts;
    // isFirstTime = event.isFirstShow;
    emit(DataUpdate(
        isFirstTime: isFirstTime,
        homePageElementsData: screenData,
        allProducts: allProducts,
        userData: userData));

    isFirstTime = false;
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

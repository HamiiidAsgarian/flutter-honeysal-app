// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bakery/model/home_models/home_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../services/data2.dart';

// abstract class ProductEvent {
//   // Future<Product> getAllProducts();
// }

// class GetHomeScreenProducts extends ProductEvent {
//   GetHomeScreenProducts();

//   // @override
//   // Future<Product> getAllProducts() {}
// }

// //--------------------------------------------------------
// abstract class HomeDataState {
//   HomeDataState({required this.homeData});
//   HomePageElements? homeData;
// }

// class HomeDataInitial extends HomeDataState {
//   HomeDataInitial() : super(homeData: null);
// }

// class HomeDataUpdate extends HomeDataState {
//   HomeDataUpdate({required super.homeData});
// }

// //--------------------------------------------------------
// class ProductBloc extends Bloc<ProductEvent, HomeDataState> {
//   // List<Product> homeScreenData = [];
//   HomePageElements? homeScreenData;

//   ProductBloc() : super(HomeDataInitial()) {
//     on<GetHomeScreenProducts>(onGetAllProducts);
//   }
//   // Future<List<Product>>
//   onGetAllProducts(
//       GetHomeScreenProducts event, Emitter<HomeDataState> emit) async {
//     Map<String, dynamic> rawData = await getAllData();
//     Map<String, dynamic> temp = rawData["firstPage"];
//     // print("++++++++$temp");
//     HomePageElements serilizedHomeData = HomePageElements.fromMap(temp);

//     // homeScreenData.add(product);
//     homeScreenData = serilizedHomeData;
//     emit(HomeDataUpdate(homeData: serilizedHomeData));

//     // print(homeScreenData);
//     // return homeScreenData;
//   }
// }

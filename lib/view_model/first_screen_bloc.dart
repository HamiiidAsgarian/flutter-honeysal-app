// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bakery/model/core_models/product_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../model/home_elements_models/home_model.dart';

// abstract class FirstScreenEvent {
//   // Future<Data> getAllDatas();
// }

// class GetHomeScreenData extends FirstScreenEvent {
//   HomePageElements appdata;
//   GetHomeScreenData({required this.appdata});

//   // @override
//   // Future<Data> getAllData() {}
// }

// class GetAllProductsData extends FirstScreenEvent {
//   List<Product> products;
//   GetAllProductsData({required this.products});

//   // @override
//   // Future<Data> getAllData() {}
// }

// //--------------------------------------------------------
// abstract class FirstScreenState {
//   FirstScreenState({required this.appData, required this.allProductsList});
//   HomePageElements? appData;
//   List<Product> allProductsList;
// }

// class FirstScreenInitial extends FirstScreenState {
//   FirstScreenInitial()
//       : super(appData: HomePageElements(), allProductsList: []);
// }

// class FirstScreenUpdate extends FirstScreenState {
//   FirstScreenUpdate({required super.appData, required super.allProductsList});
// }

// //--------------------------------------------------------
// class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
//   List<Product> allProductsList = [];
//   late HomePageElements homeScreenData;

//   FirstScreenBloc() : super(FirstScreenInitial()) {
//     on<GetHomeScreenData>(onGetHomeScreenData);
//     on<GetAllProductsData>(getAllProductsData);
//   }
//   // Future<List<Data>>
//   onGetHomeScreenData(
//       GetHomeScreenData event, Emitter<FirstScreenState> emit) async {
//     homeScreenData = event.appdata;
//     emit(FirstScreenUpdate(
//         appData: homeScreenData, allProductsList: allProductsList));
//   }

//   getAllProductsData(
//       GetAllProductsData event, Emitter<FirstScreenState> emit) async {
//     allProductsList = event.products;
//     emit(FirstScreenUpdate(
//         appData: homeScreenData, allProductsList: allProductsList));
//   }
// }

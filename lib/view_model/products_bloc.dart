// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/home_models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bakery/model/product_model.dart';

import '../services/data_mock.dart';

abstract class ProductEvent {
  // Future<Product> getAllProducts();
}

class GetAllProducts extends ProductEvent {
  GetAllProducts();

  // @override
  // Future<Product> getAllProducts() {}
}

//--------------------------------------------------------
abstract class ProductState {
  ProductState({required this.products});
  List<Product> products;
}

class ProductInitial extends ProductState {
  ProductInitial() : super(products: []);
}

class ProductUpdate extends ProductState {
  ProductUpdate({required super.products});
}

//--------------------------------------------------------
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> products = [];

  ProductBloc() : super(ProductInitial()) {
    on<GetAllProducts>(onGetAllProducts);
  }
  Future<List<Product>> onGetAllProducts(
      GetAllProducts event, Emitter<ProductState> emit) async {
    Product product = Product(
        id: products.length + 1,
        title: "title",
        price: 2333,
        category: "category",
        imageUrl: "imageUrl",
        description: "description",
        rate: 4.5,
        left: 21);

    Map<String, dynamic> data = await firstPageData();
    print("0 - $data -----");
    Map<String, dynamic> temp = data["firstPage"];
    HomeItems b = HomeItems.fromMap(temp);
    print("$b +++++");

    // await Future.delayed(const Duration(seconds: 2));
    products.add(product);

    emit(ProductUpdate(products: products));

    print(products);
    return products;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FavoriteEvent {}

class GetFavoriteData extends FavoriteEvent {
  List<Product> data;
  GetFavoriteData({required this.data});
}

class AddToFavoriteData extends FavoriteEvent {
  Product data;
  AddToFavoriteData({required this.data});
}

class RemoveFromFavoriteData extends FavoriteEvent {
  Product data;
  RemoveFromFavoriteData({required this.data});
}

//--------------------------------------------------------
abstract class FavoriteState {
  FavoriteState({required this.favoriteData});
  List<Product> favoriteData;
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(favoriteData: const []);
}

class FavoriteUpdate extends FavoriteState {
  FavoriteUpdate({required super.favoriteData});
}

//--------------------------------------------------------
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<Product> favoriteItems = [];

  FavoriteBloc() : super(FavoriteInitial()) {
    on<GetFavoriteData>(getApiFavoriteData);
    on<AddToFavoriteData>(addToFavoriteData);
    on<RemoveFromFavoriteData>(removeFromFavoriteData);
  }
  // Future<List<Data>>
  getApiFavoriteData(GetFavoriteData event, Emitter<FavoriteState> emit) {
    favoriteItems = event.data;
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }

  addToFavoriteData(AddToFavoriteData event, Emitter<FavoriteState> emit) {
    favoriteItems.add(event.data);
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }

  removeFromFavoriteData(
      RemoveFromFavoriteData event, Emitter<FavoriteState> emit) {
    favoriteItems.removeWhere((e) => e.id == event.data.id);
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }
}

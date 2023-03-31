// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FavoriteEvent {}

class GetFavoriteData extends FavoriteEvent {
  List<Product> item;
  GetFavoriteData({required this.item});
}

class AddToFavoriteData extends FavoriteEvent {
  Product item;
  AddToFavoriteData({required this.item});
}

class RemoveFromFavoriteData extends FavoriteEvent {
  Product item;
  RemoveFromFavoriteData({required this.item});
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
    favoriteItems = event.item;
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }

  addToFavoriteData(AddToFavoriteData event, Emitter<FavoriteState> emit) {
    favoriteItems.add(event.item);
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }

  removeFromFavoriteData(
      RemoveFromFavoriteData event, Emitter<FavoriteState> emit) {
    favoriteItems.removeWhere((e) => e.id == event.item.id);
    emit(FavoriteUpdate(favoriteData: favoriteItems));
  }
}

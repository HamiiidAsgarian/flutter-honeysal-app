// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/app_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/app_start_data.dart';

abstract class DataEvent {
  // Future<Data> getAllDatas();
}

class GetHomeScreenData extends DataEvent {
  GetHomeScreenData();

  // @override
  // Future<Data> getAllData() {}
}

//--------------------------------------------------------
abstract class HomeDataState {
  HomeDataState({required this.homeData});
  AppData? homeData;
}

class HomeDataInitial extends HomeDataState {
  HomeDataInitial() : super(homeData: null);
}

class HomeDataUpdate extends HomeDataState {
  HomeDataUpdate({required super.homeData});
}

//--------------------------------------------------------
class DataBloc extends Bloc<DataEvent, HomeDataState> {
  // List<Data> homeScreenData = [];
  AppData? homeScreenData;

  DataBloc() : super(HomeDataInitial()) {
    on<GetHomeScreenData>(onGetAllData);
  }
  // Future<List<Data>>
  onGetAllData(GetHomeScreenData event, Emitter<HomeDataState> emit) async {
    Map<String, dynamic> rawData = await getAllData();
    Map<String, dynamic> temp = rawData;
    AppData serilizedHomeData = AppData.fromMap(temp);
    homeScreenData = serilizedHomeData;
    emit(HomeDataUpdate(homeData: serilizedHomeData));

    // print(homeScreenData);
    // return homeScreenData;
  }
}

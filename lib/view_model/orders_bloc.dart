// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/model/core_models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OrderEvent {}

class GetOrderData extends OrderEvent {
  List<Order> data;
  GetOrderData({required this.data});
}

class AddOrder extends OrderEvent {
  Order data;
  AddOrder({required this.data});
}

//--------------------------------------------------------
abstract class OrderState {
  OrderState({required this.orderData});
  List<Order> orderData;
}

class OrderInitial extends OrderState {
  OrderInitial() : super(orderData: []);
}

class OrderUpdate extends OrderState {
  OrderUpdate({required super.orderData});
}

//--------------------------------------------------------
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  List<Order> orderItems = [];

  OrderBloc() : super(OrderInitial()) {
    on<GetOrderData>(getApiOrderData);
    on<AddOrder>(addOrder);
  }
  // Future<List<Data>>
  getApiOrderData(GetOrderData event, Emitter<OrderState> emit) async {
    orderItems = event.data;
    emit(OrderUpdate(orderData: orderItems));
  }

  addOrder(AddOrder event, Emitter<OrderState> emit) async {
    orderItems.add(event.data);
    emit(OrderUpdate(orderData: orderItems));
  }
}

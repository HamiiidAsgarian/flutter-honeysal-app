// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'product_model.dart';

class Order {
  int? id;
  List<Product> products;
  String date;
  String time;

  Stage stage;
  double totalCost;
  Order({
    this.id,
    required this.products,
    required this.date,
    required this.time,
    required this.stage,
    required this.totalCost,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'date': date,
      'time': time,
      'stage': stage.toMap(),
      'totalCost': totalCost,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      products: List<Product>.from(
        (map['products'] as List<Map<String, dynamic>>).map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      date: map['date'] as String,
      time: map['time'] as String,
      stage: Stage.fromMap(map['stage']),
      totalCost: map['totalCost'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}

//------------------------------------------------------
class Stage {
  OrderStageStatus? status;
  StageTimeDate? confirm;
  StageTimeDate? process;
  StageTimeDate? ready;

  Stage({
    required this.status,
    this.process,
    this.confirm,
    this.ready,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status!.name.toString(),
      'confirm': confirm != null ? confirm!.toMap() : null,
      'process': process != null ? confirm!.toMap() : null,
      'ready': ready != null ? confirm!.toMap() : null,
    };
  }

  factory Stage.fromMap(Map<String, dynamic> map) {
    OrderStageStatus? res;
    switch (map['status']) {
      case "confirm":
        res = OrderStageStatus.confirm;
        break;
      case "process":
        res = OrderStageStatus.process;
        break;

      case "ready":
        res = OrderStageStatus.ready;
        break;
    }

    return Stage(
        status: res,
        process: map['process'] != null
            ? StageTimeDate.fromMap(map['process'])
            : null,
        confirm: map['confirm'] != null
            ? StageTimeDate.fromMap(map['confirm'])
            : null,
        ready:
            map['ready'] != null ? StageTimeDate.fromMap(map['ready']) : null);
  }

  String toJson() => json.encode(toMap());

  factory Stage.fromJson(String source) =>
      Stage.fromMap(json.decode(source) as Map<String, dynamic>);
}
//------------------------------------------------------

class StageTimeDate {
  String? time;
  String? date;
  StageTimeDate({this.time, this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'date': date,
    };
  }

  factory StageTimeDate.fromMap(Map<String, dynamic> map) {
    return StageTimeDate(
      time: map['time'] != null ? map['time'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StageTimeDate.fromJson(String source) =>
      StageTimeDate.fromMap(json.decode(source) as Map<String, dynamic>);
}
//------------------------------------------------------

enum OrderStageStatus { confirm, process, ready }

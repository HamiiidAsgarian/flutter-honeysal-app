// import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class CheckoutForm {
//   String date;
//   String pickupTime;
//   String telephone;
//   String payment;
//   double totalPrice;
//   CheckoutForm({
//     required this.date,
//     required this.pickupTime,
//     required this.telephone,
//     required this.payment,
//     required this.totalPrice,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'date': date,
//       'pickupTime': pickupTime,
//       'telephone': telephone,
//       'payment': payment,
//       'totalPrice': totalPrice,
//     };
//   }

//   factory CheckoutForm.fromMap(Map<String, dynamic> map) {
//     return CheckoutForm(
//       date: map['date'] as String,
//       pickupTime: map['pickupTime'] as String,
//       telephone: map['telephone'] as String,
//       payment: map['payment'] as String,
//       totalPrice: map['totalPrice'] as double,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CheckoutForm.fromJson(String source) =>
//       CheckoutForm.fromMap(json.decode(source) as Map<String, dynamic>);
// }

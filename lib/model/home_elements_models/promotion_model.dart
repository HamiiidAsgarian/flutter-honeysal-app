// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Promotion {
  String title;
  String message;
  String code;
  String imageUrl;

  Promotion({
    required this.title,
    required this.message,
    required this.code,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'message': message,
      'code': code,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      title: map['title'] as String,
      message: map['message'] as String,
      code: map['code'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Promotion.fromJson(String source) =>
      Promotion.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class IconInfo {
  final String imageUrl;
  final String title;
  IconInfo({
    required this.imageUrl,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'title': title,
    };
  }

  factory IconInfo.fromMap(Map<String, dynamic> map) {
    return IconInfo(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IconInfo.fromJson(String source) =>
      IconInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}

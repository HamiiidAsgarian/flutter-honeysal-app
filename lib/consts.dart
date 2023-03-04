import 'package:flutter/material.dart';

class AppConst {
  static const double appHorizontalPadding = 20;

  static const Color burnedOrange = Color(0xFF977e3b);

  static const Color mainOrange = Color(0xFFffc529);
  static const Color lightOrange = Color(0xFFffe8a9);
  static const Color whiteOrange = Color(0xFFfff9e9);

  static const Color borderGrey = Color(0xFFEBEBEB);
  static const Color iconGrey = Color(0xFF8a8d91);

  static const Color mainGrey = Color(0xFFb3b4b4);
  static const Color mainWhite = Color(0xFFFFFFFF);

  static const Color mainGreen = Color.fromARGB(255, 81, 255, 0);
  static const Color mainBlue = Color.fromARGB(255, 0, 162, 255);

  static const TextStyle barandTextStyle = TextStyle(
      fontFamily: "Rooster",
      fontSize: 50,
      color: mainWhite,
      fontWeight: FontWeight.w500);

  static const TextStyle normalDescriptionStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static const TextStyle chipTextStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w500);

  static const TextStyle detailTitleStyle = TextStyle(
      height: 1, //For no space to the top of the box
      fontFamily: "Poppins",
      fontSize: 35,
      color: Colors.black,
      fontWeight: FontWeight.w800);
  static const TextStyle detailPriceStyle = TextStyle(
      // height: 1, //For no space to the top of the box
      fontFamily: "Poppins",
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w800);

  static const TextStyle sectionTitleStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.w700);
  static const TextStyle productTitleStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w800);
  static const TextStyle productSubtitleStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      color: Colors.grey,
      fontWeight: FontWeight.w500);
  static const TextStyle smallTextStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 13,
      color: Colors.grey,
      fontWeight: FontWeight.w500);
}

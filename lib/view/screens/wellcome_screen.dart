import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/screens/signup_screen.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  static String route = "/StartScreen";

  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConst.appHorizontalPadding, vertical: 25),
      decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(83, 150, 150, 150), BlendMode.hardLight),
              image: AssetImage("asset/images/signBack.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 75),
            child: Align(
              alignment: Alignment.center,
              child: Text("Hamiiid Bakery", style: AppConst.barandTextStyle),
            ),
          ),
          Column(
            children: [
              Text(
                  "When it comes to sweets, you can sence the feeling of a good product from your screen",
                  style: AppConst.detailTitleStyle
                      .copyWith(color: AppConst.mainWhite)),
              const SizedBox(height: 20),
              MainButton(
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                },
                title: "log in",
              ),
              const SizedBox(height: 20),
              MainButton(
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignUpScreen())));
                },
                title: "Create account",
                fillColor: AppConst.mainWhite,
                titleColor: AppConst.burnedOrange,
              )
            ],
          )
        ],
      ),
    ));
  }
}

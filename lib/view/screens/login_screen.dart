import 'package:bakery/consts.dart';
import 'package:bakery/core/app_initializer.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/screens/navigation_container_screen.dart';
import 'package:bakery/view/screens/signup_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utilities.dart';
// import '../../model/core_models/order_model.dart';
// import '../../model/core_models/product_model.dart';
import '../../model/home_elements_models/home_model.dart';

class LoginScreen extends StatelessWidget {
  static String route = "/LoginScreen";

  const LoginScreen({super.key});

  static final ValueNotifier<bool> _rememberMeCheckBox = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    local() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('Authenticated', true);
    }

    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: AppConst.appHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Wellcome back!", style: AppConst.detailPriceStyle),
            const Text("Log in to continue",
                style: AppConst.productSubtitleStyle),
            const SizedBox(height: 10),
            const CustomTextInput(
              title: 'Email',
              hint: "Enter your email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            const CustomTextInput(
              title: 'Password',
              hint: "Enter your password",
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SizedBox(
                    width: 18 * 1.2,
                    child: Transform.scale(
                      scale: 1.2,
                      child: ValueListenableBuilder(
                        valueListenable: _rememberMeCheckBox,
                        builder: (context, value, child) => Checkbox(
                            visualDensity: VisualDensity.compact,
                            value: value,
                            onChanged: (e) {
                              _rememberMeCheckBox.value =
                                  !_rememberMeCheckBox.value;
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("Remember me",
                      style: AppConst.productSubtitleStyle
                          .copyWith(color: AppConst.mainBlack))
                ]),
                TextButton(
                    onPressed: () {},
                    child: Text("Forget password?",
                        style: AppConst.productSubtitleStyle
                            .copyWith(color: AppConst.burnedOrange)))
              ],
            ),
            const SizedBox(height: 20),
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "By Continuing you agree to our ",
                  style: AppConst.smallTextStyle),
              TextSpan(
                  text: "terms of service",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.burnedOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      //on tap code here, you can navigate to other page or URL
                    }),
              const TextSpan(text: " and ", style: AppConst.smallTextStyle),
              TextSpan(
                  text: " Privacy Policy",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.burnedOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      //on tap code here, you can navigate to other page or URL
                    })
            ])),

            const SizedBox(height: 20),
            MainButton(
                onPress: () {
                  AppInitializer appInit = AppInitializer();
                  showLoadingDialogPanel(context, "Sending data");
                  // logInDataPost(false)

                  appInit.getApiData(context).then((value) {
                    // if (value["status"] == 200) {
                    if (value != []) {
                      appInit.updateTheState(context);
                      if (_rememberMeCheckBox.value) {
                        local();
                      }
                      Navigator.pop(context);

                      // List<Product> cartData = appInit.appdata.cart;
                      // List<Product> favoriteData = appInit.appdata.favorites;
                      // List<Order> orderData = appInit.appdata.orders;
                      HomePageElements homeElements =
                          appInit.appdata.homePageElements;

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NavScreen(
                                    // cartData: [],
                                    // favoriteData: favoriteData,
                                    homeElements: homeElements,
                                    // orderData: orderData,
                                  ))));
                    } else {
                      Navigator.pop(context);
                      // showLoadingDialogPanel(context, "Login failed");
                    }
                  });
                },
                title: "Log in"),
            // const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 5,
              child: const Divider(
                thickness: 2,
                height: 1,
                color: AppConst.borderGrey,
              ),
            ),
            // MainButton(
            //   onPress: () {},
            //   title: "Login with google",
            //   fillColor: const Color.fromARGB(255, 255, 60, 0),
            // ),
            // const SizedBox(height: 20),
            Center(
              child: Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "Don't have an account yet? ",
                    style: AppConst.smallTextStyle),
                TextSpan(
                    text: "Sign up",
                    style: AppConst.smallTextStyle
                        .copyWith(color: AppConst.burnedOrange),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignUpScreen())));
                      }),
              ])),
            ),
          ],
        ),
      ),
    );
  }

  // raw(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => Center(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: Colors.white,
  //               ),
  //               width: 50,
  //               height: 50,
  //               child: const Center(
  //                 child: CupertinoActivityIndicator(),
  //               ),
  //             ),
  //           ));
  // }
}

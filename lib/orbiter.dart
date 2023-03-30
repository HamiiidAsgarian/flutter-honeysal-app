import 'package:bakery/consts.dart';
import 'package:bakery/core/app_initializer.dart';
import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/screens/navigation_container_screen.dart';
import 'package:bakery/view/screens/wellcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'model/core_models/order_model.dart';
// import 'model/core_models/product_model.dart';
// import 'model/home_elements_models/home_model.dart';

class Orbiter extends StatelessWidget {
  static String route = "/";

  const Orbiter({super.key});

  Future<List<bool>> _isFirstTimeGen(BuildContext context) async {
    final SharedPreferences local = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    final bool isFirstTime = (local.getBool('firstTime') ?? true);
    final bool isAuthenticated = (local.getBool('Authenticated') ?? false);

    local.setBool("firstTime", false);
    return [isFirstTime, isAuthenticated];
  }

  @override
  Widget build(BuildContext context) {
    _isFirstTimeGen(context).then((navigatorData) {
      if (navigatorData[0] == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WellcomeScreen()));
      } else if (navigatorData[0] == false && navigatorData[1] == false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        AppInitializer appInit = AppInitializer();
        // logInDataPost(false)

        appInit.getApiData(context).then((value) {
          // if (value["status"] == 200) {
          if (value != []) {
            appInit.updateTheState(context);

            // List<Product> cartData = appInit.appdata.cart;
            // List<Product> favoriteData = appInit.appdata.favorites;
            // List<Order> orderData = appInit.appdata.orders;
            // HomePageElements homeElements = appInit.appdata.homePageElements;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const NavScreen(initScreen: 0)),
              ),
            );
          }
        });
      }
    });
    return Scaffold(
        backgroundColor: AppConst.whiteOrange,
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Stack(children: [
              Center(child: Image.asset('asset/images/logo.png')),
              const Center(child: CupertinoActivityIndicator())
            ]),
          ),
        ));
  }
}

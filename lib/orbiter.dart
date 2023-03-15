import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/screens/navigation_container_screen.dart';
import 'package:bakery/view/screens/wellcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orbiter extends StatelessWidget {
  static String route = "/";

  const Orbiter({super.key});

  Future<List<bool>> _isFirstTimeGen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));

    final SharedPreferences local = prefs;
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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NavScreen()));
      }
    });
    return const Scaffold(
        body: Center(
      child: CupertinoActivityIndicator(),
    ));
  }
}

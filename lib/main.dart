import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/screens/orders_screen.dart';
import 'package:bakery/view/screens/start_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyScrollBehavior(),
        theme: ThemeData(
            fontFamily: "Poppins", scaffoldBackgroundColor: Colors.white),
        home: const LoginScreen());
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

import 'package:bakery/view/screens/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyScrollBehavior(),
        theme: ThemeData(
            fontFamily: "Poppins", scaffoldBackgroundColor: Colors.white),
        home: const HomeScreen());
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

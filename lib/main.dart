// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/view/screens/all_products_screen.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/screens/details_screen.dart';
import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/screens/orders_screen.dart';
import 'package:bakery/view/screens/profile_screen.dart';
import 'package:bakery/view/screens/start_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/screens/cart_screen.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/navigation_container_screen.dart';
import 'view/screens/pickup_screen.dart';
import 'view/screens/signup_screen.dart';
import 'view_model/products_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: MaterialApp(
          routes: {
            NavScreen.route: (context) => const NavScreen(),
            HomeScreen.route: (context) => const HomeScreen(),
            AllProductsScreen.route: (context) => const AllProductsScreen(),
            DetailsScreen.route: (context) => const DetailsScreen(),
            CartScreen.route: (context) => const CartScreen(),
            CheckoutScreen.route: (context) => const CheckoutScreen(),
            PickupScreen.route: (context) => const PickupScreen(),
            OrderScreen.route: (context) => const OrderScreen(),
            StartScreen.route: (context) => const StartScreen(),
            LoginScreen.route: (context) => const LoginScreen(),
            SignUpScreen.route: (context) => const SignUpScreen(),
            ProfileScreen.route: (context) => const ProfileScreen(),
          },
          // home: AllProductsScreen(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyScrollBehavior(),
          theme: ThemeData(
              fontFamily: "Poppins", scaffoldBackgroundColor: Colors.white),
        ));
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

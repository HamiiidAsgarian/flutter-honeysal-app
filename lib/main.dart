// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bakery/orbiter.dart';
import 'package:bakery/view_model/cart_bloc.dart';
import 'package:bakery/view_model/favorite_bloc.dart';
import 'package:bakery/view_model/orders_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view_model/all_products_bloc.dart';

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
          // BlocProvider(
          //   create: (context) => DataBloc(),
          // ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
          BlocProvider(
            create: (context) => OrderBloc(),
          ),
          BlocProvider(
            create: (context) => FavoriteBloc(),
          ),
          BlocProvider(
            create: (context) => AllProductsBloc(),
          ),
        ],
        child: MaterialApp(
          // routes: {
          //   Orbiter.route: (context) => const Orbiter(),

          //   LoginScreen.route: (context) => const LoginScreen(),
          //   SignUpScreen.route: (context) => const SignUpScreen(),
          //   ProfileScreen.route: (context) => const ProfileScreen(),

          //   NavScreen.route: (context) => const NavScreen(),
          //   HomeScreen.route: (context) =>
          //       HomeScreen(data: HomePageElements(items: [])),
          //   // AllProductsScreen.route: (context) => const AllProductsScreen(),
          //   DetailsScreen.route: (context) =>
          //       DetailsScreen(item: Product.filled()),
          //   CartScreen.route: (context) => const CartScreen(),
          //   // CheckoutScreen.route: (context) => const CheckoutScreen(),
          //   // PickupScreen.route: (context) => const PickupScreen(),
          //   OrderScreen.route: (context) => const OrderScreen(),
          //   StartScreen.route: (context) => const StartScreen(),
          // },
          // home: AllProductsScreen(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyScrollBehavior(),
          theme: ThemeData(
              fontFamily: "Poppins", scaffoldBackgroundColor: Colors.white),

          home: const Orbiter(),
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

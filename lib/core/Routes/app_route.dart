import 'package:e_shop/features/auth/presentation/screens/login_screen.dart';
import 'package:e_shop/features/cart/presentation/screens/carts_screen.dart';
import 'package:e_shop/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:e_shop/features/products/presentation/screens/products_screen.dart';
import 'package:e_shop/features/splash_screen.dart';
import 'package:flutter/material.dart';

part 'app_route_names.dart';

abstract class AppRoute {
  static String mainRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case AppRouteName.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      case AppRouteName.productsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsScreen(),
        );
      case AppRouteName.productDetailsScreen:
        final argument = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetailsScreen(
            id: argument,
          ),
        );
      case AppRouteName.cartScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => CartScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
    }
  }
}

import 'package:e_shop/features/auth/presentation/screens/login_screen.dart';
import 'package:e_shop/features/products/presentation/screens/products_screen.dart';
import 'package:e_shop/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen while waiting for the authentication state
          return const SplashScreen();
        }

        if (snapshot.hasData) {
          // User is logged in, show HomePage
          return const ProductsScreen();
        } else {
          // User is not logged in, show LoginPage
          return const LoginScreen();
        }
      },
    );
  }
}

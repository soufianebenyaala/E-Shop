import 'package:e_shop/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Logo
          Image.asset(
            width: MediaQuery.of(context).size.width / 4,
            Assets.mlkLogo,
          ),

          /// Loader
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SpinKitFadingCircle(
              size: 24.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

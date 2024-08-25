import 'package:e_shop/core/Routes/app_route.dart';
import 'package:e_shop/core/theme/app_theme.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:e_shop/features/auth/presentation/screens/auth_wrapper.dart';
import 'package:e_shop/features/auth/presentation/screens/login_screen.dart';
import 'package:e_shop/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:e_shop/features/products/presentation/blocs/bloc/products_bloc.dart';
import 'package:e_shop/features/splash_screen.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    OverlaySupport.global(
      child: EShop(),
    ),
  );
}

class EShop extends StatelessWidget {
  const EShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.get<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.get<CartBloc>(),
        ),
        BlocProvider(
          create: (context) => di.get<ProductsBloc>()..add(GetProductsEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'E-Shop',
        theme: AppTheme.appLightTheme,
        darkTheme: AppTheme.appDarkTheme,
        themeMode: ThemeMode.system,
        home: AuthWrapper(),
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}

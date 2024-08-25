import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/services/http_service.dart';
import 'package:e_shop/features/auth/configure_auth_dependencies.dart';
import 'package:e_shop/features/cart/configure_products_dependencies.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:e_shop/features/product_details/configure_products_dependencies.dart';
import 'package:e_shop/features/products/configure_products_dependencies.dart';
import 'package:e_shop/firebase_options.dart';

final di = GetIt.instance;
Future<void> init() async {
  // initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);

  Hive.registerAdapter(CartProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  //! External
  final sharedPrefs = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => AppPreferences(sharedPrefs));
  di.registerLazySingleton(() => FirebaseAuth.instance);
  di.registerLazySingleton<HttpService>(() => HttpService());
  //! features
  //* Auth
  configureAuthDependencies(di: di);
  //* Products
  configureProductsDependencies(di: di);
  //* Products Details
  configureProductDetailsDependencies(di: di);
  //* Cart Details
  configureCartDependencies(di: di);
}

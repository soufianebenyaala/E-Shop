import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/services/http_service.dart';
import 'package:e_shop/features/auth/configure_auth_dependencies.dart';
import 'package:e_shop/features/product_details/configure_products_dependencies.dart';
import 'package:e_shop/features/products/configure_products_dependencies.dart';
import 'package:e_shop/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;
Future<void> init() async {
  // initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
}

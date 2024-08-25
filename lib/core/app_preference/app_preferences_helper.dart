import 'package:e_shop/features/cart/data/models/cart_model.dart';

abstract class AppPreferencesHelper {
  /// App Mode
  String getIsDarkModeEnabled();
  setIsDarkModeEnabled(String isDarkMode);

  /// Email
  String getLoginEmail();
  setLoginEmail(String email);

  /// Password
  String getLoginPwd();
  setLoginPwd(String password);

  /// accessToken
  String getToken();
  setToken(String accessToken);

  /// Cart
  CartModel? getCart();
  setCart(CartModel? cart);
}

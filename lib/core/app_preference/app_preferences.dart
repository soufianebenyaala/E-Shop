import 'dart:convert';

import 'package:e_shop/core/app_preference/app_preferences_helper.dart';
import 'package:e_shop/core/utils/enums/system_mode_enum.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences implements AppPreferencesHelper {
  late SharedPreferences _sharedPreferences;

  set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

  AppPreferences(SharedPreferences sharedPrefs) {
    _sharedPreferences = sharedPrefs;
    initSharedPrefs();
  }

  initSharedPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Access Token
  @override
  String getToken() {
    return _sharedPreferences.getString(prefKeyTokenData) ?? "";
  }

  @override
  setToken(String accessToken) {
    return _sharedPreferences.setString(prefKeyTokenData, accessToken);
  }

  @override
  String getIsDarkModeEnabled() {
    return _sharedPreferences.getString(prefKeyAppSystemMode) ??
        SystemModeEnums.light.name;
  }

  @override
  setIsDarkModeEnabled(String isDarkMode) {
    return _sharedPreferences.setString(prefKeyAppSystemMode, isDarkMode);
  }

  //Remember Me
  @override
  String getLoginEmail() {
    return _sharedPreferences.getString(prefKeyAppLoginEmail) ?? "";
  }

  @override
  setLoginEmail(String email) {
    _sharedPreferences.setString(prefKeyAppLoginEmail, email);
  }

  @override
  String getLoginPwd() {
    return _sharedPreferences.getString(prefKeyAppLoginPwd) ?? "";
  }

  @override
  setLoginPwd(String password) {
    _sharedPreferences.setString(prefKeyAppLoginPwd, password);
  }

  @override
  CartModel? getCart() {
    CartModel? cart;
    if (_sharedPreferences.getString(prefKeyCartData) != null) {
      cart = CartModel.fromMap(
          jsonDecode(_sharedPreferences.getString(prefKeyCartData)!));
    }
    return cart;
  }

  @override
  setCart(CartModel? cart) {
    if (cart != null) {
      _sharedPreferences.setString(prefKeyCartData, jsonEncode(cart.toMap()));
    } else {
      _sharedPreferences.remove(prefKeyCartData);
    }
  }

  @override
  bool isLoggedIn() {
    return _sharedPreferences.getBool(prefKeyIsLoggedIn) ?? false;
  }

  @override
  setLoggedIn(bool isLoggedIn) {
    _sharedPreferences.setBool(prefKeyIsLoggedIn, isLoggedIn);
  }

  static const prefKeyAppSystemMode = "PREF_KEY_APP_SYSTEM_MODE";
  static const prefKeyAppLoginEmail = "PREF_KEY_APP_LOGIN_EMAIL";
  static const prefKeyAppLoginPwd = "PREF_KEY_APP_LOGIN_PWD";
  static const prefKeyTokenData = "PREF_KEY_TOKEN_DATA";
  static const prefKeyIsLoggedIn = "PREF_KEY_IS_LOGGED_IN";
  static const prefKeyCartData = "PREF_KEY_CART_DATA";
}

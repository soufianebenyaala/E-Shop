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

  /// isLoggedIn
  bool isLoggedIn();
  setLoggedIn(bool isLoggedIn);
}

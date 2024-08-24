abstract class ValidationsUtils {
  /// Requierd validation
  static String? isRequired(value) {
    if (value is String?) {
      return value != null && value.isEmpty ? "Field can't be empty." : null;
    }
    return value != null ? "Field can't be empty." : null;
  }

  /// Requierd validation And Match Password
  static String? isRequiredAndMatchPassword(
      String? value, String? confirmPass) {
    return value != null && value.isEmpty
        ? "Field can't be empty."
        : value != confirmPass
            ? "Password must be same as above"
            : null;
  }

  /// Requierd validation And Match Password
  static String? isLessThenMaxHoursWorking(
      String? value, int timeSheetMaxHoursWorking) {
    return value != null &&
            int.tryParse(value) != null &&
            int.parse(value) > timeSheetMaxHoursWorking
        ? "$value > $timeSheetMaxHoursWorking"
        : null;
  }

  ///  Object Required
  static String? isObjectRequired(Object? object) {
    return object == null ? "Field can't be empty." : null;
  }

  /// Valid Email And Required
  static String? isValidEmailAndRequired(String? email) {
    return email != null && email.isEmpty
        ? "Field can't be empty."
        : email!.isValidEmail == false
            ? 'Valid email is required'
            : null;
  }

  /// Valid Email
  static String? isValidEmail(String? email) {
    return email == null
        ? null
        : email.isValidEmail == false
            ? 'Valid email is required'
            : null;
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

import 'package:intl/intl.dart';

abstract class Utils {
  static double calculatePriceAfterDiscount(
    double originalPrice,
    double discountPercentage,
  ) {
    double discountAmount = originalPrice * (discountPercentage / 100);
    double finalPrice = originalPrice - discountAmount;
    return double.parse(finalPrice.toStringAsFixed(2));
  }

  static String dateTimetoStringYearsMonthDay(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }
}

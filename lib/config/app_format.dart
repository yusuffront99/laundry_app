import 'package:intl/intl.dart';

class AppFormat {
  static String shortPrice(num number) {
    return NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    ).format(number);
  }

  static String longPrice(num number) {
    return NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    ).format(number);
  }

  static String justDate(DateTime dateTime) {
    return DateFormat('yyyy-mm-dd').format(dateTime);
  }

  /// source: DateTime | String\
  /// Monday, 2 Jan 23
  static String shortDate(source) {
    switch (source.runtimeType) {
      case String:
        return DateFormat('EEEE, d MMMM yy').format(DateTime.parse(source));

      case DateTime:
        return DateFormat('EEEE, d MMMM yy').format(DateTime.parse(source));

      default:
        return 'Not Valid';
    }
  }

  /// source: DateTime | String\
  /// Monday, 2 January 2033
  static String fullDate(source) {
    switch (source.runtimeType) {
      case String:
        return DateFormat('EEEE, d MMMM yyyy').format(DateTime.parse(source));

      case DateTime:
        return DateFormat('EEEE, d MMMM yyyy').format(DateTime.parse(source));

      default:
        return 'Not Valid';
    }
  }
}

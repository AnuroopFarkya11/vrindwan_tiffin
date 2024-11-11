import 'package:intl/intl.dart';

class DateTimeUtils {
  // Method to format DateTime to 'EEE, dd MMM' (e.g., 'Wed, 28 Oct')
  static String formatToDayMonth(DateTime dateTime) {
    final DateFormat formatter = DateFormat('EEE, dd MMM');
    return formatter.format(dateTime);
  }

  // Method to parse a string in 'EEE, dd MMM' format back to DateTime
  static DateTime? parseDayMonth(String dateStr) {
    try {
      final DateFormat formatter = DateFormat('EEE, dd MMM');
      return formatter.parse(dateStr);
    } catch (e) {
      print("Error parsing date string: $e");
      return null;
    }
  }

  // Method to get current DateTime formatted as 'EEE, dd MMM'
  static String getCurrentFormattedDate() {
    return formatToDayMonth(DateTime.now());
  }

  // Method to add days to a DateTime and return formatted as 'EEE, dd MMM'
  static String addDaysFormatted(DateTime dateTime, int days) {
    return formatToDayMonth(dateTime.add(Duration(days: days)));
  }

  // Method to subtract days from a DateTime and return formatted as 'EEE, dd MMM'
  static String subtractDaysFormatted(DateTime dateTime, int days) {
    return formatToDayMonth(dateTime.subtract(Duration(days: days)));
  }
}

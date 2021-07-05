import 'package:intl/intl.dart';

class Utils {
  static formatDate(DateTime date) {
    var newDate = DateFormat("dd MMM yyyy").format(date);
    return newDate;
  }
}

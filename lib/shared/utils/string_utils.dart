import 'package:intl/intl.dart';

class StringUtils {
  static String currency(String num) {
    final oCcy = NumberFormat("#,##0", "en_US");

    return 'IDR ${oCcy.format(double.parse(num))}';
  }
}
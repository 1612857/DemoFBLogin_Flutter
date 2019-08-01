import 'package:intl/intl.dart';

class NumberUtils {
  ///return a string of vnd currency from input number
  ///examples: input: 100000 => output: 100.000đ
  static String getCurrency(int number) {
    final formatCurrency = new NumberFormat.decimalPattern();
    final newString = formatCurrency.format(number);
    return "${newString}đ";
  }
}

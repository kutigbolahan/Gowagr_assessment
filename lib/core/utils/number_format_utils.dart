import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumberFormatUtil {
  static String formatAmount(String amount, String currency) {
    debugPrint('amount as balance received:: $amount');
    return NumberFormat.currency(name: currency).format(
      double.parse(amount),
    );
  }

  static String formatAmountWithDecimalPoints(String amount, String currency) {
    debugPrint('amount as balance received:: $amount');
    return NumberFormat.currency(name: currency,decimalDigits: 3).format(
      double.parse(amount),
    );
  } 

  static String formatAmountWithoutCurrency(String amount) {
    debugPrint('Amount received: $amount');
    return NumberFormat.decimalPattern().format(
      double.parse(amount),
    );
  }

  static double parseRepaymentAmount(double amount) {
    var flooredAmount = amount.floorToDouble();

    if (amount > flooredAmount) {
      return flooredAmount += 1;
    }
    return flooredAmount;
  }
}

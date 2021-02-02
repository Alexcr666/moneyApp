import 'package:flutter/material.dart';

class MyColors {
  static final Color primaryColor = hexToColor("#FF5002");
  static final Color secondaryColor = hexToColor("#F0A004");
  static final Color primaryTextColor = hexToColor("#2E2E2E");
  static final Color secondaryTextColor = hexToColor("#2E2E2E");
  static final Color greenColor = hexToColor("#46D198");
  static final Color blackColor = hexToColor("#2E2E2E");
  static final Color redColor = hexToColor("#FF5050");
  static final Color checkBoxColor = hexToColor("#00BF84");
  static final Color goldColor = hexToColor("#FFCA00");
  static final Color successColor = hexToColor("#00BF84");
  static final Color infoColor = hexToColor("#0084BF");
  static final Color forgotButtonColor = hexToColor("#DA1C43");
  static final Color warningColor = hexToColor("#BF8400");
  static final Color primaryButtonColor = hexToColor("#FF5002");
  static final Color secondaryButtonColor = hexToColor("#FF5002");
  static final Color primarySmallButtonColor = hexToColor("#FF5002");
  static final Color secondarySmallButtonColor = hexToColor("#FF5002");
  static final Color primarySmallButtonDisableColor = hexToColor("#B0B0B0");
  static final Color secondarySmallButtonDisableColor = hexToColor("#B0B0B0");

  /// Construct a color from a hex code string, of the format #RRGGBB.
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

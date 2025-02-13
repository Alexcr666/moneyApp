import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

class AlertWidget {
  message(BuildContext context, String message) {
    Flushbar(
      //title:  "",
      message: message.toString(),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}

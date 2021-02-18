import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:http/http.dart' as http;
import '../generated/l10n.dart';
import '../styles/style.dart';

Future<String> getIP() async {
  try {
    const url = 'https://api.ipify.org';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print(response.body);
      return null;
    }
  } catch (exception) {
    print(exception);
    return null;
  }
}

fuctionBack(context) {
  Navigator.pop(context);
}

final FocusNode nodeText1 = FocusNode();
final FocusNode nodeText2 = FocusNode();
final FocusNode nodeText3 = FocusNode();
final FocusNode nodeText4 = FocusNode();
final FocusNode nodeText5 = FocusNode();
final FocusNode nodeText6 = FocusNode();

/// Creates the [KeyboardActionsConfig] to hook up the fields
/// and their focus nodes to our [FormKeyboardActions].
KeyboardActionsConfig buildConfig(BuildContext context) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: Colors.grey[200],
    nextFocus: true,
    actions: [
      KeyboardActionsItem(
        focusNode: nodeText1,
      ),
      KeyboardActionsItem(focusNode: nodeText2, toolbarButtons: [
        (node) {
          return GestureDetector(
            onTap: () => node.unfocus(),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.close),
            ),
          );
        }
      ]),
      KeyboardActionsItem(
        focusNode: nodeText3,
        onTapAction: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Custom Action"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                );
              });
        },
      ),
      KeyboardActionsItem(
        focusNode: nodeText4,
        // displayCloseWidget: false,
      ),
      KeyboardActionsItem(
        focusNode: nodeText5,
        toolbarButtons: [
          //button 1
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "CLOSE",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
          //button 2
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "DONE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        ],
      ),
      KeyboardActionsItem(
        focusNode: nodeText6,
        footerBuilder: (_) => PreferredSize(
            child: SizedBox(
                height: 40,
                child: Center(
                  child: Text('Custom Footer'),
                )),
            preferredSize: Size.fromHeight(40)),
      ),
    ],
  );
}

inputNumber() {
  return <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(30),
  ];
}

inputNumberLength(int length) {
  return <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(length),
  ];
}

inputMaxLine() {
  return [
    new WhitelistingTextInputFormatter(RegExp("[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
    LengthLimitingTextInputFormatter(100),
  ];
}

String convertText(String encoded) {
  List<int> bytes = encoded.toString().codeUnits;
  return utf8.decode(bytes);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Future functionCheckInternet(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

Future functionCheckInternetMessage(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

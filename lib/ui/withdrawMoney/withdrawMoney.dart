import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:pattern_formatter/numeric_formatter.dart';

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class withdrawMoneyPage extends StatefulWidget {
  @override
  _withdrawMoneyPageState createState() => _withdrawMoneyPageState();
}

class _withdrawMoneyPageState extends State<withdrawMoneyPage> {
  int _groupValue = -1;
  int _radioValue = 0;
  double _result = 0.0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _result = 0;
          break;
        case 1:
          _result = 0;
          break;
        case 2:
          _result = 0;
          break;
      }
    });
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      //contentPadding: EdgeInsets.all(0),
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppbar(context, AppLocalizations.of(context).withdrawmoney),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        AppLocalizations.of(context).withdrawmonewith,
                        style: styleText(20, AppColors.primaryColor, true),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Container(
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              blurRadius: 24.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                4.0, // Move to right 10  horizontally
                                4.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Container(
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        new Radio(
                                          value: 0,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).merchant,
                                          style: styleText(
                                              17, Colors.black, false),
                                        ),
                                        new Radio(
                                          value: 1,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).banks,
                                          style: styleText(
                                              17, Colors.black, false),
                                        ),
                                        new Radio(
                                          value: 2,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).partner,
                                          style: styleText(
                                              17, Colors.black, false),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "CAD",
                                          style: styleText(
                                              20, AppColors.primaryColor, true),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Container(
                                            //padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                                focusNode: nodeText1,
                                                inputFormatters: [
                                                  ThousandsFormatter()
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                validator: (value) {
                                                  if (value.trim().isEmpty) {
                                                    return AppLocalizations.of(
                                                            context)
                                                        .complete;
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    decorationTextfield1(
                                                        "CAD")),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(assetsSeparator,
                                            height: 65),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)
                                                          .totalfee +
                                                      " :",
                                                  style: styleText(
                                                      19,
                                                      AppColors.primaryColor,
                                                      true),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "3.75 CAD",
                                                  style: styleText(
                                                      20, Colors.black, true),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)
                                                          .youwillreceived +
                                                      ":",
                                                  style: styleText(
                                                      19,
                                                      AppColors.primaryColor,
                                                      true),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  " 146.25 CAD",
                                                  style: styleText(
                                                      20, Colors.black, true),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                margin: EdgeInsets.only(left: 40, right: 40),
                                child: widgetButtonColor(
                                    AppLocalizations.of(context).scanmerchantqr,
                                    AppColors.greenColor2,
                                    Colors.white))),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          shape,
                          height: 270,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .pleasecompleteinformation,
                                style: styleText(17, Colors.white, false),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

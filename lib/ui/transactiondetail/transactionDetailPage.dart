import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class transactionDetailPage extends StatefulWidget {
  @override
  _transactionDetailState createState() => _transactionDetailState();
}

class _transactionDetailState extends State<transactionDetailPage> {
  int _groupValue = -1;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  Widget widgetAppbar() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 35,
              color: AppColors.primaryColor),
          Container(
            width: double.infinity,
            height: 60,
            color: AppColors.primaryColor,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    )),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "Transaction detail",
                  style: styleText(18, Colors.white, false),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          // widgetCardReports(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                color: AppColors.primaryColor,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                // color: Colors.blue,
                width: double.infinity,
                height: 80,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF487AC3),
                        const Color(0xFF4969B6),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Adngel Mendoza",
                        style: styleText(18, Colors.white, true),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(child: widgetAppbar()),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              widgetOptionDetailReport(),
                              Container(
                                height: 40,
                                width: 2,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          widgetCardDetailsRepor("----"),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              widgetOptionDetailReport(),
                              Container(
                                height: 40,
                                width: 2,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          widgetCardDetailsRepor("----"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "BANK ACCOUNT",
                        style: styleText(19, AppColors.primaryColor, false),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account number: 987654321",
                            style: styleText(17, Colors.grey, false),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Account type: Savings",
                            style: styleText(17, Colors.grey, false),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Partner name: Rafael Alfonso Bautista Plata",
                            style: styleText(17, Colors.grey, false),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: widgetButtonColorIcon(
                        "Select image",
                        AppColors.primaryColor,
                        Colors.white,
                      )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:custom_switch/custom_switch.dart';
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

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class codeQrPage extends StatefulWidget {
  @override
  _codeQrPageState createState() => _codeQrPageState();
}

class _codeQrPageState extends State<codeQrPage> {
  String _dropdownValueCountry = 'Card';

  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Card'];
  List code = new List();

  int _groupValue = -1;
  bool status = false;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      //contentPadding: EdgeInsets.all(0),
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
  refresh(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Stack(
                  children: [
                    Image.asset(
                      shape,
                      height: 270,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Julián camilo Naranjo",
                  style: styleText(21, Colors.black, true),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context).enteryourpassword,
                  style: styleText(18, Colors.grey, false),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                   code.length >= 1?widgetEditedQr(code[0] , context) :widgetEditedQr("" , context) ,
                    code.length >= 2?widgetEditedQr(code[1] , context) :widgetEditedQr("" , context) ,

                    code.length >= 3?widgetEditedQr(code[2] , context) :widgetEditedQr("" , context) ,

                    code.length >= 4?widgetEditedQr(code[3] , context) :widgetEditedQr("" , context) ,


                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  child: Container(
                    width: double.infinity,
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
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          if(code.length < 4) {
                                           code.add("1");
                                          }
                                          refresh();
                                        },
                                        child: widgetButtonQr("1", context)),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          if(code.length < 4) {
                                            code.add("2");
                                          }
                                          refresh();
                                        },
                                        child: widgetButtonQr("2", context)),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("3", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("4", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("5", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("6", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("7", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("8", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("9", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    widgetButtonQr("0", context),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    code.removeAt(code.length-1);
                                    refresh();
                                  },
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.only(right: 40),
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context).forgotPassword,
                  style: styleText(18, Colors.white, false),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context).itsnotyou,
                  style: styleText(18, Colors.white, false),
                ),
              ],
            ),
          ],
        ));
  }
}

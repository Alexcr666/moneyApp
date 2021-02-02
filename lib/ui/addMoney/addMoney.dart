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

import 'package:pattern_formatter/numeric_formatter.dart';

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class addMoneyPage extends StatefulWidget {
  @override
  _addMoneyPageState createState() => _addMoneyPageState();
}

class _addMoneyPageState extends State<addMoneyPage> {
  bool status = false;
  String _dropdownValueCountry = 'Country';

  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Country'];

  int _groupValue = -1;
  String buttonText= "Scan QR";

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
     // contentPadding: EdgeInsets.all(0),
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  double _result = 0.0;

  // state variable
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          buttonText =  AppLocalizations.of(context).scanqr;
          _result = 0;
          break;
        case 1:
          buttonText = AppLocalizations.of(context).addFromBankAccount;
          _result = 0;
          break;
        case 2:
          buttonText = AppLocalizations.of(context).saveaccount;
          _result = 0;
          break;
      }
    });
  }

  Widget widgetPartner() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: decorationContainer(),
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: _dropdownValueCountry,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String data) {
              setState(() {
                _dropdownValueCountry = data;
              });
            },
            items: _spinnerItemsCountry
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: decorationContainer(),
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: _dropdownValueCountry,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String data) {
              setState(() {
                _dropdownValueCountry = data;
              });
            },
            items: _spinnerItemsCountry
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Container(
          decoration: decorationContainer(),
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: _dropdownValueCountry,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String data) {
              setState(() {
                _dropdownValueCountry = data;
              });
            },
            items: _spinnerItemsCountry
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        Row(
          children: [
            CustomSwitch(
              activeColor: AppColors.primaryColor,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
            SizedBox(width: 20,),

            Text(
              AppLocalizations.of(context).sendotherbank,
              style: styleText(17, Colors.grey, false),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            CustomSwitch(
              activeColor: AppColors.primaryColor,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
            SizedBox(width: 20,),

            Text(
              AppLocalizations.of(context).swichcurrency,
              style: styleText(17, Colors.grey, false),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            SizedBox(
              width: 0,
            ),
            Text(
              "ECD",
              style: styleText(20, AppColors.primaryColor, true),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    focusNode: nodeText1,
                    inputFormatters: [ThousandsFormatter()],
                    keyboardType: TextInputType.number,
                    //inputFormatters:  inputNumber(),
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value
                          .trim()
                          .isEmpty) {
                        return AppLocalizations().completeInformation;
                      }
                      return null;
                    },
                    decoration: decorationTextfield1( AppLocalizations.of(context).ammouttobuy)),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                widgetOptionDetailReportIcon(),
                Container(height: 30,width: 2,color: AppColors.primaryColor,),
                widgetOptionDetailReportIcon(),
                Container(height: 30,width: 2,color: AppColors.primaryColor,),
                widgetOptionDetailReportIcon(),
              ],
            ),


            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).calculateRate,
                      style: styleText(18, AppColors.primaryColor, true),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "362.0087 ECD",
                      style: styleText(18, Colors.black, true),
                    ),
                  ],
                ),
                Container(height: 40),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).totalfee,
                      style: styleText(18, AppColors.primaryColor, true),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "1.765 ECD",
                      style: styleText(18, Colors.black, true),
                    ),
                  ],
                ),
                Container(height: 40),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).youwillpay,
                      style: styleText(18, AppColors.primaryColor, true),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "356.200.965 COP",
                      style: styleText(18, Colors.black, true),
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
    );
  }

  Widget widgetBank() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: decorationContainer(),
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: _dropdownValueCountry,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String data) {
              setState(() {
                _dropdownValueCountry = data;
              });
            },
            items: _spinnerItemsCountry
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 0,
            ),
            Text(
              "CAD",
              style: styleText(20, AppColors.primaryColor, true),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    focusNode: nodeText1,
                    inputFormatters: [ThousandsFormatter()],
                    keyboardType: TextInputType.number,
                    //inputFormatters:  inputNumber(),
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value
                          .trim()
                          .isEmpty) {
                        return "Complete";
                      }
                      return null;
                    },
                    decoration: decorationTextfield1("CAD")),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(child: SizedBox(),),
            widgetOptionDetailReportIcon(),
            SizedBox(width: 5,),
            Text(
              AppLocalizations.of(context).youwillreceived+": ",
              style: styleText(18, AppColors.primaryColor, true),
            ),
            SizedBox(width: 5,),
            Text(
              "150.00 CAD",
              style: styleText(18, Colors.black, true),
            ),
            Expanded(child: SizedBox(),),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

  Widget widgetMerchant() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 0,
            ),
            Text(
              "CAD",
              style: styleText(20, AppColors.primaryColor, true),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                //padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    focusNode: nodeText1,
                    inputFormatters: [ThousandsFormatter()],
                    keyboardType: TextInputType.number,
                    //inputFormatters:  inputNumber(),
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value
                          .trim()
                          .isEmpty) {
                        return AppLocalizations.of(context).completeInformation;
                      }
                      return null;
                    },
                    decoration: decorationTextfield1("CAD")),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Column(
              children: [
                //SizedBox(height: 20,),
                widgetOptionDetailReportIcon(),
                Container(height: 30,width: 2,color: AppColors.primaryColor,),
                widgetOptionDetailReportIcon(),

              ],
            ),


            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).calculateRate,
                      style: styleText(18, AppColors.primaryColor, true),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "362.0087 ECD",
                      style: styleText(18, Colors.black, true),
                    ),
                  ],
                ),
                Container(height: 40),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).totalfee,
                      style: styleText(18, AppColors.primaryColor, true),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "1.765 ECD",
                      style: styleText(18, Colors.black, true),
                    ),
                  ],
                ),
                Container(height: 40),

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppbar(context,  AppLocalizations.of(context).addmoney),
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
                        AppLocalizations.of(context).addmoney,
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
                                              16, Colors.black, false),
                                        ),
                                        new Radio(
                                          value: 1,

                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).banks,
                                          style: styleText(
                                              16, Colors.black, false),
                                        ),
                                        new Radio(
                                          value: 2,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).partner,
                                          style: styleText(
                                              16, Colors.black, false),
                                        ),

                                        /*  Container(
                                width: 140,
                                child: _myRadioButton(
                                      title: "Merchant",
                                      value: 0,
                                      onChanged: (newValue) => setState(() => _groupValue = newValue),
                                    ),
                              ),*/
                                      ],
                                    ),
                                    _radioValue != 0
                                        ? SizedBox()
                                        : widgetMerchant(),
                                    _radioValue != 1
                                        ? SizedBox()
                                        : widgetBank(),
                                    _radioValue != 2
                                        ? SizedBox()
                                        : widgetPartner()
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
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {

                         switch( _radioValue){

                           case 0:
                             Navigator.pushNamed(context, qrRoute,
                                 arguments: 'Data from home');
                             break;
                           case 1:
                             alertConfirmationBank(context);
                             break;
                           case 2:
                             alertConfirmation(context);
                             break;

                         }

                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 40, right: 40),
                                child: widgetButtonColor(buttonText,
                                    AppColors.greenColor2, Colors.white))),
                        SizedBox(
                          height: 40,
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
                                AppLocalizations.of(context).pleasecompleteinformation,
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

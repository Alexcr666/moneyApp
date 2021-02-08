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
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class qrPage extends StatefulWidget {
  @override
  _qrPageState createState() => _qrPageState();
}

class _qrPageState extends State<qrPage> {
  String _dropdownValueCountry = 'Card';

  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Card'];

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: widgetAppbar(context, "QR"),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
              Icon(Icons.keyboard,color: Colors.white,size: 30,),
              SizedBox(width: 20,),
              Text(
                AppLocalizations.of(context).manuallyinput,
                style: styleText(17, Colors.white, false),
              ),
                Expanded(child: SizedBox()),
            ],),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
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
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.keyboard_arrow_up_rounded,size: 40,),

                            GestureDetector(
                              onTap: (){
                                AppLock.of(context).didUnlock();
                              },
                              child: Text(
                                AppLocalizations.of(context).myqrcode,
                                style: styleText(20, Colors.black, true),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Jhon Smith",
                              style:
                                  styleText(15, AppColors.primaryColor, false),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "189.01",
                              style:
                                  styleText(25, AppColors.primaryColor, true),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              AppLocalizations.of(context).yourbalance,
                              style:
                                  styleText(15, AppColors.primaryColor, false),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 130,
                              height: 130,
                              margin: EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                assetsQrCode,
                                color: Colors.black,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox(),),
                                Container(
                                  width: 25,
                                  height: 25,
                                  margin: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    assetsQrCode,
                                    color: Colors.black,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                CustomSwitch(
                                  activeColor:AppColors.primaryColor,
                                  value: status,
                                  onChanged: (value) {
                                    print("VALUE : $value");
                                    setState(() {
                                      status = value;
                                    });
                                  },
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  margin: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    assetsQrCode,
                                    color: Colors.black,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(child: SizedBox(),),
                              ],
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              AppLocalizations.of(context).ifbalancedescription,
                              style:
                              styleText(15, AppColors.primaryColor, false),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                            /* Container(
                                 width: 30,height: 30,
                                 margin: EdgeInsets.only(bottom: 20),
                                 child: CheckboxListTile(


                                            title: GestureDetector(
                                              onTap: (){
                                                alertTerms(context);
                                              },
                                              child: Text(
                                                "Accept terms and conditions",
                                                style: styleText(17, Colors.white, false),
                                              ),
                                            ),
                                            value: checkSignUp,
                                            onChanged: (newValue) {
                                              checkSignUp = newValue;
                                              setState(() {});
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                               ),*/
                              SizedBox(width: 20,),



                              Flexible(
                                child: Container(

                                      decoration: decorationContainer(),
                                      padding: EdgeInsets.only(left: 20,right: 20),
                                      width: double.infinity,
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _dropdownValueCountry,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
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
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                              ),

                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

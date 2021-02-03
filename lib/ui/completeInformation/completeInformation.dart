import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/card/cardFavoriteUser.dart';
import 'package:ecloudatm/utils/card/cardOportunities.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;



class completeInformationUserPage extends StatefulWidget {
  @override
  _completeInformationUserPageState createState() =>
      _completeInformationUserPageState();
}

class _completeInformationUserPageState
    extends State<completeInformationUserPage> {

  String _dropdownValueCountry = 'Country';
  String _dropdownValueState = 'State';
  String _dropdownValueCity = 'City';
  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Country'];
  List<String> _spinnerItemsState = ['State'];
  List<String> _spinnerItemsCity = ['City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppbar(context, AppLocalizations.of(context).completeInformation),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Image.asset(
                      shape,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              // margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [

                  Text(
                    AppLocalizations.of(context).infouser,
                    style: styleText(20, Colors.black, true),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    AppLocalizations.of(context).pleasecompleteinformation,
                    style: styleText(20, Colors.black, true),
                  ),

                  Container(
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
                  SizedBox(height: 10,),


                  Container(
                    //padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return  AppLocalizations.of(context).complete;
                          }
                          return null;
                        },

                        decoration: decorationTextfield1("Id")),
                  ),

                  SizedBox(height: 10,),

                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, homeRoutes,
                            arguments: 'Data from home');
                      },
                      child: Container(
                          margin:
                          EdgeInsets.only(left: 20, right: 20),
                          child: widgetButtonColor( AppLocalizations.of(context).saveaccount,
                              AppColors.greenColor2, Colors.white))),

                ],
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

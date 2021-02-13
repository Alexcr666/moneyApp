import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/card/cardFavoriteUser.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class addYourBankPage extends StatefulWidget {
  @override
  _addYourBankPageState createState() => _addYourBankPageState();
}

class _addYourBankPageState extends State<addYourBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppbar(
            context, AppLocalizations.of(context).completeInformation),
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
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      AppLocalizations.of(context).findabank,
                      style: styleText(22, Colors.black, true),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      AppLocalizations.of(context).morebank,
                      style: styleText(16, Colors.grey, false),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return AppLocalizations.of(context).complete;
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: decorationTextfield1(
                            AppLocalizations.of(context).enterBankName)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      AppLocalizations.of(context).banks,
                      style: styleText(22, Colors.black, true),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.network(
                        "https://play-lh.googleusercontent.com/j1mCd56al-xogVFe_NIMgAqOmd4x9Ur15jDSZLrjmJFlozOgXt6N_YKxNSXaYpeHLXE",
                        height: 70,
                        width: 70,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Citibak", style: styleText(20, Colors.grey, false)),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

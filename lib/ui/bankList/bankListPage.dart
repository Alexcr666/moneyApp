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

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class bankListPage extends StatefulWidget {
  @override
  _bankListPageState createState() => _bankListPageState();
}

class _bankListPageState extends State<bankListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppbar(context, AppLocalizations.of(context).bankList),
        backgroundColor: Colors.white,

        body: Stack(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Expanded(child: SizedBox(),),
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
              margin: EdgeInsets.only(left: 20,right: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(

                    child: Text(
                      AppLocalizations.of(context).mybanks,
                      style:
                      styleText(18, Colors.black, true),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  widgetCardBank("Bancolombia","Bancolombia",context),
SizedBox(height: 20,),
                  Container(

                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).addPaymentmethod,
                          style:
                          styleText(18, AppColors.greenColor2, true),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.add_to_photos,size: 25,color:  AppColors.greenColor2,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  widgetCredit("Credit - Debit","Credit - Debit",context),

                ],
              ),
            ),
          ],
        ));
  }
}

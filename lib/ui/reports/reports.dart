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

class reportsPage extends StatefulWidget {
  @override
  _reportsPageState createState() => _reportsPageState();
}

class _reportsPageState extends State<reportsPage> {
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
      color: Colors.white
      ,child:
      Column(children: [
        Container(width: double.infinity,height: 35,color: AppColors.primaryColor),
        Container(width: double.infinity,height: 60,color: AppColors.primaryColor,child: Row(
          children: [

            SizedBox(width: 30,),
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
            Text(AppLocalizations.of(context).statements, style: styleText(18, Colors.white, false),),
            Expanded(
              child: SizedBox(),
            ),
            SizedBox(width: 30,),
            SizedBox(width: 30,),
          ],
        ),),
       // widgetCardReports(),
        Stack(
          children: [
            Container(width: double.infinity,height: 60,color: AppColors.primaryColor,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
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
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center ,//Center Row contents vertically,
                children: [
                  SizedBox(width: 20,),
                  Text("\u0024", style: styleText(30, Colors.white, true),),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18,),
                      Text(
                        AppLocalizations.of(context).availabreBalance,
                        style: styleText(14, Colors.white, false),
                      ),
                      SizedBox(height: 1,),
                      Text(
                        "189.86",
                        style: styleText(20, Colors.white, true),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox(),),

                  Column(
                    children: [
                      SizedBox(height: 18,),
                      Text(
                        "189.86",
                        style: styleText(20, Colors.white, true),
                      ),
                      Row(children: [
                        SizedBox(width: 20,),
                        Text(
                          "Holds",
                          style: styleText(15, Colors.white, false),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "0.00",
                          style: styleText(15, Colors.white, false),
                        ),
                        SizedBox(width: 20,),
                      ],)
                    ],
                  ),
                  SizedBox(width: 20,)
                ],
              ),
            ),
          ],
        )
      ],),);
  }
  Widget bodyPending() {

    return Column(
      children: [
        Container(width: double.infinity,child:
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(assetsSeparator, height: 120),

            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 widgetCardReports(context),
                widgetCardReports(context),

              ],),
            ),
          ],
        ),),
      ],
    );
  }

  Widget bodyDebig() {


    return Column(
      children: [
        Container(width: double.infinity,child:
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(assetsSeparator, height: 120),

            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widgetCardReportsDebit(context),
                  widgetCardReportsDebit(context),

                ],),
            ),

          ],
        ),),
      ],
    );
  }

  Widget bodyCredit() {
    return Column(
      children: [
        widgetCardReportsCredit(context),
        widgetCardReportsCredit(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [
        Material(child:  widgetAppbar()),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,


                bottom: new PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Column(
                    children: [
                      new Container(
                       // width: 200.0,
                        child: TabBar(
                          indicatorColor: AppColors.primaryColor,
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: Colors.grey,

                          tabs: [
                            Tab(
                              text: AppLocalizations.of(context).pending,
                            ),
                            Tab(
                              text: AppLocalizations.of(context).debit,
                            ),
                            Tab(
                              text: AppLocalizations.of(context).credit,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  bodyPending(),
                  bodyDebig(),
                  bodyCredit(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

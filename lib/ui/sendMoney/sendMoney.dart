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

import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class sendMoneyPage extends StatefulWidget {
  @override
  _sendMoneyPageState createState() => _sendMoneyPageState();
}

class _sendMoneyPageState extends State<sendMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppbar(context, "Send money"),
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
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        AppLocalizations.of(context).sendmoney,
                        style: styleText(18, Colors.black, true),
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Transform.rotate(
                                            angle: -math.pi / 4,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.greenColor2,
                                              size: 30,
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Container(
                                            //padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                                inputFormatters: [
                                                  ThousandsFormatter()
                                                ],
                                                focusNode: nodeText1,
                                                keyboardType:
                                                    TextInputType.number,
                                                // inputFormatters:  inputNumber(),
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
                                                        "250.00 CAD")),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            //padding: EdgeInsets.all(8.0),
                                            child: TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                validator: (value) {
                                                  if (value.trim().isEmpty) {
                                                    return AppLocalizations.of(
                                                            context)
                                                        .completeInformation;
                                                  }
                                                  return null;
                                                },
                                                decoration: decorationTextfield1(
                                                    "1234.abcd@hotmail.com")),
                                          ),
                                        ),
                                        Container(
                                          width: 25,
                                          height: 25,
                                          margin: EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                            assetsPeople,
                                            color: AppColors.primaryColor,
                                            allowDrawingOutsideViewBox: true,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          width: 25,
                                          height: 25,
                                          margin: EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                            assetsQrCode,
                                            color: AppColors.primaryColor,
                                            allowDrawingOutsideViewBox: true,
                                            fit: BoxFit.fill,
                                          ),
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
                                              .validuser,
                                          style: styleText(
                                              19, AppColors.greenColor2, true),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Reinaldo Verela",
                                          style:
                                              styleText(19, Colors.black, true),
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                        Image.asset(
                                          flag1,
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
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
                                              return AppLocalizations.of(
                                                      context)
                                                  .completeInformation;
                                            }
                                            return null;
                                          },
                                          decoration: decorationTextfield1(
                                              AppLocalizations.of(context)
                                                  .comments)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            widgetOptionDetailReportIcon(),
                                            Container(
                                              height: 35,
                                              width: 2,
                                              color: AppColors.primaryColor,
                                            ),
                                            widgetOptionDetailReportIcon(),
                                            Container(
                                              height: 35,
                                              width: 2,
                                              color: AppColors.primaryColor,
                                            ),
                                            widgetOptionDetailReportIcon(),
                                            Container(
                                              height: 35,
                                              width: 2,
                                              color: AppColors.primaryColor,
                                            ),
                                            widgetOptionDetailReportIcon(),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              widgetCardDetailsReporNoElevation(
                                                  AppLocalizations.of(context)
                                                          .exchangerate +
                                                      " :",
                                                  "0.77 USD"),
                                              Container(height: 10),
                                              widgetCardDetailsReporNoElevation(
                                                  AppLocalizations.of(context)
                                                          .totalfee +
                                                      " : ",
                                                  "6.25 CAD"),
                                              Container(height: 10),
                                              widgetCardDetailsReporNoElevation(
                                                  AppLocalizations.of(context)
                                                          .yoursend +
                                                      ": ",
                                                  "243.75 CAD"),
                                              Container(height: 10),
                                              widgetCardDetailsReporNoElevation(
                                                  "Rafael Plata" +
                                                      AppLocalizations.of(
                                                              context)
                                                          .received +
                                                      ": ",
                                                  "187.69 USD"),
                                            ],
                                          ),
                                        ),
                                      ],
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
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, homeRoutes,
                                  arguments: 'Data from home');
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 40, right: 40),
                                child: widgetButtonColor(
                                    AppLocalizations.of(context).accept,
                                    AppColors.greenColor2,
                                    Colors.white))),
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

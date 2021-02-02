import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
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

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class indentityVerificationPage extends StatefulWidget {
  @override
  _indentityVerificationPageState createState() =>
      _indentityVerificationPageState();
}

class _indentityVerificationPageState extends State<indentityVerificationPage> {
  int _step = 1;
  String _dropdownValueCountry = 'Country';
  String _dropdownValueState = 'State';
  String _dropdownValueCity = 'City';
  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Country'];
  List<String> _spinnerItemsState = ['State'];
  List<String> _spinnerItemsCity = ['City'];

  Widget widgetDone() {
    return Column(children: [
      SizedBox(
        height: 40,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "You're done",
          style: styleText(19, Colors.black, true),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Image.asset(
        "",
        height: 100,
        width: 100,
      ),
      SizedBox(
        height: 10,
      ),
      GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, homeRoutes,
            //  arguments: 'Data from home');
          },
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: widgetButtonColorIcon(
                  "Done", AppColors.greenColor2, Colors.white))),
      SizedBox(
        height: 40,
      )
    ]);
  }

  Widget widgetStep3() {
    return Column(children: [
      SizedBox(
        height: 40,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "Select a document to verity",
          style: styleText(19, Colors.black, true),
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
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey, // set border color
              width: 3.0), // set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // set rounded corner radius
        ),
        child: Row(
          children: [
            Image.asset(
              "",
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Text("My demo styling"),
          ],
        ),
      ),
      GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, homeRoutes,
            //  arguments: 'Data from home');
          },
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: widgetButtonColorIcon(
                  "Done", AppColors.greenColor2, Colors.white))),
      SizedBox(
        height: 40,
      )
    ]);
  }

  Widget widgetStep2() {
    return Column(children: [
      SizedBox(
        height: 40,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "National ID",
          style: styleText(19, Colors.black, true),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          "Colombia",
          style: styleText(16, Colors.grey, false),
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
        child: Text(
          "To get verified you will need to",
          style: styleText(16, Colors.grey, false),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, homeRoutes,
            //  arguments: 'Data from home');
          },
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: widgetButtonColorIcon(
                  "Start", AppColors.greenColor2, Colors.white))),
      widgetButtonLineIcon(
          "dd", AppColors.primaryColor, AppColors.primaryColor),
      SizedBox(
        height: 40,
      )
    ]);
  }

  Widget widgetStep1() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Let's verify your identity",
            style: styleText(19, Colors.black, true),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "To get verified you will need to",
            style: styleText(16, Colors.grey, false),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Text(
            "To get verified you will need to",
            style: styleText(16, Colors.grey, false),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              _step += 1;
              setState(() {});
              //Navigator.pushNamed(context, homeRoutes,
              //  arguments: 'Data from home');
            },
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: widgetButtonColor(
                    "Start", AppColors.greenColor2, Colors.white))),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget widgetStep1Options() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "We will need you to provide the followind document",
            style: styleText(19, Colors.black, true),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Container(
              child: Text(
                "Or",
                style: styleText(16, Colors.grey, false),
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            "To get verified you will need to",
            style: styleText(16, Colors.grey, false),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              _step += 1;
              setState(() {});
              //Navigator.pushNamed(context, homeRoutes,
              //  arguments: 'Data from home');
            },
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: widgetButtonColor(
                    "I confirm", AppColors.greenColor2, Colors.white))),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppbar(context, "Identity verification"),
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
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Image.asset(
                        assetsIconApp4,
                        height: 40,
                        //color: Colors.white,
                      ),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  _step != 1 ? SizedBox() : widgetStep1(),
                  _step != 2 ? SizedBox() : widgetStep2(),
                  _step != 3 ? SizedBox() : widgetStep3(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                          ),
                        ],
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "START",
                        style: styleText(12, Colors.grey, false),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.white,
                      )),
                      Text(
                        "DOCUMENT STEP",
                        style: styleText(12, Colors.grey, false),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.white,
                      )),
                      Text(
                        "BIOMETRIC STEP",
                        style: styleText(12, Colors.grey, false),
                      ),
                      Flexible(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "FINISH",
                        style: styleText(12, Colors.grey, false),
                      ),
                    ],
                  )
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
    _step = 1;
  }
}

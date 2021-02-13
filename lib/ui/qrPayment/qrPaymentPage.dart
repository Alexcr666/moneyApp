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

class qrPaymentPage extends StatefulWidget {
  @override
  _qrPaymentPageState createState() => _qrPaymentPageState();
}

class _qrPaymentPageState extends State<qrPaymentPage> {
  bool checkPromotions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppbar(context, "QR Payment"),
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //  height: 80,
                    child: Card(
                      elevation: 3,
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Available : \u0024 189.86",
                              style:
                                  styleText(23, AppColors.primaryColor, true),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Text(
                                  "Recharge money",
                                  style: styleText(
                                      18, AppColors.primaryColor, false),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: AppColors.primaryColor,
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Available promotions",
                          style: styleText(18, Colors.black, true),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //  height: 80,
                    child: Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 4.0, color: Colors.amber),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10) //                 <--- border radius here
                              ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "During the week November 23rd to 29th joint us to celebrate Thanksgiving. Bring your entire family and enjoy our amazing discounts:",
                                style: styleText(16, Colors.grey, false),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Promotion value",
                                style: styleText(
                                    18, AppColors.primaryColor, false),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\u0024 50.00",
                                style:
                                    styleText(33, AppColors.primaryColor, true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, right: 30),
                                child: GestureDetector(
                                    onTap: () {
                                      checkPromotions = !checkPromotions;
                                      setState(() {});
                                    },
                                    child: widgetRadio(
                                        "Apply promotion", checkPromotions)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.all_inbox_rounded,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Tips",
                          style: styleText(18, Colors.black, true),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        inputFormatters: inputNumber(),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Complete";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: decorationTextfield1('\u0024' '\u0024')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4.0, color: AppColors.greenColor2),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10) //                 <--- border radius here
                              ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "Total to pay :  \u0024 100.00",
                              style:
                                  styleText(24, AppColors.primaryColor, true),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          child: widgetButtonColor(
                              "Pay", AppColors.greenColor2, Colors.white))),
                  SizedBox(
                    height: 50,
                  ),
                  widgetButtonLine("Cancel"),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

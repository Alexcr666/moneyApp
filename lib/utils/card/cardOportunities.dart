import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget widgetTransactionsPartner(String title,BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertConfirmation(context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
      //  height: 80,
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("BUY", style: styleText(16, AppColors.primaryColor, true)),
                      SizedBox(width: 20,),


                      Text("000002035", style: styleText(16, AppColors.colorBlackOpacity, true)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("362,600.87 COP",
                      style: styleText(20, Colors.black, true)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("44.475 ECD",
                      style: styleText(16, AppColors.colorBlackOpacity, false)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("0.375 ECD",
                      style: styleText(16, AppColors.colorBlackOpacity, false)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("BBVA colombia",
                      style: styleText(16,AppColors.colorBlackOpacity, true)),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
              Expanded(child: SizedBox()),

              Column(
                children: [
                  Text("waiting for payment",
                      style: styleText(16, Colors.red, false)),
                  SizedBox(height: 10,),


                  Row(
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(width: 5,),
                      Text("00 - 01:41",
                          style: styleText(15, Colors.black, false)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorPartner,

                    ),
                    padding: EdgeInsets.all(13),
                    child:    Text("Detail",
                        style: styleText(16, Colors.white, false)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Widget widgetOportunitiesUser(String title,BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertConfirmation(context);
    },
    child: Container(
      //  height: 80,
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("BUY", style: styleText(16, AppColors.primaryColor, true)),
                      SizedBox(width: 20,),


                      Text("000002035", style: styleText(16, Colors.grey, true)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("362,600.87 COP",
                      style: styleText(20, Colors.black, true)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("44.475 ECD",
                      style: styleText(16, Colors.grey, false)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("0.375 ECD",
                      style: styleText(16, Colors.grey, false)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("BBVA colombia",
                      style: styleText(16,Colors.grey, true)),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
              Expanded(child: SizedBox()),

              Column(
                children: [
                 SizedBox(height: 30,),
                  Icon(Icons.check),
                  SizedBox(
                    height: 10,
                  ),
                  Text("00 - 01:41",
                      style: styleText(17, Colors.black, false)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

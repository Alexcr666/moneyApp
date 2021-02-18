import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/login/login_actions.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_actions.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';

import 'package:ecloudatm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

String dropdownValue = 'One';
String dropdowLanguage = 'English';
bool checkSignUp = false;

List<String> spinnerItems = ['One'];

showProgressGlobal(var context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    useRootNavigator: false,
    builder: (BuildContext contextAlert) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  child: Image.asset(assetsLoadingGif),
                  margin: EdgeInsets.only(right: 20),
                ),
                Text(
                  AppLocalizations.of(context).loading,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ],
            ),
          ));
    },
  );
}

Widget widgetOptionText2(String fecha) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              fecha.toLowerCase(),
            )),
        SizedBox(
          child: SizedBox(),
        ),
      ],
    ),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10) //
          //        <--- border radius here
          ),
    ),
  );
}

Widget widgetCardBank(String title, String asset, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      //  height: 80,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 25,
                )),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(title, style: styleText(18, Colors.black, true)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetCheckBox2(String title, bool state) {
  return Row(
    children: [
      state == true
          ? new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.blueAccent)
              ),
              child: Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
            )
          : new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
            ),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: styleText(18, Colors.grey, false),
      ),
    ],
  );
}

Widget widgetOptionDetailReportIcon() {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      border: Border.all(
          width: 3, color: AppColors.primaryColor, style: BorderStyle.solid),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Container(
      width: 30,
      height: 30,
      // margin: EdgeInsets.all(19),
      child: Center(child: Icon(Icons.check)),
    ),
  );
}

Widget widgetOptionDetailReport() {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      border: Border.all(
          width: 3, color: AppColors.primaryColor, style: BorderStyle.solid),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.all(19),
      child: SvgPicture.string(
        "",
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget widgetCardDetailsReporNoElevation(String title1, String title2) {
  return Container(
    // margin: EdgeInsets.only(bottom: 40),
    //  height: 80,
    child: Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                title1,
                style: styleText(18, AppColors.primaryColor, true),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title2,
                style: styleText(18, Colors.black, true),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}

Widget widgetCardDetailsRepor(String title) {
  return Container(
    // margin: EdgeInsets.only(bottom: 40),
    //  height: 80,
    child: Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: styleText(16, Colors.black, false),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetButtonLine(String title) {
  return new Container(
    width: double.infinity,
    //margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    ),
    child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
            child: Text(
          title,
          style: styleText(19, AppColors.primaryColor, true),
          textAlign: TextAlign.center,
        ))),
  );
}

Widget widgetButtonLineIcon(String title, Color color1, Color color2) {
  return new Container(
    width: double.infinity,
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      border: Border.all(color: color1),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    ),
    child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
            child: Row(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.eighteen_mp,
              color: color2,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: styleText(19, color2, false),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ))),
  );
}

Widget alertConfirmation(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.colorPartner,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Icon(
                                      Icons.check,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).confirmation,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).amount +
                                          ": ",
                                      style: styleText(
                                          17, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "356.200.965",
                                      style: styleText(17, Colors.black, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).yourfee +
                                          ": ",
                                      style: styleText(
                                          17, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "0.375ECD",
                                      style: styleText(17, Colors.black, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, transactionDetailPageRoute,
                                        arguments: 'Data from home');
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: widgetButtonColor(
                                          AppLocalizations.of(context).accept,
                                          AppColors.greenColor2,
                                          Colors.white))),
                              SizedBox(
                                height: 10,
                              ),
                              widgetButtonLine(
                                  AppLocalizations.of(context).decline),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

Widget alertConfirmationBank(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Icon(
                                      Icons.check,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).confirmation,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Citi bank",
                                      style: styleText(
                                          20, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).idbank +
                                          " : 125484-154745-453",
                                      style: styleText(
                                          20, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).totalfee +
                                          " : free",
                                      style: styleText(
                                          20, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    widgetOptionDetailReport(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).yourfee +
                                          " : ",
                                      style: styleText(
                                          20, AppColors.primaryColor, true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, transactionDetailPageRoute,
                                        arguments: 'Data from home');
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: widgetButtonColor(
                                          AppLocalizations.of(context).accept,
                                          AppColors.greenColor2,
                                          Colors.white))),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: widgetButtonLine(
                                      AppLocalizations.of(context).decline)),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

Widget alertTransactionDetailCredit(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    SvgPicture.asset(
                                      assetsClound,
                                      height: 20,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .creditdetails,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
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
                                      Container(
                                        height: 35,
                                        width: 2,
                                        color: AppColors.primaryColor,
                                      ),
                                      widgetOptionDetailReportIcon(),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        widgetCardDetailsRepor(
                                            AppLocalizations.of(context).you),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            "Reinaldo Verela"),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            "ID: 96-00001325 - 160720 "),
                                        Container(height: 5),
                                        widgetCardDetailsRepor("7/16/2020"),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            AppLocalizations.of(context)
                                                .transactionstype),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).totalCredit,
                                    style: styleText(
                                        16, AppColors.primaryColor, false),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "80.00 CAD",
                                style:
                                    styleText(25, AppColors.primaryColor, true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

Widget alertTransactionDetailDebito(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    SvgPicture.asset(
                                      assetsClound,
                                      height: 20,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).debitdetail,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
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
                                      Container(
                                        height: 35,
                                        width: 2,
                                        color: AppColors.primaryColor,
                                      ),
                                      widgetOptionDetailReportIcon(),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        widgetCardDetailsRepor(
                                            AppLocalizations.of(context).you),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            "Reinaldo Verela"),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            "ID: 96-00001325 - 160720 "),
                                        Container(height: 5),
                                        widgetCardDetailsRepor("7/16/2020"),
                                        Container(height: 5),
                                        widgetCardDetailsRepor(
                                            AppLocalizations.of(context)
                                                    .transactionstype +
                                                " :"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).totaldebit,
                                    style: styleText(
                                        15, AppColors.primaryColor, false),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "50.00 CAD",
                                style:
                                    styleText(30, AppColors.primaryColor, true),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

Widget alertTransactionDetail(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    SvgPicture.asset(
                                      assetsClound,
                                      height: 20,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .transactionsdetail,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
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
                                    Container(
                                      height: 35,
                                      width: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                    widgetOptionDetailReportIcon(),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      widgetCardDetailsRepor(
                                          AppLocalizations.of(context).you),
                                      Container(height: 5),
                                      widgetCardDetailsRepor("Reinaldo Verela"),
                                      Container(height: 5),
                                      widgetCardDetailsRepor(
                                          "ID: 96-00001325 - 160720 "),
                                      Container(height: 5),
                                      widgetCardDetailsRepor("7/16/2020"),
                                      Container(height: 5),
                                      widgetCardDetailsRepor(
                                          AppLocalizations.of(context)
                                                  .transactionstype +
                                              " :"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppLocalizations.of(context).bankAccount,
                              style:
                                  styleText(19, AppColors.primaryColor, false),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ": 987654321",
                                  style: styleText(17, Colors.grey, false),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  AppLocalizations.of(context).accountype +
                                      ": Savings",
                                  style: styleText(17, Colors.grey, false),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  AppLocalizations.of(context).partnerName +
                                      ": Rafael Alfonso Bautista Plata",
                                  style: styleText(17, Colors.grey, false),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: widgetButtonColorIcon(
                              AppLocalizations.of(context).selectImage,
                              AppColors.primaryColor,
                              Colors.white,
                            )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

Widget widgetRadio(String title, bool state) {
  return Row(
    children: [
      state == true
          ? new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.blueAccent)
              ),
              child: Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
            )
          : new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.blueAccent)),
            ),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: styleText(18, AppColors.primaryColor, true),
      ),
    ],
  );
}

Widget widgetCheckBox(String title, bool state) {
  return Row(
    children: [
      state == true
          ? new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.blueAccent)
              ),
              child: Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
            )
          : new Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
            ),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: styleText(18, AppColors.primaryColor, true),
      ),
    ],
  );
}

Widget widgetCredit(String title, String asset, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      //  height: 80,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(title, style: styleText(18, Colors.black, true)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetCardUserPartner(
    String title, String asset, BuildContext context, int position) {
  return GestureDetector(
    onTap: () {
      switch (position) {
        case 1:
          Navigator.pushNamed(context, becomePartnerRoute,
              arguments: 'Data from home');
          break;
        case 2:
          Navigator.pushNamed(context, reportsRoute,
              arguments: 'Data from home');
          break;
        case 3:
          Navigator.pushNamed(context, bankListRoute,
              arguments: 'Data from home');
          break;
        case 4:
          Navigator.pushNamed(context, identifityRoute,
              arguments: 'Data from home');
          break;
        case 7:
          Navigator.pushNamed(context, addYourBankRoute,
              arguments: 'Data from home');
          break;
        case 5:
          alertChangePasswordPin(context);
          break;
        case 6:
          Navigator.pushNamed(context, favoriteUserRoute,
              arguments: 'Data from home');
          break;
        case 9:
          Navigator.pushNamed(context, loginRoute, arguments: 'Data from home');
          break;
          Navigator.pushNamed(context, becomePartnerRoute,
              arguments: 'Data from home');
      }
    },
    child: Container(
      height: 80,
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            SvgPicture.string(
              asset,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
              width: 20,
              height: 20,
              color: AppColors.colorPartner,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title, style: styleText(17, Color(0xFF585858), true)),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetCardUser(
    String title, String asset, BuildContext context, int position) {
  return GestureDetector(
    onTap: () {
      switch (position) {
        case 1:
          Navigator.pushNamed(context, becomePartnerRoute,
              arguments: 'Data from home');
          break;
        case 2:
          Navigator.pushNamed(context, reportsRoute,
              arguments: 'Data from home');
          break;
        case 3:
          Navigator.pushNamed(context, bankListRoute,
              arguments: 'Data from home');
          break;
        case 4:
          Navigator.pushNamed(context, identifityRoute,
              arguments: 'Data from home');
          break;
        case 7:
          Navigator.pushNamed(context, addYourBankRoute,
              arguments: 'Data from home');
          break;
        case 5:
          alertChangePasswordPin(context);
          break;
        case 6:
          Navigator.pushNamed(context, favoriteUserRoute,
              arguments: 'Data from home');
          break;
        case 9:
          Navigator.pushNamed(context, loginRoute, arguments: 'Data from home');
          break;
          Navigator.pushNamed(context, becomePartnerRoute,
              arguments: 'Data from home');
      }
    },
    child: Container(
      height: 80,
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            SvgPicture.string(
              asset,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Text(title, style: styleText(17, Color(0xFF585858), true)),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetPromotionsHome(BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertwidgetPromotions(context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 140,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/05/26/14/53/sushi-354628_960_720.jpg')),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}

Widget alertwidgetPromotions(BuildContext context) {
  AlertDialog alert_segundario = AlertDialog(
    contentPadding: EdgeInsets.all(0.0),
    insetPadding: EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    content: Builder(
      builder: (contextBuilder) {
        // Get available height and width of the build area of this widget. Make a choice depending on the size.
        var width = MediaQuery.of(context).size.width;
        return Container(
          // height: height - 400,
          width: width,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              fuctionBack(context);
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                AppLocalizations.of(context).promotions,
                                style: styleText(19, Colors.white, false),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        "",
                        color: Colors.grey,
                        width: double.infinity,
                        height: 100,
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        "During the week November 23rd to 29th joint us to celebrate Thanksgiving. Bring your entire family and enjoy our amazing discounts: 1. two meals 5% 2. four meals 8% 3. six meals 10% 4. more than 8 meals 12%",
                        style: styleText(19, Colors.grey, false),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, qrPaymentRoute,
                                arguments: 'Data from home');
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: widgetButtonColor(
                                  AppLocalizations.of(context).redeemPromotions,
                                  AppColors.greenColor2,
                                  Colors.white))),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert_segundario;
      });
}

Widget widgetButtonQr(String title, BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Text(
      title,
      style: styleText(20, Colors.black, true),
    ),
  );
}

Widget widgetEditedQr(String code, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, homeRoutes2, arguments: 'Data from home');
    },
    child: Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
          //  ,
          //               <--- border radius here
        ),
      ),
      child: Text(
        code,
        style: styleText(16, Colors.black, true),
      ),
    ),
  );
}

Widget widgetBottom(BuildContext context, String url, String texto) {
  return Container(
    height: 90,
    child: Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              child: SvgPicture.string(
                svg_iwdk87,
                //width: 100,
                height: 45,
                color: AppColors.primaryColor,

                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,

            // margin: EdgeInsets.only(bottom: 70),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, qrRoute,
                    arguments: 'Data from home');
              },
              child: Container(
                // margin: EdgeInsets.only(left: 160,right: 160),
                width: 87.0,
                height: 87.0,
                child: SizedBox(
                  width: 87.0,
                  height: 87.0,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 87.0, 87.0),
                        size: Size(87.0, 87.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0x30b7d1ff),
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(7.7, 7.3, 72.0, 72.0),
                        size: Size(87.0, 87.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          svg_mkyh55,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(25.0, 26.5, 33.8, 33.8),
                        size: Size(87.0, 87.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Icon metro-qrcode' (shape)
                            SvgPicture.string(
                          svg_19yxbl,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget widgetNoData(String text1, String text2) {
  return Container(
    child: ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 20,
        ),
        /*Container(
          height: 50,
          width: 50,
          child: SvgPicture.asset(

            "assets/images/bagBui.svg",color: Colors.grey,
          ),
        ),*/
      ],
    ),
  );
}

Widget widgetTabHome(context, String title, int position, String asset) {
  return Container(
    //width: 90,
    child: GestureDetector(
      onTap: () {
        if (position == 1) {
          Navigator.pushNamed(context, reportsRoute,
              arguments: 'Data from home');
        }
        if (position == 2) {
          Navigator.pushNamed(context, sendMoneyRoute,
              arguments: 'Data from home');
        }
        if (position == 3) {
          Navigator.pushNamed(context, addMoneyRoute,
              arguments: 'Data from home');
        }
        if (position == 4) {
          Navigator.pushNamed(context, withdrawmoneyRoute,
              arguments: 'Data from home');
        }
      },
      child: Container(
        width: 90,
        height: 125,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                      width: 3, color: Colors.white, style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(19),
                  child: SvgPicture.string(
                    asset,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: styleText(15, AppColors.primaryColor, false),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget widgetButtonLogin(String titulo) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: Text(
        titulo.toString().toUpperCase(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ),
  );
}

Widget widgetButton(String title, Color color1, Color color2) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        color: color1, borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: Text(
        title.toString(),
        style:
            TextStyle(color: color2, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}

Widget widgetButtonIcon(String title, String url) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: 45,
          ),
          Expanded(
            child: SizedBox(),
          ),
          Text(
            title.toString(),
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            url,
            height: 20,
            width: 20,
            color: AppColors.primaryColor,
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    ),
  );
}

Widget widgetButtonColorIcon(String title, Color color1, Color color2) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: color1, borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Row(
      children: [
        Expanded(child: SizedBox()),
        Container(
          width: 30,
          height: 30,
          child: Icon(
            Icons.camera_alt,
            size: 20,
            color: color2,
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
        ),
        SizedBox(
          width: 20,
        ),
        Center(
          child: Text(
            title.toString(),
            style: TextStyle(
                color: color2, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    ),
  );
}

Widget widgetButtonColor(String title, Color color1, Color color2) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: color1, borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Center(
      child: Text(
        title.toString(),
        style:
            TextStyle(color: color2, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}

Widget redSocial() {
  return Row(
    children: [
      Expanded(
        child: SizedBox(),
      ),
      Container(
        width: 50,
        height: 50,
        child: Container(
          margin: EdgeInsets.all(5),
          child: SvgPicture.asset(
            iconGoogle,
            height: 20,
            width: 20,
          ),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
      SizedBox(
        width: 20,
      ),
      SvgPicture.asset(
        iconFacebook,
        height: 50,
        width: 50,
        color: Colors.white,
      ),
      Expanded(
        child: SizedBox(),
      ),
    ],
  );
}

alertForgortPassword2(BuildContext context) {
  TextEditingController _controllerCode = TextEditingController();
  var width = MediaQuery.of(context).size.width;

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Container(
            // height: height - 400,
            width: width,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0),
                            )),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(4),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                fuctionBack(contextAlert);
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                ),
                                SvgPicture.asset(
                                  assetsClound,
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  AppLocalizations.of(context).recoverPassword,
                                  style: styleText(19, Colors.white, false),
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Container(
                          //padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: _controllerCode,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return AppLocalizations.of(context)
                                      .completeInformation;
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: decorationTextfield1(
                                  AppLocalizations.of(context).validateCode)),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        GestureDetector(
                            onTap: () {
                              fuctionBack(contextAlert);
                              ReduxSignUp.init();
                              // ReduxSignUp.store.dispatch(action)

                              var api = endPointApi();
                              asinc() async {
                                String code = _controllerCode.text;

                                Store<AppState> store =
                                    await createStore(api: api);

                                store.dispatch(LoginActionRecoverPasswordToken(
                                    context, "userId", code));
                              }

                              asinc();

                              // Navigator.pushNamed(context, signUpRoute,
                              //   arguments: 'Data from home');
                            },
                            child: Container(
                                width: double.infinity,
                                child: widgetButtonColor(
                                    AppLocalizations.of(context).send,
                                    AppColors.greenColor2,
                                    Colors.white))),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

alertChangePasswordPin(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var width = MediaQuery.of(context).size.width;
              return Container(
                // height: height - 400,
                width: width,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    SvgPicture.asset(
                                      assetsClound,
                                      height: 20,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .changeseguritypin,
                                      style: styleText(19, Colors.white, false),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Container(
                              //padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  inputFormatters: inputNumberLength(4),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .completeInformation;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: decorationTextfield1(
                                      AppLocalizations.of(context)
                                          .previouspin)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              //padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  inputFormatters: inputNumberLength(4),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .complete;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: decorationTextfield1(
                                      AppLocalizations.of(context).newpin)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              //padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  inputFormatters: inputNumberLength(4),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .complete;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: decorationTextfield1(
                                      AppLocalizations.of(context)
                                          .confirmnewpin)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  fuctionBack(contextAlert);
                                },
                                child: Container(
                                    width: double.infinity,
                                    child: widgetButtonColor(
                                        AppLocalizations.of(context).change,
                                        AppColors.greenColor2,
                                        Colors.white))),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
}

alertCalculate(BuildContext context) {
  TextEditingController _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Builder(builder: (contextBuild) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0),
                            )),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(4),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                fuctionBack(contextAlert);
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  AppLocalizations.of(context).calculator,
                                  style: styleText(19, Colors.white, false),
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Form(
                                  key: _formKey,
                                  child: Container(
                                    height: 50,
                                    //padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: inputNumberLength(10),
                                        style: TextStyle(color: Colors.black),
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            return AppLocalizations.of(context)
                                                .complete;
                                          }
                                          return null;
                                        },
                                        decoration: decorationTextfield1(
                                            AppLocalizations.of(context)
                                                .yoursend)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: decorationContainer(),
                                padding: EdgeInsets.only(left: 20),
                                width: 140,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  onChanged: (String data) {},
                                  items: spinnerItems
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "USD",
                                            style: styleText(
                                                20, Colors.black, false),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Image.asset(
                                            flag2,
                                            height: 32,
                                            width: 32,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context).show,
                            style: styleText(15, AppColors.primaryColor, true),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.asset(assetsSeparator, height: 35),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "0.00 USD" +
                                        AppLocalizations.of(context).totalfee,
                                    style: styleText(15, Colors.black, false),
                                  ),
                                  Text(
                                    "0.00 USD" +
                                        AppLocalizations.of(context)
                                            .guaranteedrate,
                                    style: styleText(15, Colors.black, false),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .beneficiaryreceive,
                                    style: styleText(
                                        15, AppColors.primaryColor, true),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "0.00",
                                    style: styleText(18, Colors.black, true),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                decoration: decorationContainer(),
                                padding: EdgeInsets.only(left: 20),
                                width: 140,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  onChanged: (String data) {},
                                  items: spinnerItems
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "CAD",
                                            style: styleText(
                                                20, Colors.black, false),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Image.asset(
                                            flag1,
                                            height: 32,
                                            width: 32,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                fuctionBack(contextAlert);
                              },
                              child: Container(
                                  width: double.infinity,
                                  child: widgetButtonColor(
                                      AppLocalizations.of(context).send,
                                      AppColors.greenColor2,
                                      Colors.white))),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
      });
}

alertForgortPassword3(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Builder(
            builder: (contextBuilder) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: new Container(
                          decoration: new BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(10.0),
                                topRight: const Radius.circular(10.0),
                              )),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  fuctionBack(contextAlert);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SvgPicture.asset(
                                    assetsClound,
                                    height: 20,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)
                                        .recoverPassword,
                                    style: styleText(19, Colors.white, false),
                                    textAlign: TextAlign.center,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            AppLocalizations.of(context).inputyournewpassword,
                            style: styleText(19, Colors.black, true),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return AppLocalizations.of(context)
                                      .completeInformation;
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: decorationTextfield1(
                                  AppLocalizations.of(context)
                                      .inputyournewpassword)),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return AppLocalizations.of(context)
                                      .completeInformation;
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: decorationTextfield1(
                                  AppLocalizations.of(context)
                                      .inputyournewpasswordagain)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              AppLocalizations.of(context).yourpasswordformat,
                              style: styleText(16, Color(0xff636363), false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                fuctionBack(contextAlert);
                                // Navigator.pushNamed(context, signUpRoute,
                                //   arguments: 'Data from home');
                              },
                              child: Container(
                                  width: double.infinity,
                                  child: widgetButtonColor(
                                      AppLocalizations.of(context)
                                          .changePassword,
                                      AppColors.greenColor2,
                                      Colors.white))),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      });
}

alertTerms(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              fuctionBack(contextAlert);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10, top: 10),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context).termsandconditions,
                              style: styleText(17, Colors.white, true),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Center(
                        child: Text(
                          "ECloudATM Corporation, a Canadian corporation, is serious about protecting your privacy. This Privacy Policy (“Policy”) covers how eCloudATM collects and uses the Personal Information you provide on our website and in conjunction with any of the services hosted at www.eCloudATM.com (“Service” and “Website”), including QR code payments, QR code money transfers, and money transfer services accessed by internet enabled devices. It also describes the choices available to you regarding our use of your Personal Information and how you can access and update this information.",
                          style: styleText(15, AppColors.lightDarkColor, false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                          onTap: () {
                            fuctionBack(contextAlert);
                          },
                          child: Container(
                              width: double.infinity,
                              child: widgetButtonColor(
                                  AppLocalizations.of(context).accept,
                                  AppColors.greenColor2,
                                  Colors.white))),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ));
      });
}

alertScanQrCode(BuildContext context) {
  TextEditingController _controllerEmail = TextEditingController();

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            onTap: () {
                              fuctionBack(contextAlert);
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                AppLocalizations.of(context).entermanually,
                                style: styleText(
                                    19, AppColors.primaryColor, false),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              //padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _controllerEmail,
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .complete;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: decorationTextfield1(
                                      AppLocalizations.of(context)
                                          .manuallyenterthecode)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            fuctionBack(contextAlert);
                          },
                          child: Container(
                              width: double.infinity,
                              child: widgetButtonColor(
                                  AppLocalizations.of(context).scanqrcode,
                                  AppColors.primaryColor,
                                  Colors.white))),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            fuctionBack(contextAlert);
                          },
                          child: Container(
                              width: double.infinity,
                              child: widgetButtonColor(
                                  AppLocalizations.of(context).pay,
                                  AppColors.greenColor2,
                                  Colors.white))),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ));
      });
}

alertForgortPassword(BuildContext context) {
  TextEditingController _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showDialog(
      barrierDismissible: true,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                          )),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              fuctionBack(contextAlert);
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                              ),
                              SvgPicture.asset(
                                assetsClound,
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                AppLocalizations.of(context).recoverPassword,
                                style: styleText(19, Colors.white, false),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          //padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: _controllerEmail,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return AppLocalizations.of(context).complete;
                                }
                                return null;
                              },
                              //obscureText: true,
                              decoration: decorationTextfield1(
                                  AppLocalizations.of(context).inputyouremail)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).recoverPasswordMessage,
                            style:
                                styleText(15, AppColors.lightDarkColor, false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              fuctionBack(contextAlert);
                              var api = endPointApi();
                              String email = _controllerEmail.text;

                              async() async {
                                Store<AppState> store =
                                    await createStore(api: api);

                                store.dispatch(UserSignUpActionRecoverPassword(
                                    context, email, "es"));
                              }

                              async();
                            }

                            // Navigator.pushNamed(context, signUpRoute,
                            //   arguments: 'Data from home');
                          },
                          child: Container(
                              width: double.infinity,
                              child: widgetButtonColor(
                                  AppLocalizations.of(context).send,
                                  AppColors.greenColor2,
                                  Colors.white))),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ));
      });
}

alertConfirmNumber2(BuildContext context, String id, String mobile) {
  TextEditingController _controllerSmsEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  showDialog(
      barrierDismissible: true,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            // contentPadding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            content: Builder(builder: (contextBuilder) {
              var width = MediaQuery.of(context).size.width;
              return Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context).validateyouremail,
                      style: styleText(20, Colors.black, true),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context).pleaseentercodeemail,
                      style: styleText(15, Colors.black, false),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        //padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: inputNumberLength(10),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return AppLocalizations.of(context).complete;
                              }
                              return null;
                            },
                            controller: _controllerSmsEmail,
                            style: TextStyle(color: Colors.black),
                            decoration: decorationTextfield1(
                                AppLocalizations.of(context).enterthecode)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            fuctionBack(contextAlert);
                            var api = endPointApi();
                            String token = _controllerSmsEmail.text.toString();

                            async() async {
                              Store<AppState> store =
                                  await createStore(api: api);

                              store.dispatch(UserSignUpActionValidateSmsEmail(
                                  context, "258", token));
                            }

                            async();
                            // alertConfirmNumber(context);
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            child: widgetButtonColor(
                                AppLocalizations.of(context).validate,
                                AppColors.greenColor2,
                                Colors.white))),
                    SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              );
            }));
      });
}

alertConfirmNumber(BuildContext context, String userId, String numberTel) {
  TextEditingController _controllerSms = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  showDialog(
      barrierDismissible: true,
      context: context,
      useRootNavigator: false,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context).confirmyourphonenumber,
                  style: styleText(19, Colors.black, true),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We take your security very seriously that's why we are asking to take a second to confirm your identity",
                  style: styleText(15, AppColors.lightDarkColor, false),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context).yourphonenumberis +
                      " " +
                      numberTel.toString(),
                  style: styleText(17, AppColors.primaryColor, false),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      var api = endPointApi();
                      async() async {
                        Store<AppState> store = await createStore(api: api);

                        store.dispatch(
                            UserSignUpActionRepeatSms(context, userId));
                      }

                      async();
                    },
                    child: Container(
                        width: double.infinity,
                        child: widgetButtonColor(
                            AppLocalizations.of(context).validate,
                            AppColors.primaryColor,
                            Colors.white))),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    //padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return AppLocalizations.of(context).complete;
                          }
                          return null;
                        },
                        controller: _controllerSms,
                        style: TextStyle(color: Colors.black),
                        decoration: decorationTextfield1(
                            AppLocalizations.of(context).enterthecode)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      //  fuctionBack(context);
                      if (_formKey.currentState.validate()) {
                        ReduxSignUp.init();
                        // ReduxSignUp.store.dispatch(action)

                        var api = endPointApi();
                        asinc() async {
                          String sms = _controllerSms.text;

                          Store<AppState> store = await createStore(api: api);

                          store.dispatch(UserSignUpActionValidateSms(
                              context, userId, sms));
                        }

                        asinc();
                      }
                    },
                    child: Container(
                        width: double.infinity,
                        child: widgetButtonColor(
                            AppLocalizations.of(context).send,
                            AppColors.greenColor2,
                            Colors.white))),
                SizedBox(
                  height: 20,
                ),
              ],
            ));
      });
}

Widget widgetCardReportsCredit(BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertTransactionDetailCredit(context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context).waitingforpartner,
                style: styleText(14, AppColors.greenColor2, false),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Reinaldo Verela",
                style: styleText(19, AppColors.primaryColor, true),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "7/16/2020",
                style: styleText(13, AppColors.lightDarkColor, false),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Icon(
                  Icons.qr_code_sharp,
                  color: AppColors.greenColor2,
                  size: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  " \u0024 50.000",
                  style: styleText(20, AppColors.greenColor2, false),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget widgetCardReportsDebit(BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertTransactionDetailDebito(context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context).waitingforpartner,
                style: styleText(14, AppColors.redColor, false),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Reinaldo Verela",
                style: styleText(19, AppColors.primaryColor, true),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "7/16/2020",
                style: styleText(13, AppColors.lightDarkColor, false),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Column(
            children: [
              Icon(
                Icons.qr_code_sharp,
                color: AppColors.redColor,
                size: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  "\u0024 50.000",
                  style: styleText(20, AppColors.redColor, false),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget widgetCardReports(BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertTransactionDetail(context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context).waitingforpartner,
                style: styleText(14, AppColors.redColor, false),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Reinaldo Verela",
                style: styleText(19, AppColors.primaryColor, true),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "7/16/2020",
                style: styleText(13, AppColors.lightDarkColor, false),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget widgetAppbarNoTitle(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    centerTitle: true,
  );
}

Widget widgetAppbarPartner(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.colorPartner,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}

Widget widgetAppbar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}

Widget widgetAppBarBackNoTitle(BuildContext context) {
  return new PreferredSize(
    child: new Container(
      padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.white,
                  )),
            ],
          )),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(colors: [
          Color(0xff426EBD),
          Color(0xff4787CF),
        ]),
      ),
    ),
    preferredSize: new Size(MediaQuery.of(context).size.width, 110.0),
  );
}

Widget widgetAppBarBack(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      children: [
        SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.white,
            )),
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    ),
  );
}

Widget widgetLanguage(BuildContext context) {
  return GestureDetector(
    onTap: () {
      alertChangeLanguage(context);
    },
    child: Container(
      margin: EdgeInsets.only(top: 30, right: 5),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Text(
            dropdowLanguage,
            style: styleText(22, Colors.white, false),
          ),
          SizedBox(
            width: 8,
          ),
          Image.asset(
            dropdowLanguage != "English" ? flag3 : flag1,
            height: 32,
            width: 32,
          ),
        ],
      ),
    ),
  );
}

alertChangeLanguage(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext contextAlert) {
        return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 25),
            contentPadding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: StatefulBuilder(
                builder: (BuildContext contextAler2, StateSetter setState) {
              return Builder(builder: (contextAlert) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: new Container(
                            decoration: new BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    fuctionBack(contextAlert);
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .changeLanguage,
                                      style: styleText(19, Colors.white, true),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              decoration: decorationContainer(),
                              padding: EdgeInsets.only(left: 20),
                              width: double.infinity,
                              child: DropdownButton<String>(
                                iconSize: 0.0,
                                value: dropdowLanguage,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                underline: Container(
                                  height: 0,
                                  color: Colors.white,
                                ),
                                items: AppSettings.itemLanguage
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            value,
                                            style: styleText(20,
                                                AppColors.primaryColor, false),
                                          ),
                                          SizedBox(
                                            width: 150,
                                          ),
                                          Image.asset(
                                            value == "English" ? flag1 : flag3,
                                            height: 32,
                                            width: 32,
                                          ),
                                        ],
                                      ));
                                }).toList(),
                                onChanged: (String data) {
                                  if (data.toString() == "English") {
                                    AppLocalizations.load(
                                        Locale.fromSubtags(languageCode: 'en'));
                                  }
                                  if (data.toString() == "Français") {
                                    AppLocalizations.load(
                                        Locale.fromSubtags(languageCode: 'fr'));
                                  }
                                  dropdowLanguage = data.toString();
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GestureDetector(
                                onTap: () {
                                  fuctionBack(contextAlert);
                                },
                                child: Container(
                                    width: double.infinity,
                                    child: widgetButtonColor(
                                        AppLocalizations.of(context).apply,
                                        AppColors.greenColor2,
                                        Colors.white))),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
            }));
      });
}

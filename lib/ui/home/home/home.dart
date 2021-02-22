import 'dart:async';

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/sharedPreferences/sharedPreferences.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class homeStartPage extends StatefulWidget {
  @override
  _homeStartPageState createState() => _homeStartPageState();
}

class _homeStartPageState extends State<homeStartPage> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  alertChangeLanguage2(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext contextAlert) {
          return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 25),
              contentPadding: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              content: Container(
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
                                    AppLocalizations.of(context).changeLanguage,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              items:
                                  AppSettings.itemLanguage.map((String value) {
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
                                fuctionBack(context);
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
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding:
                new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Image.asset(
                    assetsIconApp4,
                    height: 40,
                    //color: Colors.white,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: () {
                      alertChangeLanguage2(context);
                    },
                    child: Image.asset(
                      dropdowLanguage == "English" ? flag1 : flag3,
                      height: 32,
                      width: 32,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [
                Color(0xff1773bf),
                Color(0xff178acf),
              ]),
              //color: Color(0xff1775c1)
            ),
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 110.0),
        ),
        backgroundColor: Color(0xff345BA8),
        body: Container(
          color: Colors.white,
          child: Stack(children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      shapeRotate,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("prueba2: ");
                                endPointApi api = new endPointApi();
                                // store.dispatch(listFavoriteLoading(store, action.context));
                                api.addUser("prueba@gmail.com", "prueba123",
                                    "3013928129", "es", "true");
                                api.loginUser("alexcr@gmail.com", "mercurio");
                              },
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                "Jhon Smith",
                                style: styleText(17, Colors.white, true),
                              ),
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of(context).date + " 5 / 2020",
                                style: styleText(13, Colors.white, false),
                              ),
                            ),
                            Center(
                              child: Text(
                                AppLocalizations.of(context).lastlogin +
                                    " 10/05/2020",
                                style: styleText(11, Colors.white, false),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                '\u0024' + " 189.86",
                                style: styleText(22, Colors.white, false),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Container(
                                  height: 17,
                                  width: 17,
                                  child: SvgPicture.string(
                                    svg_wkcq03,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    AppLocalizations.of(context).available,
                                    style: styleText(13, Colors.white, false),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: AppColors.primaryColor.withOpacity(0.2),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.star,
                        size: 17,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context).promotions,
                      style: styleText(16, AppColors.primaryColor, false),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        widgetPromotionsHome(context),
                        widgetPromotionsHome(context),
                        widgetPromotionsHome(context),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: AppColors.primaryColor.withOpacity(0.2),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    // SizedBox(width: 10,),
                    /*Expanded(
                      child: SizedBox(),
                    ),*/
                    widgetTabHome(context,
                        AppLocalizations.of(context).statements, 1, svg_c6b1u2),
                    SizedBox(
                      width: 20,
                    ),
                    widgetTabHome(context,
                        AppLocalizations.of(context).sendmoney, 2, svg_uzk685),
                    /* Expanded(
                      child: SizedBox(),
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,
                  children: [
                    /*Expanded(
                      child: SizedBox(),
                    ),*/
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, homeRoutes2,
                              arguments: 'Data from home');
                        },
                        child: widgetTabHome(
                            context,
                            AppLocalizations.of(context).addmoney,
                            3,
                            svg_jinedx)),
                    SizedBox(
                      width: 20,
                    ),
                    widgetTabHome(context,
                        AppLocalizations.of(context).withdraw, 4, assetItdraw),
                    /* Expanded(
                      child: SizedBox(),
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.transparent),
                    child: GestureDetector(
                        onTap: () {
                          // tutorialCoachMark.finish();

                          //routesInventario(context);
                        },
                        child: Container(
                          // key: keyButton1,
                          child: widgetBottom(
                              context,
                              "assets/images/icon/Icons-02.svg",
                              "stringAddNewRequest"),
                        )),
                  )
                ]),
          ]),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      AppSharedPreference().setIdUserSignUpClear("id");
    });
  }
}

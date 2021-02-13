import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:custom_switch/custom_switch.dart';
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

class becomePartnerPage extends StatefulWidget {
  @override
  _becomePartnerPageState createState() => _becomePartnerPageState();
}

class _becomePartnerPageState extends State<becomePartnerPage> {
  String _dropdownValueCountry = 'Card';
  bool checkWithDraw = false;
  bool checkDeposit = false;

  bool checkSignUp = false;

  List<String> _spinnerItemsCountry = ['Card'];

  int _groupValue = -1;
  bool status = false;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      //contentPadding: EdgeInsets.all(0),
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgetAppBarBackNoTitle(context),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          shapeRotate,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //widgetAppBarBack(context),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    "Become an eCloudATM Partner",
                                    style: styleText(18, Colors.white, true),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Container(
                                  //margin: EdgeInsets.only(left: 40,right: 40),
                                  child: SvgPicture.asset(
                                    assetsImgMoney,
                                    height: 120,
                                  ),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Center(
                                      child: Text(
                                        AppLocalizations.of(context).step1,
                                        style:
                                            styleText(20, Colors.white, false),
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
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                AppLocalizations.of(context).descriptionStep,
                                style: styleText(17, Colors.grey, false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: AppColors.primaryColor.withOpacity(0.2),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context).whatdoyouwanttodo,
                            style: styleText(20, Colors.black, true),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25, right: 25),
                            child: Row(
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                      onTap: () {
                                        checkWithDraw = !checkWithDraw;
                                        setState(() {});
                                      },
                                      child: widgetCheckBox(
                                          AppLocalizations.of(context).withdraw,
                                          checkWithDraw)),
                                ),
                                Flexible(
                                    child: GestureDetector(
                                        onTap: () {
                                          checkDeposit = !checkDeposit;
                                          setState(() {});
                                        },
                                        child: widgetCheckBox(
                                            AppLocalizations.of(context)
                                                .deposit,
                                            checkDeposit))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                checkSignUp = !checkSignUp;
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 40, right: 20),
                                child: Center(
                                  child: widgetCheckBox2(
                                      AppLocalizations.of(context)
                                          .acceptCryptocurrencies,
                                      checkSignUp),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, homeRoutes,
                                    arguments: 'Data from home');
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: widgetButtonColor(
                                      AppLocalizations.of(context).next,
                                      AppColors.primaryColor,
                                      Colors.white))),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      shape,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

const String _svg_ikk8ck =
    '<svg viewBox="-3.5 434.4 378.0 305.4" ><defs><linearGradient id="gradient" x1="1.0" y1="0.38133" x2="0.0" y2="0.381199"><stop offset="0.0" stop-color="#ff345ba8"  /><stop offset="1.0" stop-color="#ff468fce"  /></linearGradient></defs><path transform="translate(-216.54, 26.39)" d="M 213.9974212646484 424.8256530761719 C 213.9974212646484 424.8256530761719 272.25439453125 390.0507202148438 404.4828186035156 420.6484069824219 C 536.7117309570313 451.24609375 591 449.9852294921875 591 449.9852294921875 L 590.0025634765625 713.4244384765625 L 213 713.4244384765625 L 213.9974212646484 424.8256530761719 Z" fill="url(#gradient)" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t9isqx =
    '<svg viewBox="-0.9 409.8 375.9 329.5" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff004cff"  /><stop offset="1.0" stop-color="#ff275fb4"  /></linearGradient></defs><path transform="translate(-234.0, 35.0)" d="M 609 434.2459716796875 C 609 434.2459716796875 505.1473083496094 393.0434875488281 391.439697265625 409.1051635742188 C 277.7320861816406 425.1668090820313 233.0645294189453 374.7544860839844 233.0645294189453 374.7544860839844 L 233.0645294189453 704.2772827148438 L 609 704.2772827148438 L 609 434.2459716796875 Z" fill="url(#gradient)" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-opacity="0.2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0vve =
    '<svg viewBox="-0.9 440.6 378.9 298.7" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff1879a4"  /><stop offset="1.0" stop-color="#ff2772b4"  /></linearGradient></defs><path transform="translate(-234.0, 55.0)" d="M 612 387.1066589355469 C 612 387.1066589355469 548.9283447265625 376.794677734375 451.439697265625 410.6126403808594 C 353.9510803222656 444.4305725097656 233.0645294189453 392.9567565917969 233.0645294189453 392.9567565917969 L 233.0645294189453 684.2772827148438 L 609 684.2772827148438 L 612 387.1066589355469 Z" fill="url(#gradient)" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l23qso =
    '<svg viewBox="-75.5 437.8 452.5 302.0" ><defs><linearGradient id="gradient" x1="1.0" y1="0.42289" x2="0.17625" y2="0.423406"><stop offset="0.0" stop-color="#ff5490f9"  /><stop offset="1.0" stop-color="#ff2e5fd4"  /></linearGradient></defs><path transform="translate(-234.0, 57.0)" d="M 158.4649963378906 399.8046875 C 158.4649963378906 399.8046875 224.402099609375 362.2328491210938 356.971435546875 392.716064453125 C 489.5408325195313 423.1993408203125 610.9693603515625 412.3529052734375 610.9693603515625 412.3529052734375 L 609.9693603515625 682.8163452148438 L 234 682.8163452148438 L 158.4649963378906 399.8046875 Z" fill="url(#gradient)" fill-opacity="0.7" stroke="none" stroke-width="1" stroke-opacity="0.7" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

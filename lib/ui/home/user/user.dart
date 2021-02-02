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
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool tabProfile = false;

  Widget widgetTabUser() {
    return Stack(
      children: [
        Image.asset(
          shapeRotate,
          height: 255,
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
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/05/26/14/53/sushi-354628_960_720.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: decorationContainer(),
                  margin: EdgeInsets.only(left: 75, right: 75),
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 4, bottom: 4),
                      child: Text( AppLocalizations.of(context).user,
                          style: styleText(19, Colors.white, true))),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Julian Camilo Naranjo Pulido",
                    style: styleText(18, Colors.white, true),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "4.5",
                    style: styleText(18, Colors.white, true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /* Row(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              child: SvgPicture.string(
                                svg_wkcq03,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Available",
                                style: styleText(13, Colors.white, false),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),*/
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget widgetTabPartner() {
    return Stack(
      children: [
        Image.asset(
          shapeRotate,
          height: 255,
          color: AppColors.colorPartner,
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
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/05/26/14/53/sushi-354628_960_720.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: decorationContainer(),
                  margin: EdgeInsets.only(left: 75, right: 75),
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 4, bottom: 4),
                      child: Text( AppLocalizations.of(context).partner,
                          style: styleText(19, Colors.white, true))),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Julian Camilo Naranjo Pulido",
                    style: styleText(18, Colors.white, true),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "4.5",
                    style: styleText(18, Colors.white, true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /* Row(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              child: SvgPicture.string(
                                svg_wkcq03,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Available",
                                style: styleText(13, Colors.white, false),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),*/
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 415) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: new PreferredSize(
          child: new Container(
            padding:
                new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ],
                )),
            decoration: new BoxDecoration(
              gradient: tabProfile == true
                  ? new LinearGradient(colors: [
                      AppColors.colorPartner,
                      AppColors.colorPartner,
                    ])
                  : new LinearGradient(colors: [
                      Color(0xff426EBD),
                      Color(0xff4787CF),
                    ]),
            ),
          ),
          preferredSize: new Size(MediaQuery.of(context).size.width, 100.0),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            tabProfile != true ? widgetTabUser() : widgetTabPartner(),
            Container(

              // margin: EdgeInsets.only(left: 108, right: 108),
              child: Container(
                margin: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5), //                   <--- border color
                        width: 1.0,

                      ),
                    ),
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.terceryColor,
                            ),
                            child: tabProfile == true
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        tabProfile = !tabProfile;
                                        setState(() {});
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: 22, right: 22, top: 4, bottom: 4),
                                          child: Text(
                                            AppLocalizations.of(context).user,
                                            style: styleText(18, Colors.grey, true),
                                          )),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      tabProfile = !tabProfile;
                                      setState(() {});
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 22, right: 22, top: 4, bottom: 4),
                                        child: Text(
                                          AppLocalizations.of(context).user,
                                          style: styleText(17, Colors.white, true),
                                        )),
                                  ),
                          ),


    SizedBox(
    width: 5,
    ),
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: AppColors.colorPartner,
    ),
    child: tabProfile == false
    ? Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.white,
    ),
    child: GestureDetector(
    onTap: () {
    tabProfile = !tabProfile;
    setState(() {});
    },
    child: Container(
    margin: EdgeInsets.only(
    left: 17, right: 17, top: 4, bottom: 4),
    child: Text(
      AppLocalizations.of(context).partner,
    style: styleText(16, Colors.grey, true),
    )),
    ),
    )
        : GestureDetector(
    onTap: () {
    tabProfile = !tabProfile;
    setState(() {});
    },
    child: Container(
    margin: EdgeInsets.only(
    left: 17, right: 17, top: 4, bottom: 4),
    child: Text(
      AppLocalizations.of(context).partner,
    style: styleText(16, Colors.white, true),
    )),
    ),
    ),
                        ],
                      ),
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
              width: double.infinity,
              height: 2,
              color: AppColors.primaryColor.withOpacity(0.2),
            ),
            SizedBox(
              height: 20,
            ),
            tabProfile == true
                ? Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int i) {
                            if (i == 0) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, oportunitiesRoute,
                                      arguments: 'Data from home');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  // width: double.infinity,
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3.0,
                                      color: AppColors.greenColor2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                      //  ,
                                      //               <--- border radius here
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "37",
                                        style: styleText(
                                            19, AppColors.greenColor2, true),
                                      ),
                                      Text(
                                        AppLocalizations.of(context).opportunities,
                                        style: styleText(17, Colors.grey, true),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      transactionDetailPartnerPageRoute,
                                      arguments: 'Data from home');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  // width: double.infinity,
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3.0,
                                      color: AppColors.greenColor2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                      //  ,
                                      //               <--- border radius here
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "37",
                                          style: styleText(
                                              19, AppColors.greenColor2, true),
                                        ),
                                        Text(
                                          AppLocalizations.of(context).mytransactions,
                                          style:
                                              styleText(17, Colors.grey, true),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        widgetCardUserPartner(
                            AppLocalizations.of(context).settings, assetIconFavorite, context, 10),
                        widgetCardUserPartner(
                            AppLocalizations.of(context).logout, assetIconMyverification, context, 11),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        widgetCardUser(
                            AppLocalizations.of(context).becomepartner, assetIconBecome, context, 1),
                        widgetCardUser(AppLocalizations.of(context).mytransactions,
                            assetIconMytransactions, context, 2),
                        widgetCardUser(
                            AppLocalizations.of(context).paymentmethods, assetIconMethod2, context, 3),
                        widgetCardUser(
                            AppLocalizations.of(context).verification, assetIconMethods, context, 4),
                        widgetCardUser(AppLocalizations.of(context).changeseguritypin, assetsIconChange,
                            context, 5),
                        widgetCardUser(
                            AppLocalizations.of(context).favoriteUser, assetsIconFavorite2, context, 6),
                        widgetCardUser(
                            AppLocalizations.of(context).addyourbank, assetAddYourBank, context, 7),
                        widgetCardUser(
                            AppLocalizations.of(context).settings, assetIconFavorite, context, 8),
                        widgetCardUser(
                            AppLocalizations.of(context).logout, assetIconMyverification, context, 9),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
          ],
        ));
  }
}

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/card/cardOportunities.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class transactionPartnerPage extends StatefulWidget {
  @override
  _transactionPartnerPageState createState() => _transactionPartnerPageState();
}

class _transactionPartnerPageState extends State<transactionPartnerPage> {
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
          Text( AppLocalizations.of(context).statementsreport, style: styleText(18, Colors.white, false),),
          Expanded(
            child: SizedBox(),
          ),
          SizedBox(width: 30,),
          SizedBox(width: 30,),
        ],
      ),),
      // widgetCardReports(),

    ],),);
  }
  Widget bodyPending() {

    return Column(
      children: [
        widgetTransactionsPartner("",context),

      ],
    );
  }

  Widget bodyDebig() {

    return Container(

      child: Column(
        children: [
          widgetTransactionsPartner("",context),

        ],
      ),
    );
  }

  Widget bodyCredit() {
    return Column(
      children: [
        widgetTransactionsPartner("",context),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [
       // Material(child:  widgetAppbar()),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.colorPartner,
                title: Text( AppLocalizations.of(context).mytransactions,  style: styleText(18, Colors.white, false),),
                centerTitle: true,


                bottom: new PreferredSize(
                 preferredSize: Size.fromHeight(50),
                  child: Column(
                    children: [
                      new Container(
                        color: Colors.white,
                        // width: 200.0,
                        child: TabBar(

                          indicatorColor: AppColors.colorPartner,
                          labelColor: AppColors.colorPartner,
                          unselectedLabelColor: Colors.grey,

                          tabs: [
                            Tab(
                              text:   AppLocalizations.of(context).partner,
                            ),
                            Tab(
                              text:  AppLocalizations.of(context).waitingforuser,
                            ),
                            Tab(
                              text:  AppLocalizations.of(context).finished,
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

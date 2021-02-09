import 'dart:async';
import 'dart:ui';

import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../sharedPreferences/sharedPreferences.dart';
//opcion
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 15.0,
      width: 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondaryColor : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundSlider),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Container(

                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40, right: 40, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: SvgPicture.asset(
                                      assetsiconSlider1,
                                      height: 250,
                                      width: 250,
                                    ),
                                  )
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(height: 16.0),
                              Center(
                                child: Container(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Flexible(
                                        child: Container(

                                          child: Text(
                                            AppLocalizations.of(context).intro1,
                                            style:
                                            styleText(14, Colors.white, false),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            nextPage();
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40, right: 40, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: SvgPicture.asset(
                                      assetsiconSlider2,
                                      height: 250,
                                      width: 250,
                                    ),
                                  )
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(height: 15.0),
                              Center(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          previousPage();
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                    Flexible(
                                      child: Text(
                                          AppLocalizations.of(context).intro2,style: styleText(14, Colors.white, false),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          nextPage();
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 40, right: 40, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: SvgPicture.asset(
                                      assetsiconSlider3,
                                      height: 250,
                                      width: 250,
                                    ),
                                  )
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(height: 15.0),
                              Center(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          previousPage();
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                    // Expanded(child: SizedBox(),),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                            AppLocalizations.of(context).intro3,style:
                                          styleText(14, Colors.white, false),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    // Expanded(child: SizedBox(),),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 30,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _currentPage != _numPages - 1
                    ? Container(
                  margin: EdgeInsets.only(top: 13,bottom: 13),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                )
                    : SizedBox(),
                SizedBox(height: 20),
                _currentPage == _numPages - 1
                    ? GestureDetector(
                  onTap: () {
                    AppSharedPreference().setIntro();
                    Navigator.pushNamed(context, signUpRoute,
                        arguments: 'Data from home');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    height: 55,
                    width: 100,
                    margin: EdgeInsets.only(left: 125, right: 125),
                    //  color: Colors.white,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).start,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                    : Text(''),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {

      AppLock.of(context).enable();
      AppSharedPreference().setIntro();
    });

  }
}

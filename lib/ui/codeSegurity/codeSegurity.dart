import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/login/login_actions.dart';
import 'package:ecloudatm/redux/login/store.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/styles/style.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

import '../../app/app_colors.dart';
int estadoLogin;
final _formKey = GlobalKey<FormState>();

class codeSegurityPage extends StatefulWidget {
  @override
  _codeSegurityPageState createState() => _codeSegurityPageState();
}

class _codeSegurityPageState extends State<codeSegurityPage> {

  void _update(int count) {
    setState(() {

    });
  }
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool _passwordVisible = true;
  Store<AppStateLogin> _store;



  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return


      Scaffold(
        // resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        shape,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ],
              ),
              StoreProvider<AppStateLogin>(
                //ReduxSignUp.store,
                  store: ReduxLogin.store,
                  child:
                  StoreConnector<AppStateLogin, dynamic>(
                      distinct: true,
                      converter: (store) => ReduxLogin.store,
                      onInit: (store) {
                        _store = store;
                      },
                      builder: (context, value) {
                        return Container(
                         // decoration: background(),
                          child: Form(
                            key: _formKey,
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: KeyboardActions(
                                config: buildConfig(context),
                                child: ListView(
                                  children: [

                                    SizedBox(
                                      height: 30,
                                    ),

                                    //Expanded(child: SizedBox(),),
                                    Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 40.0,
                                          backgroundImage: NetworkImage(
                                              'https://cdn.pixabay.com/photo/2014/05/26/14/53/sushi-354628_960_720.jpg'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).hello,
                                          style: styleText(20, Colors.black, true),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).login,
                                          style: styleText(20, Colors.black, true),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context).enteryourpassword,
                                          style: styleText(17, Colors.black, false),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        Container(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.primaryColor),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.primaryColor),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.primaryColor),
                                              ),
                                              labelText: AppLocalizations.of(context).password,
                                              hintStyle: TextStyle(
                                                  fontSize: 17.0, color: AppColors.primaryColor),
                                              labelStyle: TextStyle(
                                                  fontSize: 17.0, color: AppColors.primaryColor),
                                              //  hintText: claveString,
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color:AppColors.primaryColor,
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    _passwordVisible = !_passwordVisible;
                                                  });
                                                },
                                              ),
                                            ),
                                            style: TextStyle(color: AppColors.primaryColor),
                                            inputFormatters: inputMaxLine(),
                                            validator: (value) {
                                              if (value.trim().isEmpty) {
                                                return AppLocalizations.of(context).complete;
                                              }
                                              return null;
                                            },
                                            obscureText: _passwordVisible,
                                            controller: _controllerPassword,
                                            textInputAction: TextInputAction.next,
                                            onEditingComplete: () => node.nextFocus(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                            onTap: () {


                                              if (_formKey.currentState.validate()) {

                                                AppLock.of(context).didUnlock();
                                              }
                                            },
                                            child: widgetButton(AppLocalizations.of(context).login,AppColors.primaryColor,Colors.white)),
                                        SizedBox(
                                          height: 140,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            alertForgortPassword(context);

                                          },
                                          child: Text(
                                            AppLocalizations.of(context).forgotPassword,
                                            style: styleText(17, Colors.white, true),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            fuctionBack(context);

                                          },
                                          child: Text(
                                            AppLocalizations.of(context).signUp,
                                            style: styleText(17, Colors.white, true),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Expanded(child: SizedBox(),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
            ],
          )




      );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}

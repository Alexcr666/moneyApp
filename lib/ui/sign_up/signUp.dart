import 'dart:async';

import 'package:ecloudatm/animation/FadeAnimation.dart';
import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/assets/assets.dart';
import 'package:ecloudatm/data/models/signupSharedPreferences/signupModel.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/app/app_state.dart';

//import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_actions.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/sharedPreferences/sharedPreferences.dart';
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

int estadoLogin;
final _formKey = GlobalKey<FormState>();

class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

TextEditingController _controllerEmail = TextEditingController();
TextEditingController _controllerPassword = TextEditingController();
TextEditingController _controllerRepeatPassword = TextEditingController();
TextEditingController _controllerPhone = TextEditingController();

class _signUpPageState extends State<signUpPage> {
  bool _obscureText = true;
  bool passwordVisible = true;
  bool passwordVisibleRepeat = true;

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    print(hasDigits.toString() +
        hasUppercase.toString() +
        hasLowercase.toString() +
        hasSpecialCharacters.toString() +
        hasMinLength.toString());

    if (hasDigits ==
        true &
            hasUppercase &
            hasLowercase &
            hasSpecialCharacters &
            hasMinLength) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    Store<AppStateSignUp> _store;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StoreProvider<AppStateSignUp>(
          //ReduxSignUp.store,
          store: ReduxSignUp.store,
          child: StoreConnector<AppStateSignUp, dynamic>(
              distinct: true,
              converter: (store) => ReduxSignUp.store,
              onInit: (store) {
                _store = store;
              },
              builder: (context, value) {
                return Container(
                  decoration: background(),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: ListView(
                        children: [
                          widgetLanguage(context),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Center(
                                  child: Image.asset(
                                assetsIconApp3,
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                AppLocalizations.of(context).signUp,
                                style: styleText(18, Colors.white, true),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              redSocial(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: decorationContainer(),
                                    //  padding: EdgeInsets.only(left: 20),
                                    width: 100,
                                    child: DropdownButton<String>(
                                      iconSize: 0.0,
                                      value: dropdownValue,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      underline: Container(
                                        height: 0,
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
                                                "+1",
                                                style: styleText(
                                                    20, Colors.white, false),
                                              ),
                                              SizedBox(
                                                width: 20,
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      //padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly
                                        ],
                                        style: TextStyle(color: Colors.white),
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            return AppLocalizations.of(context)
                                                .complete;
                                          }
                                          return null;
                                        },
                                        controller: _controllerPhone,
                                        textInputAction: TextInputAction.next,
                                        onEditingComplete: () =>
                                            node.nextFocus(),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText:
                                              AppLocalizations.of(context)
                                                  .phone,
                                          hintStyle: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.white60),
                                          labelStyle: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.white60),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.white54,
                              ),
                              Container(
                                child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return AppLocalizations.of(context)
                                            .complete;
                                      } else {
                                        if (isEmail(value)) {
                                          return null;
                                        } else {
                                          return AppLocalizations.of(context)
                                              .errorFormat;
                                        }
                                      }
                                    },
                                    inputFormatters: inputMaxLine(),
                                    controller: _controllerEmail,
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () => node.nextFocus(),
                                    decoration: decorationTextfield(
                                        AppLocalizations.of(context).email)),
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  inputFormatters: inputMaxLine(),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white60),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText:
                                        AppLocalizations.of(context).password,

                                    hintStyle: TextStyle(
                                        fontSize: 17.0, color: Colors.white60),
                                    labelStyle: TextStyle(
                                        fontSize: 17.0, color: Colors.white60),
                                    //  hintText: claveString,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .complete;
                                    } else {
                                      if (value.trim().length >= 8 &&
                                          value.trim().length <= 15) {
                                        if (_controllerRepeatPassword.text
                                                .toString() ==
                                            value.toString()) {
                                          if (isPasswordCompliant(
                                                  _controllerPassword.text
                                                      .toString(),
                                                  6) ==
                                              true) {
                                            return null;
                                          } else {
                                            return AppLocalizations.of(context)
                                                .errorFormatPassword1;
                                          }
                                          // return null;
                                        } else {
                                          return AppLocalizations.of(context)
                                              .errorFormatPassword2;
                                        }
                                      } else {
                                        return AppLocalizations.of(context)
                                            .errorFormatPassword3;
                                      }
                                    }
                                  },
                                  obscureText: passwordVisible,
                                  controller: _controllerPassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  inputFormatters: inputMaxLine(),
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)
                                        .repeatPassword,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white60),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 17.0, color: Colors.white60),
                                    labelStyle: TextStyle(
                                        fontSize: 17.0, color: Colors.white60),
                                    //  hintText: claveString,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        passwordVisibleRepeat
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          passwordVisibleRepeat =
                                              !passwordVisibleRepeat;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                          .complete;
                                    } else {
                                      if (value.trim().length >= 8 &&
                                          value.trim().length <= 15) {
                                        if (_controllerRepeatPassword.text
                                                .trim()
                                                .length ==
                                            0) {
                                          return null;
                                        } else {
                                          if (_controllerPassword.text ==
                                              value) {
                                            if (isPasswordCompliant(
                                                    _controllerPassword.text
                                                        .toString(),
                                                    6) ==
                                                true) {
                                              return null;
                                            } else {
                                              return AppLocalizations.of(
                                                      context)
                                                  .errorFormatPassword1;
                                            }
                                            // return null;
                                          } else {
                                            return AppLocalizations.of(context)
                                                .errorFormatPassword2;
                                          }
                                        }
                                      } else {
                                        return AppLocalizations.of(context)
                                            .errorFormatPassword3;
                                      }
                                    }
                                  },
                                  obscureText: passwordVisibleRepeat,
                                  controller: _controllerRepeatPassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    // isPasswordCompliant(
                                    //   _controllerPassword.text.toString(), 6);
                                    if (_formKey.currentState.validate()) {
                                      print("prueba4");

                                      String phone = _controllerPhone.text;
                                      String email = _controllerEmail.text;
                                      String password =
                                          _controllerPassword.text;
                                      String repeatPassword =
                                          _controllerRepeatPassword.text;
                                      ReduxSignUp.init();
                                      // ReduxSignUp.store.dispatch(action)

                                      var api = endPointApi();
                                      asinc() async {
                                        Store<AppState> store =
                                            await createStore(api: api);

                                        store.dispatch(UserSignUpAction(
                                            context,
                                            email,
                                            password,
                                            phone,
                                            "es",
                                            "true"));
                                      }

                                      asinc();

                                      //alertConfirmNumber2(context);
                                    }
                                  },
                                  child: widgetButton(
                                      AppLocalizations.of(context).signUp,
                                      Colors.white,
                                      AppColors.primaryColor)),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, loginRoute,
                                        arguments: 'Data from home');
                                  },
                                  child: widgetButton(
                                      AppLocalizations.of(context).login,
                                      Colors.white,
                                      AppColors.primaryColor)),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    alertCalculate(context);
                                  },
                                  child: widgetButtonIcon(
                                      AppLocalizations.of(context).calculator,
                                      assetsCalculator)),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  alertForgortPassword(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context).forgotPassword,
                                  style: styleText(20, Colors.white, true),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          //  Expanded(child: SizedBox(),),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {
      var api = endPointApi();
      AppSharedPreference().getIdUserSignUp().then((value) {
        if (value != false) {
          modelSignUpSharedPreferences dataModel = value;
          AppSharedPreference().getIdUserSignUpComplete().then((value) {
            if (value == 1) {
              async() async {
                Store<AppState> store = await createStore(api: api);

                store.dispatch(
                    UserSignUpActionRepeatSmsEmail(context, dataModel.id, true, "en"));
              }

              async();

              alertConfirmNumber2(
                 context, dataModel.id, dataModel.phone);
            }
            if (value == 2) {
              async() async {
                Store<AppState> store = await createStore(api: api);

                store.dispatch(
                    UserSignUpActionRepeatSms(context, dataModel.id));
              }

              async();


              alertConfirmNumber(context, dataModel.id, "1");
            }
          });
        }
      });
    });
  }
}

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
import 'package:flutter_redux/flutter_redux.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
int estadoLogin;
final _formKey = GlobalKey<FormState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      body: StoreProvider<AppStateLogin>(
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
                  decoration: background(),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: KeyboardActions(
                        config: buildConfig(context),
                        child: ListView(
                          children: [
                            widgetLanguage(context),
                            SizedBox(
                              height: 80,
                            ),

                            //Expanded(child: SizedBox(),),
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
                                  AppLocalizations.of(context).login,
                                  style: styleText(18, Colors.white, true),
                                ),

                                Container(
                                  child: TextFormField(

                                      style: TextStyle(color: Colors.white),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return AppLocalizations.of(context).complete;
                                        } else {
                                          if (isEmail(value)) {
                                            return null;
                                          } else {
                                            return AppLocalizations.of(context).errorFormat;
                                          }
                                        }
                                      },
                                      inputFormatters: inputMaxLine(),
                                      controller: _controllerEmail,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () => node.nextFocus(),
                                      decoration: decorationTextfield(AppLocalizations.of(context).email)),
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white60),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      labelText: AppLocalizations.of(context).password,
                                      hintStyle: TextStyle(
                                          fontSize: 17.0, color: Colors.white60),
                                      labelStyle: TextStyle(
                                          fontSize: 17.0, color: Colors.white60),
                                      //  hintText: claveString,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:Colors.white,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
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

                                        var api = endPointApi();
                                        String email = _controllerEmail.text;
                                        String password = _controllerPassword.text;
                                        firme() async {
                                          Store<AppState> store = await createStore(api: api);

                                          store.dispatch(LoginAction(context,email,password));

                                        }
                                        firme();

                                        //endPointApi api = endPointApi();
                                        // api.loginUser(_controllerEmail.text,_controllerPassword.text);
                                       Navigator.pushNamed(context, homeRoutes,
                                           arguments: 'Data from home');
                                        //alertConfirmNumber(context);
                                      }
                                    },
                                    child: widgetButton(AppLocalizations.of(context).login,Colors.white,AppColors.primaryColor)),
                                SizedBox(
                                  height: 30,
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
              }))




    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}

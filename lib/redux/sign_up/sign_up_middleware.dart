import 'dart:async';

import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/data/models/location/locationCountry.dart';
import 'package:ecloudatm/data/models/location/locationCountryState.dart';
import 'package:ecloudatm/data/models/signup/signupModel.dart';
import 'package:ecloudatm/data/models/signupSharedPreferences/signupModel.dart';
import 'package:ecloudatm/data/models/stackUser/stackUser.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/sharedPreferences/sharedPreferences.dart';
import 'package:ecloudatm/ui/sign_up/completeInformation.dart';
import 'package:ecloudatm/utils/alert.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';

//import '../app/app_state.dart';
import '../common_actions.dart';

import 'sign_up_actions.dart';

class SignUpMiddleware extends MiddlewareClass<AppState> {
  SignUpMiddleware(this.api);

  final endPointApi api;

  @override
  Future<void> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is UserSignUpAction) {
      await _userSignUp(next, action, store);
    }
    if (action is UserSignUpActionValidateSms) {
      await _userSignUpValidateSms(next, action, store);
    }
    if (action is UserSignUpActionRepeatSms) {
      await _userSignUpRepeatSms(next, action, store);
    }
    if (action is UserSignUpActionRecoverPassword) {
      await _userRecoverPassword(next, action, store);
    }
    if (action is UserSignUpActionComplete) {
      await _userSignUpComplete(next, action, store);
    }

    if (action is UserSignUpActionRepeatSmsEmail) {
      await _userSignUpRepeatSmsEmail(next, action, store);
    }
    if (action is UserSignUpActionValidateSmsEmail) {
      await _userSignUpValidateSmsEmail(next, action, store);
    }
    if (action is UserSignUpStackUser) {
      await _userStack(next, action, store);
    }

    if (action is UserLocationIp) {
      await _userLocationIp(next, action, store);
    }
    if (action is UserCountryHome) {
      await _userGetCountry(next, action, store);
    }

    if (action is UserCountryHomeLocation) {
      await _userGetCountryLocation(next, action, store);
    }
  }

  Future<void> _userGetCountry(NextDispatcher next, UserCountryHome action,
      Store<AppState> store) async {
    showProgressGlobal(action.context);
    print("prueba230");
    try {
      var response = await api.userGetCountry(action);
      fuctionBack(action.context);

      print("prueba3" + response.data.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          print(response.data.length.toString());
          List<modelLocationCountry> list = response.data;
          store.dispatch(
            SetPostsStateActionSignUp(
              PostsStateSignUp(
                listCountry: list,
              ),
            ),
          );
          print("prueba240:" + store.state.signUpState.listCountry.toString());
          break;
        case AppSettings.statusCodeError:
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userGetCountryLocation(NextDispatcher next,
      UserCountryHomeLocation action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    print("prueba230");
    try {
      var response = await api.userGetCountryLocation(action);
      fuctionBack(action.context);

      print("prueba3" + response.data.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          print(response.data.length.toString());
          List<modelLocationCountryState> list = response.data;
          store.dispatch(
            SetPostsStateActionSignUp(
              PostsStateSignUp(
                listCountryState: list,
              ),
            ),
          );
          print("prueba240:" + store.state.signUpState.listCountry.toString());
          break;
        case AppSettings.statusCodeError:
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userLocationIp(
      NextDispatcher next, UserLocationIp action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.locationIp(action);
      fuctionBack(action.context);

      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          alertForgortPassword2(action.context);
          break;
        case AppSettings.statusCodeError:
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userRecoverPassword(NextDispatcher next,
      UserSignUpActionRecoverPassword action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.recoverPassword(action.email, action.language);
      fuctionBack(action.context);
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          alertForgortPassword2(action.context);
          break;
        case AppSettings.statusCodeError:
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userStack(NextDispatcher next, UserSignUpStackUser action,
      Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.stackUser(action);
      fuctionBack(action.context);
      print("prueba3" + response.data.toString());
      modelStackUser data = response.data;
      print("prueba" + data.checked_mobil.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          if (data.checked_email == false) {
            async() async {
              Store<AppState> store = await createStore(api: api);

              store.dispatch(UserSignUpActionRepeatSmsEmail(
                  action.context, action.id, true, "en"));
            }

            async();

            alertConfirmNumber2(action.context, action.id, action.phone);
          } else {
            if (data.checked_mobil == false) {
              async() async {
                Store<AppState> store = await createStore(api: api);

                store.dispatch(
                    UserSignUpActionRepeatSms(action.context, action.id));
              }

              async();

              alertConfirmNumber(action.context, action.id, action.phone);
            } else {
              if (data.confirmed == false) {
                Navigator.pushNamedAndRemoveUntil(
                    action.context, completeInformationRoute, (r) => false);
              } else {
                AppSharedPreference().setIdUserSignUpClear("id");
              }
            }
          }

          break;
        case AppSettings.statusCodeError:
          AlertWidget().message(action.context, response.message);
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  // AlertWidget alertWidget = new AlertWidget();
  Future<void> _userSignUpRepeatSms(NextDispatcher next,
      UserSignUpActionRepeatSms action, Store<AppState> store) async {
    showProgressGlobal(action.context);

    try {
      var response = await api.repeatSms(action.number);
      fuctionBack(action.context);
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            AlertWidget().message(action.context, response.message);
          } else {
            AlertWidget().message(action.context, response.message);
          }
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userSignUpRepeatSmsEmail(NextDispatcher next,
      UserSignUpActionRepeatSmsEmail action, Store<AppState> store) async {
    //   showProgressGlobal(action.context, true);

    try {
      var response = await api.repeatSmsEmail(action);
      //showProgressGlobal(action.context, false);
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            AlertWidget().message(action.context, response.message);
          } else {
            AlertWidget().message(action.context, response.message);
          }
          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userSignUpValidateSms(NextDispatcher next,
      UserSignUpActionValidateSms action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.validateSms(action.number, action.sms);
      print("prueba3" + response.statusCode.toString());

      fuctionBack(action.context);

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          fuctionBack(action.context);

          Navigator.pushNamedAndRemoveUntil(
              action.context, completeInformationRoute, (r) => false,
              arguments: completeInformationPage(
                phone: action.id,
                id: int.parse(action.number),
                codePhone: action.number,
              ));
          //  Navigator.pushNamed(action.context, completeInformationRoute,
          //    arguments: 'Data from home');

          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          AlertWidget().message(action.context, response.message);
          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userSignUpValidateSmsEmail(NextDispatcher next,
      UserSignUpActionValidateSmsEmail action, Store<AppState> store) async {
    showProgressGlobal(action.context);

    try {
      var response = await api.validateSmsEmail(action);
      print("prueba3" + response.statusCode.toString());

      fuctionBack(action.context);

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          if (response.data != null) {
            fuctionBack(action.context);
            alertConfirmNumber(action.context, action.id, action.phone);
          } else {
            AlertWidget().message(action.context, response.message);
          }
          break;
        case AppSettings.statusCodeError:
          AlertWidget().message(action.context, response.message);
          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userSignUpComplete(NextDispatcher next,
      UserSignUpActionComplete action, Store<AppState> store) async {
    showProgressGlobal(action.context);

    try {
      var response = await api.addUserComplete(action);
      print("prueba3" + response.statusCode.toString());
      fuctionBack(action.context);
      // Navigator.pushNamed(action.context, completeInformationRoute,
      // arguments: 'Data from home');

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          Navigator.pushNamedAndRemoveUntil(
              action.context, homeRoutes, (r) => false);
          break;
        case AppSettings.statusCodeError:
          AlertWidget().message(action.context, response.message.toString());

          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }

  Future<void> _userSignUp(NextDispatcher next, UserSignUpAction action,
      Store<AppState> store) async {
    showProgressGlobal(action.context);

    try {
      var response = await api.addUser(action.email, action.password,
          "+1" + action.mobile, action.language, action.isMobileApp);
      print("prueba3" + response.statusCode.toString());
      fuctionBack(action.context);

      //  print("prueba7"+data.id.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);
          modelSignUp data = response.data;
          print("pruebaid" + data.id.toString());
          alertConfirmNumber2(
              action.context, data.id.toString(), action.mobile.toString());
          store.dispatch(UserSignUpActionRepeatSmsEmail(
              action.context,
              data.id.toString(),
              true,
              AppLocalizations.of(action.context).languageString));

          AppSharedPreference().setIdUserSignUp("id", data.id.toString());

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            print("prueba6ofi");
          } else {
            print("prueba8ofi");
            AlertWidget().message(action.context, response.message.toString());
          }

          break;
        default:
      }
    } catch (e) {
      fuctionBack(action.context);
      print(e);
    }
  }
}

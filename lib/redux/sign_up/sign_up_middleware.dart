import 'dart:async';

import 'package:ecloudatm/data/models/signup/signupModel.dart';
import 'package:ecloudatm/data/models/signupSharedPreferences/signupModel.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/sharedPreferences/sharedPreferences.dart';
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
  }

  Future<void> _userRecoverPassword(NextDispatcher next,
      UserSignUpActionRecoverPassword action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.recoverPassword(action.email, action.language);
      fuctionBack(action.context);
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case 200:
          AlertWidget().message(action.context, response.message);
          alertForgortPassword2(action.context);
          break;
        case 422:
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
        case 200:
          AlertWidget().message(action.context, response.message);

          break;
        case 422:
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
        case 200:
         // AlertWidget().message(action.context, response.message);

          break;
        case 422:
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

      fuctionBack(action.context);
      AppSharedPreference(). setIdUserSignUpComplete(3);
      Navigator.pushNamed(action.context, completeInformationRoute,
          arguments: 'Data from home');

      switch (response.statusCode) {
        case 201:
          if (response.data != null) {
          //  Navigator.pushNamed(action.context, completeInformationRoute,
            //    arguments: 'Data from home');
          } else {
            AlertWidget().message(action.context, response.message);
          }
          break;
        case 401:
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
      AppSharedPreference(). setIdUserSignUpComplete(2);
      alertConfirmNumber(action.context, action.id, action.token);
      switch (response.statusCode) {
        case 201:
          if (response.data != null) {
          } else {
            AlertWidget().message(action.context, response.message);
          }
          break;
        case 401:
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
    AppSharedPreference(). setIdUserSignUpComplete(4);

    try {
      var response = await api.addUserComplete(action);
      print("prueba3" + response.statusCode.toString());
      fuctionBack(action.context);
      // Navigator.pushNamed(action.context, completeInformationRoute,
        // arguments: 'Data from home');
      Navigator.pushNamedAndRemoveUntil(
          action.context, homeRoutes, (r) => false);
      switch (response.statusCode) {
        case 200:
          AlertWidget().message(action.context, response.message);

          break;
        case 401:
          if (response.data != null) {
            print("prueba6");
            var api = endPointApi();

            print("prueba7");

          } else {
            print("prueba8");

          }



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
          "+57" + action.mobile, action.language, action.isMobileApp);
      print("prueba3" + response.statusCode.toString());
      fuctionBack(action.context);
      modelSignUp data = response.data;

      print("prueba7");

        store.dispatch(UserSignUpActionRepeatSmsEmail(
            action.context, "258", true,"en"));
     // modelSignUpSharedPreferences dataShared = new modelSignUpSharedPreferences()

      AppSharedPreference().setIdUserSignUp("id","258");



      alertConfirmNumber2(action.context, "258", action.mobile.toString());
      switch (response.statusCode) {
        case 200:
          AlertWidget().message(action.context, response.message);

          break;
        case 401:
          if (response.data != null) {
            print("prueba6");

          } else {
            print("prueba8");

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

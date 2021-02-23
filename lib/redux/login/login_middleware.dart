import 'dart:async';

import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/utils/alert.dart';
import 'package:ecloudatm/utils/utils.dart';
import 'package:ecloudatm/utils/widget.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

//import '../app/app_state.dart';
import '../common_actions.dart';

import 'login_actions.dart';

class LoginMiddleware extends MiddlewareClass<AppState> {
  LoginMiddleware(this.api);

  final endPointApi api;

  @override
  Future<void> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is LoginAction) {
      await _Login(next, action, store);
    }
    if (action is LoginActionRecoverPasswordToken) {
      await _LoginValidateToken(next, action, store);
    }
    if (action is LoginActionSaveNewPassword) {
      await _LoginSaveNewPassword(next, action, store);
    }
  }

  // AlertWidget alertWidget = new AlertWidget();

  Future<void> _Login(
      NextDispatcher next, LoginAction action, Store<AppState> store) async {
    showProgressGlobal(action.context);
    try {
      var response = await api.loginUser(
        action.email,
        action.password,
      );
      fuctionBack(action.context);

      print("prueba3" + response.statusCode.toString());
      switch (response.statusCode) {
        case 200:

            Navigator.pushNamedAndRemoveUntil(
                action.context, homeRoutes, (r) => false);


          break;
        case AppSettings.statusCodeError:

            AlertWidget().message(action.context, response.message);


          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _LoginValidateToken(NextDispatcher next,
      LoginActionRecoverPasswordToken action, Store<AppState> store) async {
    try {
      var response = await api.resetPasswordValidateToken(
        action.id,
        action.token,
      );
      print("prueba3" + response.message.toString());

      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case AppSettings.statusCodeError:
          if (response.data != null) {
            Navigator.pushNamed(action.context, homeRoutes,
                arguments: 'Data from home');
          } else {
            AlertWidget().message(action.context, response.message);
          }
          // alertConfirmNumber2(action.context);
          // alertForgortPassword3(action.context);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _LoginSaveNewPassword(NextDispatcher next,
      LoginActionSaveNewPassword action, Store<AppState> store) async {
    try {
      var response = await api.loginUser(
        action.id,
        action.token,
      );
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case AppSettings.statusCodeSuccess:
          AlertWidget().message(action.context, response.message);

          break;
        case 422:
          AlertWidget().message(action.context, response.message);

          break;
        default:
          AlertWidget().message(action.context, response.message);
      }
    } catch (e) {
      print(e);
    }
  }
}

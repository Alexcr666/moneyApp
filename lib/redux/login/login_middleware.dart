import 'dart:async';

import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/utils/alert.dart';
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
  }

  // AlertWidget alertWidget = new AlertWidget();

  Future<void> _Login(NextDispatcher next, LoginAction action,
      Store<AppState> store) async {
    try {
      var response = await api.loginUser(
        action.email,
        action.password,
      );
      print("prueba3" + response.message.toString());
      switch (response.statusCode) {
        case 200:
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

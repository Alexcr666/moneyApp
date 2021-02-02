import 'dart:async';


import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/utils/alert.dart';
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
  }
 // AlertWidget alertWidget = new AlertWidget();


  Future<void> _userSignUp(NextDispatcher next, UserSignUpAction action,
      Store<AppState> store) async {

    try {
      var response = await api.addUser(action.email, action.password,
          action.mobile, action.language, action.isMobileApp);
      print("prueba3"+response.message.toString());
      switch (response.statusCode) {
        case 200:
          AlertWidget().message(action.context,response.message);

          break;
        case 422:
          AlertWidget().message(action.context,response.message);

          break;
        default:
      }
    } catch (e) {
      print(e);
    }
  }
}

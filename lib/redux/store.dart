import 'dart:async';


import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/redux/login/login_middleware.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_middleware.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'app/app_reducer.dart';
import 'app/app_state.dart';



/*Persistor<AppState> createPersistor(String key) => Persistor<AppState>(
    storage: new WebStorage(key),
    serializer: JsonSerializer<AppState>(AppState.rehydrationJSON));*/
@immutable
class AppStateCheckoutSlit {
  final PostsStateSignUp postsState;

  AppStateCheckoutSlit({
    @required this.postsState,
  });

  AppStateCheckoutSlit copyWith({
    PostsStateSignUp postsState,
  }) {
    return AppStateCheckoutSlit(
      postsState: postsState ?? this.postsState,
    );
  }
}
Future<Store<AppState>> createStore(
    {endPointApi api, Persistor<AppState> persistor}) async {
  var prefs = await SharedPreferences.getInstance();
  AppState initialState;

  try {
    initialState = await persistor.load();
  } catch (e) {
    initialState = AppState.initial();
  }

  Store<AppState> store = Store(appReducer,
      initialState: initialState ?? AppState.initial(),
      distinct: true,
      middleware: [
        SignUpMiddleware(api),
LoginMiddleware(api),


      //  persistor.createMiddleware(),
      ]);
  api.loadStore(store);
  return store;
}

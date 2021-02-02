
import 'package:ecloudatm/redux/common_actions.dart';
import 'package:ecloudatm/redux/login/login_state.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';







class LoginAction extends ErrorAction {
  LoginAction(BuildContext context, this.email,this.password) : super(context);
final String email;
final String password;



}

@immutable
class SetPostsStateActionLogin {
  final PostsStateLogin postsState;

  SetPostsStateActionLogin(this.postsState);
}



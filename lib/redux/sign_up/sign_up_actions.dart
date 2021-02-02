
import 'package:ecloudatm/redux/common_actions.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';







class UserSignUpAction extends ErrorAction {
  UserSignUpAction(BuildContext context, this.email,this.password,this.mobile,this.language,this.isMobileApp) : super(context);
final String email;
final String password;
final String mobile;
final String language;
final String isMobileApp;


}

@immutable
class SetPostsStateActionSignUp {
  final PostsStateSignUp postsState;

  SetPostsStateActionSignUp(this.postsState);
}



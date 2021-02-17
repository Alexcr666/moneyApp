import 'package:ecloudatm/redux/common_actions.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

class UserSignUpAction extends ErrorAction {
  UserSignUpAction(BuildContext context, this.email, this.password, this.mobile,
      this.language, this.isMobileApp)
      : super(context);
  final String email;
  final String password;
  final String mobile;
  final String language;
  final String isMobileApp;
}

class UserSignUpActionComplete extends ErrorAction {
  UserSignUpActionComplete(
      BuildContext context,
      this.id,
      this.mobile,
      this.names,
      this.surnames,
      this.postalCode,
      this.city,
      this.address,
      this.adress2ndLine,
      this.birthdate,
      this.locationId,
      this.levelLocation)
      : super(context);
  final String id;
  final String mobile;
  final String names;
  final String surnames;
  final String postalCode;
  final String city;
  final String address;
  final String adress2ndLine;
  final String birthdate;
  final String locationId;
  final String levelLocation;
}

class UserSignUpActionValidateSms extends ErrorAction {
  UserSignUpActionValidateSms(BuildContext context, this.number, this.sms)
      : super(context);
  final String number;
  final String sms;
}

class UserSignUpActionValidateSmsEmail extends ErrorAction {
  UserSignUpActionValidateSmsEmail(BuildContext context, this.id, this.token)
      : super(context);
  final String id;
  final String token;
}

class UserSignUpActionRepeatSms extends ErrorAction {
  UserSignUpActionRepeatSms(BuildContext context, this.number) : super(context);
  final String number;
}

class UserSignUpActionRepeatSmsEmail extends ErrorAction {
  UserSignUpActionRepeatSmsEmail(
      BuildContext context, this.number, this.mobileApp, this.language)
      : super(context);
  final String number;
  final bool mobileApp;
  final String language;
}

class UserSignUpActionRecoverPassword extends ErrorAction {
  UserSignUpActionRecoverPassword(
      BuildContext context, this.email, this.language)
      : super(context);
  final String email;
  final String language;
}
class UserSignUpStackUser extends ErrorAction {
  UserSignUpStackUser(
      BuildContext context, this.id,this.phone,this.email)
      : super(context);
  final String id;
  final String phone;
  final String email;

}

class UserSignUpActionRecoverPasswordToken extends ErrorAction {
  UserSignUpActionRecoverPasswordToken(
      BuildContext context, this.id, this.token)
      : super(context);
  final String id;
  final String token;
}

class UserSignUpActionSaveNewPassword extends ErrorAction {
  UserSignUpActionSaveNewPassword(BuildContext context, this.id, this.token)
      : super(context);
  final String id;
  final String token;
}

@immutable
class SetPostsStateActionSignUp {
  final PostsStateSignUp postsState;

  SetPostsStateActionSignUp(this.postsState);
}

import 'dart:convert';
import 'dart:io';

import 'package:ecloudatm/app/app_constants.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/data/models/location/location.dart';
import 'package:ecloudatm/data/models/signup/signupModel.dart';
import 'package:ecloudatm/data/models/stackUser/stackUser.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/sign_up_actions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:redux/redux.dart';

class endPointApi {
  endPointApi();

  Store<AppState> store;

  Future<void> loadStore(Store<AppState> store) async {
    this.store = store;
  }

  static const bool debug = AppSettings.debug;
  static const String version = AppSettings.version;
  static const String mnt = '';
  static const String baseUrl = AppSettings.debug
      ? 'bankservices.ecloudatm.com'
      : 'bankservices.ecloudatm.com';
  static const String LOCATION_IP =
      "https://ezcmd.com/apps/api_ezip_locator/lookup/a2ba65fb6a3074ea2e76615edfbba95e/501/{}";

  static const endPointsetNewUser = "/users/new";
  static const endPointloginUser = "/users/authenticate";

//static final BASE_URL = "https://bankservices.ecloudatm.com/";

  static final LOGIN_EMAIL_URL = "users/authenticate";
  static final LOGIN_GOOGLE_URL = "auth/rrss/authenticate-user";
  static final REGISTER_EMAIL_URL = "users/new";
  static final RECOVER_PASSWORD_URL = "/auth/recoverPassword";

  static final RESET_PASSWORD_LOGIN_URL = "/auth/reset-password-verify";
  static final SAVE_NEW_PASSWORD_URL = "auth/save-new-password";

  static final REGISTER_GOOGLE_URL = "auth/rrss/new-user";
  static final FIND_BY_ID_URL = "users/findbyid";
  static final SEND_CODE_MOBILE_URL = "users/sendcodemobile";
  static final SEND_CODE_MOBILE_EMAIL = "users/requestEmailValidation";

  static final VERIFY_CODE_MOBILE_URL = "users/validatecodesms";
  static final VERIFY_EMAIL_URL = "users/verifyemail";
  static final STATE_STACK_USER = "users/getUserByIdSignUp?userId={}";
  static final STATES_URL = "services/states";
  static final PROVINCE_CITY_URL = "services/locations";
  static final COMPLETE_URL = "users/complete";
  static final CURRENCIES_URL = "services/currencies";
  static final ID_TYPES_URL = "services/idtypes"; //must add /:countryisocode
  static final BANK_LIST_URL =
      "services/banks"; //Must add /:countryisocode/:language
  static final ADD_BANK_ACCOUNT_URL = "users/addbankaccount";
  static final VALIDATE_DOCUMENT_ID_URL = "users/validateDocumentId";
  static final TYPE_PAYMENTS_URL = "transactions/list-type-payments";
  static final LIST_USER_AACOUNTS_URL = "partners/become/listuseraccounts";
  static final CALCULATOR_URL = "calculator/calculate";
  static final CALCULATOR_RATE_URL = "calculator/rate";
  static final SAVE_TRANSACTION_URL = "transactions/save-transaction";
  static final USER_BALANCE_URL = "users/user-balance";
  static final IS_PARTNER_URL = "partners/ispartner";
  static final ADD_PARTNER_URL = "partners/addpartner";
  static final TRANSACTIONS_PARTNER_URL = "transactions/partner";
  static final TRANSACTIONS_USER_URL = "transactions/user";
  static final PARTNER_ASSIGNED_TRANSACTIONS_URL =
      "partners/partnerTransactions";
  static final ASSIGN_TRANSACTION_URL = "partners/assignTransaction";
  static final PARTNER_ACCOUNT_TO_USE_URL =
      "transactions/transaction/partner-accounts-to-use";
  static final BY_TYPE_AND_STATU_URL =
      "transactions/transaction/by-type-and-status";
  static final TRANSACTIONS_SET_STATUS_URL =
      "transactions/transaction-set-status";
  static final TRANSACTIONS_SAVE_E_PAY_URL =
      "transactions/save-payments/e-transfer";
  static final QUALIFY_USER_URL = "transactions/qualify-step-three";
  static final QUALIFY_PARTNER_URL = "transactions/qualify-step-four";
  static final TRANSACTIONS_WAITING_FOR_PARTNER_URL =
      "transactions/waiting-for-partner";
  static final TRANSACTIONS_WAITING_FOR_USER_URL =
      "transactions/partner/assigned-waiting-for-user";
  static final VALIDATE_EMAIL_SEND_MONEY_URL = "users/validate-email-banking";
  static final DIRECT_TRANSFERS_URL = "transactions/direc-transfer";
  static final CLOSED_TRANSACTIONS_URL =
      "transactions/client-closed-transactions";
  static final FLAGS_URL = "en/assets/img/flags/1x1";
  static final USERS_LOG_OUT = "users/logout";
  static final TRANSACTIONS_SENT_BY_PARTNER = "transactions/send-by-user";
  static final TRANSACTIONS_RECEIVED_BY_PARTNER =
      "transactions/receive-by-user";
  static final USERS_UPLOAD_IMAGE_PROFILE = "users/upload-image-profile";
  static final USERS_GET_PROFILE_PHOTO = "users/get-image-profile";
  static final GET_PARTNER_CLOSED_TRANSACTIONS =
      "transactions/listClosedTransactions";
  static final CASH_GET_USER_DATA_URL = "transactions/cash/get-user-data";
  static final CASH_GET_PARTNER_DATA_URL = "transactions/cash/get-partner-data";
  static final SAVE_CASH_STEP_ONE_URL =
      "transactions/cash/update-status-step-one";
  static final SAVE_CASH_STEP_TWO_URL =
      "transactions/cash/update-status-step-two";
  static final CANCEL_TRANSACTION_URL = "transactions/report-transaction";
  static final UPDATE_BANK_ACCOUNT_URL = "admin/bank-accounts/update";
  static final DELETE_BANK_ACCOUNT_URL = "admin/bank-accounts/delete";
  static final ACCOUNT_MIN_MAX_URL = "partners/become/accountminmax";
  static final CALCULATOR_NEW_TRX_URL = "calculator/calculateTransactionNew";
  static final GET_VOUCHER_IMAGE_URL = "transactions/get-image-etransfer";
  static final SET_FCM_TOKEN = "admin/update-firebase-token";
  static final COUNTRY_LIST_URL = "services/countries";

  // For ip locating
  static final URL_IP_JSON = "https://ipapi.co/json";

  /* Store<AppState> store;


  GlobalKey<NavigatorState> navigatorKey;

  Future<void> loadStore(Store<AppState> store) async {
    this.store = store;
  }*/
  Future<MyHttpResponse> loginUser(String user, String password) async {
    var url = Uri.https(baseUrl, endPointloginUser);
    print(url.toString());

    Map<String, String> params;

    params = {
      AppConstants.emailKey: user,
      AppConstants.passwordKey: password,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);

    if (response.data[AppConstants.statusKey] == AppConstants.successKey) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    //var response = await http2.post(url,
    //  body: utf8.encode(json.encode(params)));
    /*MyHttpResponse response = await postRequest(url, jsonMap: params);

    if (response.data[AppConstants.statusKey] == AppConstants.successKey) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }*/
    print("prueba1:" + response.data.toString());

    return response;
  }

  Future<MyHttpResponse> addUserComplete(UserSignUpActionComplete data) async {
    var url = Uri.https(baseUrl, endPointsetNewUser);

    Map params;

    params = {
      AppConstants.idKey: data.id,
      AppConstants.mobileKey: data.mobile,
      AppConstants.namesKey: data.names,
      AppConstants.surnamesKey: data.surnames,
      AppConstants.postalCodeKey: data.postalCode,
      AppConstants.cityKey: data.city,
      AppConstants.adddressKey: data.address,
      AppConstants.adress2ndLineKey: data.adress2ndLine,
      AppConstants.birthdateKey: data.birthdate,
      AppConstants.locationIdKey: data.locationId,
      AppConstants.levelLocationKey: data.levelLocation,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
      response.data =
          new modelSignUp.fromJson(response.data[AppConstants.userKey]);
      print("prueba3");
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;

      print("prueba4");
    }

    return response;
  }

  Future<MyHttpResponse> stackUser(UserSignUpStackUser data) async {
    var url = Uri.https(baseUrl, STATE_STACK_USER.replaceFirst("{}", data.id)).toString();

    MyHttpResponse response = await getRequest(url);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
      response.data = new modelStackUser.fromJson(
          response.data[AppConstants.dataKey][AppConstants.resultKey]);
      print("prueba3ofi");
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;

      print("prueba4ofi");
    }

    return response;
  }

  Future<MyHttpResponse> locationIp(UserLocationIp data) async {
    var url = Uri.https("", LOCATION_IP.replaceFirst("{}", data.ip)).toString();

    MyHttpResponse response = await getRequest(url);

    if (response.data[AppConstants.statusKey] == AppConstants.successKey) {
      response.message = response.data[AppConstants.messageKey];
      response.data =
          new modelLocation.fromJson(response.data[AppConstants.userKey]);
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> addUser(String email, String password, String mobile,
      String language, String ismobile) async {
    var url = Uri.https(baseUrl, endPointsetNewUser);

    Map params;

    params = {
      AppConstants.emailKey: email,
      AppConstants.passwordKey: password,
      AppConstants.mobileKey: mobile,
      AppConstants.languageKey: language,
      AppConstants.ismobileappKey: true,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
      response.data =
          new modelSignUp.fromJson(response.data[AppConstants.userKey]);
      print("prueba3ofiregistro");
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;

      print("prueba4ofiregistro");
    }

    return response;
  }

  Future<MyHttpResponse> validateSms(
    String number,
    String sms,
  ) async {
    var url = Uri.https(baseUrl, VERIFY_CODE_MOBILE_URL);

    Map params;

    params = {AppConstants.idKey: number, AppConstants.smsCodeKey: sms};

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> validateSmsEmail(
      UserSignUpActionValidateSmsEmail data) async {
    var url = Uri.https(baseUrl, VERIFY_EMAIL_URL);

    Map params;

    params = {AppConstants.idKey: data.id, AppConstants.tokenKey: data.token};

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> repeatSms(String number) async {
    var url = Uri.https(baseUrl, SEND_CODE_MOBILE_URL);

    Map params;

    params = {
      AppConstants.idKey: number,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> repeatSmsEmail(
      UserSignUpActionRepeatSmsEmail data) async {
    var url = Uri.https(baseUrl, SEND_CODE_MOBILE_EMAIL);

    Map params;

    params = {
      AppConstants.idKey: data.number,
      AppConstants.ismobileappKey: data.mobileApp,
      AppConstants.languageKey: data.language,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> recoverPassword(String email, String language) async {
    var url = Uri.https(baseUrl, RECOVER_PASSWORD_URL);

    Map params;

    params = {
      AppConstants.emailKey: email,
      AppConstants.languageKey: language,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> resetPasswordValidateToken(
      String id, String token) async {
    var url = Uri.https(baseUrl, RESET_PASSWORD_LOGIN_URL);

    Map params;

    params = {
      AppConstants.idKey: id,
      AppConstants.languageKey: token,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }

  Future<MyHttpResponse> saveNewPassword(String id, String token) async {
    var url = Uri.https(baseUrl, SAVE_NEW_PASSWORD_URL);

    Map params;

    params = {
      AppConstants.idKey: id,
      AppConstants.languageKey: token,
    };

    MyHttpResponse response = await postRequest(url, jsonMap: params);
    //print("prueba2: " + response.);

    if (response.data[AppConstants.successKey] == true) {
      response.message = response.data[AppConstants.messageKey];
    } else {
      response.message = response.data[AppConstants.messageKey];
      response.data = null;
    }

    return response;
  }
}

Future<MyHttpResponse> postRequest(Uri uri,
    {bool shouldRetry = true,
    Map jsonMap,
    Map additionalHeaders,
    bool mntFlag = true}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);
  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response =
      await http2.post(uri, body: json.encode(jsonMap), headers: headers);
  print("prueba2:" + response.body.toString());
  print("prueba3:" + json.encode(jsonMap).toString());
  // if (response.statusCode == 505 && shouldRetry) {
  // } else if (response.statusCode == 511) {}

  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data,
      message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> getRequest(String uri,
    {bool shouldRetry = true, Map additionalHeaders}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(uri.replaceAll("%3F", "?"));
print(uri.replaceAll("%3F", "?").toString());
  var data = json.decode(utf8.decode(response.bodyBytes));
  print(response.body);
  return MyHttpResponse(response.statusCode, data,
      message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

Future<MyHttpResponse> deleteRequest(
  Uri uri, {
  bool shouldRetry = true,
  Map additionalHeaders,
}) async {
  Map<String, String> headers = {
    // 'Authorization':
    //   "Bearer ${"" /*store.state.authState.initData.token*/ ?? ''}",
    'Content-Type': "application/json",
  };
  if (additionalHeaders != null) headers.addEntries(additionalHeaders.entries);

  final ioc = new HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http2 = new IOClient(ioc);
  var response = await http2.get(uri, headers: headers);

  var data = json.decode(utf8.decode(response.bodyBytes));
  return MyHttpResponse(response.statusCode, data,
      message: response.statusCode != 200 ? data[AppConstants.messageKey] : '');
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}

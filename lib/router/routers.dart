import 'package:ecloudatm/ui/MytransactionsPartner/MytransactionsPartnerPage.dart';
import 'package:ecloudatm/ui/addMoney/addMoney.dart';
import 'package:ecloudatm/ui/addYourBank/addYourBankPage.dart';
import 'package:ecloudatm/ui/bankList/bankListPage.dart';
import 'package:ecloudatm/ui/becomePartner/becomePartner.dart';
import 'package:ecloudatm/ui/codeQr/codeQr.dart';
import 'package:ecloudatm/ui/codeSegurity/codeSegurity.dart';
import 'package:ecloudatm/ui/completeInformation/completeInformation.dart';
import 'package:ecloudatm/ui/favoriteUser/favoriteUser.dart';

import 'package:ecloudatm/ui/home/home2.dart';
import 'package:ecloudatm/ui/home/user/user.dart';
import 'package:ecloudatm/ui/identityVeritication/identityVeriticatioPage.dart';
import 'package:ecloudatm/ui/intro/intro.dart';
import 'package:ecloudatm/ui/login/login.dart';
import 'package:ecloudatm/ui/opportunities/opportunitiesPage.dart';
import 'package:ecloudatm/ui/qr/qr.dart';
import 'package:ecloudatm/ui/qrPayment/qrPaymentPage.dart';
import 'package:ecloudatm/ui/reports/reports.dart';
import 'package:ecloudatm/ui/sendMoney/sendMoney.dart';
import 'package:ecloudatm/ui/sign_up/completeInformation.dart';
import 'package:ecloudatm/ui/sign_up/signUp.dart';
import 'package:ecloudatm/ui/transactiondetail/transactionDetailPage.dart';
import 'package:ecloudatm/ui/tutorial.dart';
import 'package:ecloudatm/ui/withdrawMoney/withdrawMoney.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String profileRoute = 'profile';
const String homeRoutes = "home";
const String homeRoutes2 = "home2";
const String loginRoute = "login";
const String signUpRoute = "signup";
const String sendMoneyRoute = "sendmoney";
const String addMoneyRoute = "addmoney";
const String reportsRoute = "reporst";
const String withdrawmoneyRoute = "withdrawmoney";
const String completeInformationRoute = "completeInformation";
const String qrRoute = "qr";
const String codeQrRoute = "codeQr";
const String becomePartnerRoute = "becomePartner";
const String bankListRoute = "bankListRote";
const String favoriteUserRoute = "favoriteUser";
const String addYourBankRoute = "addYourBank";
const String oportunitiesRoute = "oportunities";
const String qrPaymentRoute = "qrPayment";
const String transactionDetailPageRoute = "transactionDetail";
const String transactionDetailPartnerPageRoute = "transactionPartner";
const String identifityRoute = "identifity";
const String completeInformationUserRoute = "identifityComplete";
const String codeSegurityRoute = "codeSegurity";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case homeRoutes:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => profilePage());

      case signUpRoute:
        return MaterialPageRoute(builder: (_) => signUpPage());
      case completeInformationRoute:
        return MaterialPageRoute(builder: (_) => completeInformationPage());

      case sendMoneyRoute:
        return MaterialPageRoute(builder: (_) => sendMoneyPage());
      case addMoneyRoute:
        return MaterialPageRoute(builder: (_) => addMoneyPage());
      case withdrawmoneyRoute:
        return MaterialPageRoute(builder: (_) => withdrawMoneyPage());

      case reportsRoute:
        return MaterialPageRoute(builder: (_) => reportsPage());

      case qrRoute:
        return MaterialPageRoute(builder: (_) => QRViewExample());
      case codeQrRoute:
        return MaterialPageRoute(builder: (_) => codeQrPage());
      case becomePartnerRoute:
        return MaterialPageRoute(builder: (_) => becomePartnerPage());
      case bankListRoute:
        return MaterialPageRoute(builder: (_) => bankListPage());
      case favoriteUserRoute:
        return MaterialPageRoute(builder: (_) => favoriteUserPage());
      case addYourBankRoute:
        return MaterialPageRoute(builder: (_) => addYourBankPage());
      case oportunitiesRoute:
        return MaterialPageRoute(builder: (_) => oportunitiesPage());
      case qrPaymentRoute:
        return MaterialPageRoute(builder: (_) => qrPaymentPage());
      case transactionDetailPageRoute:
        return MaterialPageRoute(builder: (_) => transactionDetailPage());
      case identifityRoute:
        return MaterialPageRoute(builder: (_) => indentityVerificationPage());

      case completeInformationUserRoute:
        return MaterialPageRoute(builder: (_) => completeInformationUserPage());
      case codeSegurityRoute:
        return MaterialPageRoute(builder: (_) => codeSegurityPage());

      case transactionDetailPartnerPageRoute:
        return MaterialPageRoute(builder: (_) => transactionPartnerPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

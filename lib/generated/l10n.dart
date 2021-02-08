// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class AppLocalizations {
  AppLocalizations();
  
  static AppLocalizations current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      AppLocalizations.current = AppLocalizations();
      
      return AppLocalizations.current;
    });
  } 

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Hello mundo`
  String get helloWord {
    return Intl.message(
      'Hello mundo',
      name: 'helloWord',
      desc: '',
      args: [],
    );
  }

  /// `Paying has never been more simple, just scan the QR Code and get a reward`
  String get intro1 {
    return Intl.message(
      'Paying has never been more simple, just scan the QR Code and get a reward',
      name: 'intro1',
      desc: '',
      args: [],
    );
  }

  /// `Loading funds to your wallet is so simple, just link your bank account or use cash at the store to load your wallet`
  String get intro2 {
    return Intl.message(
      'Loading funds to your wallet is so simple, just link your bank account or use cash at the store to load your wallet',
      name: 'intro2',
      desc: '',
      args: [],
    );
  }

  /// `Sending money to your family or friends has never been more accessible and affordable`
  String get intro3 {
    return Intl.message(
      'Sending money to your family or friends has never been more accessible and affordable',
      name: 'intro3',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Complete field`
  String get complete {
    return Intl.message(
      'Complete field',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect format`
  String get errorFormat {
    return Intl.message(
      'Incorrect format',
      name: 'errorFormat',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `The password must have the following criteria: minimum 8 characters, minimum 15 characters, contain at least one uppercase letter, one lowercase letter, one space character.`
  String get errorFormatPassword1 {
    return Intl.message(
      'The password must have the following criteria: minimum 8 characters, minimum 15 characters, contain at least one uppercase letter, one lowercase letter, one space character.',
      name: 'errorFormatPassword1',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get errorFormatPassword2 {
    return Intl.message(
      'Passwords do not match',
      name: 'errorFormatPassword2',
      desc: '',
      args: [],
    );
  }

  /// `The password must be greater than 7 digits and less than 15`
  String get errorFormatPassword3 {
    return Intl.message(
      'The password must be greater than 7 digits and less than 15',
      name: 'errorFormatPassword3',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get repeatPassword {
    return Intl.message(
      'Repeat Password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Calculator`
  String get calculator {
    return Intl.message(
      'Calculator',
      name: 'calculator',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your Send`
  String get yoursend {
    return Intl.message(
      'Your Send',
      name: 'yoursend',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get promotions {
    return Intl.message(
      'Promotions',
      name: 'promotions',
      desc: '',
      args: [],
    );
  }

  /// `Statements`
  String get statements {
    return Intl.message(
      'Statements',
      name: 'statements',
      desc: '',
      args: [],
    );
  }

  /// `Send Money`
  String get sendmoney {
    return Intl.message(
      'Send Money',
      name: 'sendmoney',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Add money' key

  /// `Witchdraw`
  String get withdraw {
    return Intl.message(
      'Witchdraw',
      name: 'withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get partner {
    return Intl.message(
      'Partner',
      name: 'partner',
      desc: '',
      args: [],
    );
  }

  /// `Become a partner`
  String get becomepartner {
    return Intl.message(
      'Become a partner',
      name: 'becomepartner',
      desc: '',
      args: [],
    );
  }

  /// `My Transactions`
  String get mytransactions {
    return Intl.message(
      'My Transactions',
      name: 'mytransactions',
      desc: '',
      args: [],
    );
  }

  /// `Payment methods`
  String get paymentmethods {
    return Intl.message(
      'Payment methods',
      name: 'paymentmethods',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Change segurity pin`
  String get changeseguritypin {
    return Intl.message(
      'Change segurity pin',
      name: 'changeseguritypin',
      desc: '',
      args: [],
    );
  }

  /// `Favorite user`
  String get favoriteuser {
    return Intl.message(
      'Favorite user',
      name: 'favoriteuser',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Debit`
  String get debit {
    return Intl.message(
      'Debit',
      name: 'debit',
      desc: '',
      args: [],
    );
  }

  /// `Credit`
  String get credit {
    return Intl.message(
      'Credit',
      name: 'credit',
      desc: '',
      args: [],
    );
  }

  /// `Available Balance`
  String get availabreBalance {
    return Intl.message(
      'Available Balance',
      name: 'availabreBalance',
      desc: '',
      args: [],
    );
  }

  /// `My Banks`
  String get mybanks {
    return Intl.message(
      'My Banks',
      name: 'mybanks',
      desc: '',
      args: [],
    );
  }

  /// `Add payment method`
  String get addPaymentmethod {
    return Intl.message(
      'Add payment method',
      name: 'addPaymentmethod',
      desc: '',
      args: [],
    );
  }

  /// `Bank List`
  String get bankList {
    return Intl.message(
      'Bank List',
      name: 'bankList',
      desc: '',
      args: [],
    );
  }

  /// `Previous Pin`
  String get previouspin {
    return Intl.message(
      'Previous Pin',
      name: 'previouspin',
      desc: '',
      args: [],
    );
  }

  /// `New pin`
  String get newpin {
    return Intl.message(
      'New pin',
      name: 'newpin',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new pin`
  String get confirmnewpin {
    return Intl.message(
      'Confirm new pin',
      name: 'confirmnewpin',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Favorite User`
  String get favoriteUser {
    return Intl.message(
      'Favorite User',
      name: 'favoriteUser',
      desc: '',
      args: [],
    );
  }

  /// `Complete information`
  String get completeInformation {
    return Intl.message(
      'Complete information',
      name: 'completeInformation',
      desc: '',
      args: [],
    );
  }

  /// `Find a bank`
  String get findabank {
    return Intl.message(
      'Find a bank',
      name: 'findabank',
      desc: '',
      args: [],
    );
  }

  /// `More tan 14 banks area available`
  String get morebank {
    return Intl.message(
      'More tan 14 banks area available',
      name: 'morebank',
      desc: '',
      args: [],
    );
  }

  /// `Enter bank name`
  String get enterBankName {
    return Intl.message(
      'Enter bank name',
      name: 'enterBankName',
      desc: '',
      args: [],
    );
  }

  /// `Banks`
  String get banks {
    return Intl.message(
      'Banks',
      name: 'banks',
      desc: '',
      args: [],
    );
  }

  /// `Add your bank`
  String get addyourbanks {
    return Intl.message(
      'Add your bank',
      name: 'addyourbanks',
      desc: '',
      args: [],
    );
  }

  /// `Opportunities`
  String get opportunities {
    return Intl.message(
      'Opportunities',
      name: 'opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Add money`
  String get addmoney {
    return Intl.message(
      'Add money',
      name: 'addmoney',
      desc: '',
      args: [],
    );
  }

  /// `Recover Password`
  String get recoverPassword {
    return Intl.message(
      'Recover Password',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `input your email`
  String get inputyouremail {
    return Intl.message(
      'input your email',
      name: 'inputyouremail',
      desc: '',
      args: [],
    );
  }

  /// `you will receive an email with a code to reset your password.`
  String get recoverPasswordMessage {
    return Intl.message(
      'you will receive an email with a code to reset your password.',
      name: 'recoverPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Last login`
  String get lastlogin {
    return Intl.message(
      'Last login',
      name: 'lastlogin',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for partner`
  String get waitingforpartner {
    return Intl.message(
      'Waiting for partner',
      name: 'waitingforpartner',
      desc: '',
      args: [],
    );
  }

  /// `Valid user`
  String get validuser {
    return Intl.message(
      'Valid user',
      name: 'validuser',
      desc: '',
      args: [],
    );
  }

  /// `Send money`
  String get sendMoney {
    return Intl.message(
      'Send money',
      name: 'sendMoney',
      desc: '',
      args: [],
    );
  }

  /// `Exchange rate`
  String get exchangerate {
    return Intl.message(
      'Exchange rate',
      name: 'exchangerate',
      desc: '',
      args: [],
    );
  }

  /// `Total fee`
  String get totalfee {
    return Intl.message(
      'Total fee',
      name: 'totalfee',
      desc: '',
      args: [],
    );
  }

  /// `You send`
  String get yousend {
    return Intl.message(
      'You send',
      name: 'yousend',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Merchant`
  String get merchant {
    return Intl.message(
      'Merchant',
      name: 'merchant',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get Bank {
    return Intl.message(
      'Bank',
      name: 'Bank',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get Partner {
    return Intl.message(
      'Partner',
      name: 'Partner',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Calculate rate' key

  // skipped getter for the 'Scan qr' key

  /// `Withdraw money`
  String get withdrawmoney {
    return Intl.message(
      'Withdraw money',
      name: 'withdrawmoney',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw money with?`
  String get withdrawmonewith {
    return Intl.message(
      'Withdraw money with?',
      name: 'withdrawmonewith',
      desc: '',
      args: [],
    );
  }

  /// `Scan merchant qr`
  String get scanmerchantqr {
    return Intl.message(
      'Scan merchant qr',
      name: 'scanmerchantqr',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your information`
  String get pleasecompleteinformation {
    return Intl.message(
      'Please complete your information',
      name: 'pleasecompleteinformation',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enteryourpassword {
    return Intl.message(
      'Enter your password',
      name: 'enteryourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Is not you`
  String get itsnotyou {
    return Intl.message(
      'Is not you',
      name: 'itsnotyou',
      desc: '',
      args: [],
    );
  }

  /// `Calculate rate`
  String get calculateRate {
    return Intl.message(
      'Calculate rate',
      name: 'calculateRate',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `You will received`
  String get youwillreceived {
    return Intl.message(
      'You will received',
      name: 'youwillreceived',
      desc: '',
      args: [],
    );
  }

  /// `Add your bank`
  String get addyourbank {
    return Intl.message(
      'Add your bank',
      name: 'addyourbank',
      desc: '',
      args: [],
    );
  }

  /// `Step 1`
  String get step1 {
    return Intl.message(
      'Step 1',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `You can add more banks as you wish after being accepted as a Partner’ team member. all information you are submitting now is for your main account: xxxx-xxxx-6788`
  String get descriptionStep {
    return Intl.message(
      'You can add more banks as you wish after being accepted as a Partner’ team member. all information you are submitting now is for your main account: xxxx-xxxx-6788',
      name: 'descriptionStep',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to do`
  String get whatdoyouwanttodo {
    return Intl.message(
      'What do you want to do',
      name: 'whatdoyouwanttodo',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get deposit {
    return Intl.message(
      'Deposit',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  /// `Accept Cryptocurrencies`
  String get acceptCryptocurrencies {
    return Intl.message(
      'Accept Cryptocurrencies',
      name: 'acceptCryptocurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Validate code`
  String get validateCode {
    return Intl.message(
      'Validate code',
      name: 'validateCode',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changeLanguage {
    return Intl.message(
      'Change language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Send to other Banks`
  String get sendotherbank {
    return Intl.message(
      'Send to other Banks',
      name: 'sendotherbank',
      desc: '',
      args: [],
    );
  }

  /// `Switch currency`
  String get swichcurrency {
    return Intl.message(
      'Switch currency',
      name: 'swichcurrency',
      desc: '',
      args: [],
    );
  }

  /// `Amount to buy`
  String get ammouttobuy {
    return Intl.message(
      'Amount to buy',
      name: 'ammouttobuy',
      desc: '',
      args: [],
    );
  }

  /// `You will pay`
  String get youwillpay {
    return Intl.message(
      'You will pay',
      name: 'youwillpay',
      desc: '',
      args: [],
    );
  }

  /// `Scan qr`
  String get scanqr {
    return Intl.message(
      'Scan qr',
      name: 'scanqr',
      desc: '',
      args: [],
    );
  }

  /// `Add from bank account`
  String get addbankfromaccount {
    return Intl.message(
      'Add from bank account',
      name: 'addbankfromaccount',
      desc: '',
      args: [],
    );
  }

  /// `Save account`
  String get saveaccount {
    return Intl.message(
      'Save account',
      name: 'saveaccount',
      desc: '',
      args: [],
    );
  }

  /// `Add from bank account`
  String get addFromBankAccount {
    return Intl.message(
      'Add from bank account',
      name: 'addFromBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Redeem promotions`
  String get redeemPromotions {
    return Intl.message(
      'Redeem promotions',
      name: 'redeemPromotions',
      desc: '',
      args: [],
    );
  }

  /// `Input your new password`
  String get inputyournewpassword {
    return Intl.message(
      'Input your new password',
      name: 'inputyournewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Input your new password again`
  String get inputyournewpasswordagain {
    return Intl.message(
      'Input your new password again',
      name: 'inputyournewpasswordagain',
      desc: '',
      args: [],
    );
  }

  /// `Input your new password`
  String get yourpasswordformat {
    return Intl.message(
      'Input your new password',
      name: 'yourpasswordformat',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Guaranteed rate`
  String get guaranteedrate {
    return Intl.message(
      'Guaranteed rate',
      name: 'guaranteedrate',
      desc: '',
      args: [],
    );
  }

  /// `Saturday, October`
  String get date {
    return Intl.message(
      'Saturday, October',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for user`
  String get waitingforuser {
    return Intl.message(
      'Waiting for user',
      name: 'waitingforuser',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Statements report`
  String get statementsreport {
    return Intl.message(
      'Statements report',
      name: 'statementsreport',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Amounts`
  String get amounts {
    return Intl.message(
      'Amounts',
      name: 'amounts',
      desc: '',
      args: [],
    );
  }

  /// `Your fee`
  String get yourfee {
    return Intl.message(
      'Your fee',
      name: 'yourfee',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `ID Bank`
  String get idbank {
    return Intl.message(
      'ID Bank',
      name: 'idbank',
      desc: '',
      args: [],
    );
  }

  /// `Credit details`
  String get creditdetails {
    return Intl.message(
      'Credit details',
      name: 'creditdetails',
      desc: '',
      args: [],
    );
  }

  /// `you`
  String get you {
    return Intl.message(
      'you',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Transactions Type`
  String get transactionstype {
    return Intl.message(
      'Transactions Type',
      name: 'transactionstype',
      desc: '',
      args: [],
    );
  }

  /// `Total credit`
  String get totalcredit {
    return Intl.message(
      'Total credit',
      name: 'totalcredit',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Total credit`
  String get totalCredit {
    return Intl.message(
      'Total credit',
      name: 'totalCredit',
      desc: '',
      args: [],
    );
  }

  /// `Debit detail`
  String get debitdetail {
    return Intl.message(
      'Debit detail',
      name: 'debitdetail',
      desc: '',
      args: [],
    );
  }

  /// `Total Debit`
  String get totaldebit {
    return Intl.message(
      'Total Debit',
      name: 'totaldebit',
      desc: '',
      args: [],
    );
  }

  /// `Transactions Detail`
  String get transactionsdetail {
    return Intl.message(
      'Transactions Detail',
      name: 'transactionsdetail',
      desc: '',
      args: [],
    );
  }

  /// `BANK ACCOUNT`
  String get bankAccount {
    return Intl.message(
      'BANK ACCOUNT',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Partner name`
  String get partnerName {
    return Intl.message(
      'Partner name',
      name: 'partnerName',
      desc: '',
      args: [],
    );
  }

  /// `Select image`
  String get selectImage {
    return Intl.message(
      'Select image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary receive`
  String get beneficiaryreceive {
    return Intl.message(
      'Beneficiary receive',
      name: 'beneficiaryreceive',
      desc: '',
      args: [],
    );
  }

  /// `Terms and coditions`
  String get termsandconditions {
    return Intl.message(
      'Terms and coditions',
      name: 'termsandconditions',
      desc: '',
      args: [],
    );
  }

  /// `Validate your email`
  String get validateyouremail {
    return Intl.message(
      'Validate your email',
      name: 'validateyouremail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent into your email.`
  String get pleaseentercodeemail {
    return Intl.message(
      'Please enter the code sent into your email.',
      name: 'pleaseentercodeemail',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code`
  String get enterthecode {
    return Intl.message(
      'Enter the code',
      name: 'enterthecode',
      desc: '',
      args: [],
    );
  }

  /// `Validate`
  String get validate {
    return Intl.message(
      'Validate',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your phone number`
  String get confirmyourphonenumber {
    return Intl.message(
      'Confirm your phone number',
      name: 'confirmyourphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number is`
  String get yourphonenumberis {
    return Intl.message(
      'Your phone number is',
      name: 'yourphonenumberis',
      desc: '',
      args: [],
    );
  }

  /// `Account type`
  String get accountype {
    return Intl.message(
      'Account type',
      name: 'accountype',
      desc: '',
      args: [],
    );
  }

  /// `Send sms`
  String get sendsms {
    return Intl.message(
      'Send sms',
      name: 'sendsms',
      desc: '',
      args: [],
    );
  }

  /// `My QR code`
  String get myqrcode {
    return Intl.message(
      'My QR code',
      name: 'myqrcode',
      desc: '',
      args: [],
    );
  }

  /// `Your Balance`
  String get yourbalance {
    return Intl.message(
      'Your Balance',
      name: 'yourbalance',
      desc: '',
      args: [],
    );
  }

  /// `If your balance isn’t enough, choose another payment method:`
  String get ifbalancedescription {
    return Intl.message(
      'If your balance isn’t enough, choose another payment method:',
      name: 'ifbalancedescription',
      desc: '',
      args: [],
    );
  }

  /// `manually input`
  String get manuallyinput {
    return Intl.message(
      'manually input',
      name: 'manuallyinput',
      desc: '',
      args: [],
    );
  }

  /// `Info user`
  String get infouser {
    return Intl.message(
      'Info user',
      name: 'infouser',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
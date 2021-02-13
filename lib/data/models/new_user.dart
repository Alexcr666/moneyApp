import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'json_interface.dart';

@immutable
class NewUser extends Equatable implements JsonInterface {
  NewUser({
    @required this.name,
    @required this.lastName,
    @required this.email,
    @required this.fiscalNumber,
    @required this.countryCode,
    @required this.phoneNumber,
    @required this.password,
    @required this.sendPush,
    @required this.acceptedTerms,
    @required this.acceptedPrivacyPolicy,
    @required this.acceptedSendCommunications,
    @required this.birthDate,
  });

  final String name;
  final String lastName;
  final String email;
  final String fiscalNumber;
  final String countryCode;
  final String phoneNumber;
  final String password;
  final bool sendPush;
  final bool acceptedTerms;
  final bool acceptedPrivacyPolicy;
  final bool acceptedSendCommunications;
  final String birthDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': this.name ?? '',
        'last_name': this.lastName ?? '',
        'email': this.email ?? '',
        'fiscal_number': this.fiscalNumber ?? '',
        'country_code': this.countryCode ?? '',
        'phone_number': this.phoneNumber ?? '',
        'password': this.password ?? '',
        'send_push': this.acceptedSendCommunications ?? false,
        'accepted_terms': this.acceptedTerms ?? false,
        'accepted_privacy_policy': this.acceptedPrivacyPolicy ?? false,
        'accepted_send_communications':
            this.acceptedSendCommunications ?? false,
        'birthdate': this.birthDate ?? '',
      };

  NewUser copyWith({
    String name,
    String lastName,
    String email,
    String fiscalNumber,
    String countryCode,
    String phoneNumber,
    String password,
    String sendPush,
    String acceptedTerms,
    String acceptedPrivacyPolicy,
    String acceptedSendCommunications,
    String birthDate,
  }) =>
      NewUser(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        fiscalNumber: fiscalNumber ?? this.fiscalNumber,
        countryCode: countryCode ?? this.countryCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        sendPush: sendPush ?? this.sendPush,
        acceptedTerms: acceptedTerms ?? this.acceptedTerms,
        acceptedPrivacyPolicy:
            acceptedPrivacyPolicy ?? this.acceptedPrivacyPolicy,
        acceptedSendCommunications:
            acceptedSendCommunications ?? this.acceptedSendCommunications,
        birthDate: birthDate ?? this.birthDate,
      );

  @override
  String toString() {
    return 'NewUser{name: $name, lastName: $lastName, email: $email, fiscalNumber: $fiscalNumber, countryCode: $countryCode, phoneNumber: $phoneNumber, password: $password, sendPush: $sendPush, acceptedTerms: $acceptedTerms, acceptedPrivacyPolicy: $acceptedPrivacyPolicy, acceptedSendCommunications: $acceptedSendCommunications, birthDate: $birthDate}';
  }

  @override
  List<Object> get props => [
        name,
        lastName,
        email,
        fiscalNumber,
        countryCode,
        phoneNumber,
        password,
        sendPush,
        acceptedTerms,
        acceptedPrivacyPolicy,
        acceptedSendCommunications,
        birthDate,
      ];
}

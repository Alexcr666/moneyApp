import 'package:ecloudatm/redux/sign_up/sign_up_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';



@immutable
class AppState extends Equatable {
  AppState({
    @required this.signUpState,

  });


  final PostsStateSignUp signUpState;



  static AppState rehydrationJSON(dynamic json) {



    return json != null
        ? AppState(

      signUpState: PostsStateSignUp(),

    )
        : AppState.initial();
  }

  Map<String, dynamic> toJson() =>
      {
 //       'auth': authState.toJson(),
   //     'checkout': checkoutState.toJson(),
      };

  factory AppState.initial() {
    return AppState(

      signUpState: PostsStateSignUp(),

    );
  }

  AppState copyWith({
    PostsStateSignUp signUpState,


  }) =>
      AppState(

        signUpState: signUpState ?? this.signUpState,

      );

  @override
  List<Object> get props =>
      [

        signUpState,

      ];
}

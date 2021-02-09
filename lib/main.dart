import 'package:ecloudatm/app/app_colors.dart';
import 'package:ecloudatm/app/app_settings.dart';
import 'package:ecloudatm/data/networking/endPointApi.dart';
import 'package:ecloudatm/generated/l10n.dart';
import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/login/store.dart';

//import 'package:ecloudatm/redux/app/app_state.dart';
import 'package:ecloudatm/redux/sign_up/store.dart';
import 'package:ecloudatm/redux/store.dart';
import 'package:ecloudatm/router/routers.dart';
import 'package:ecloudatm/ui/codeSegurity/codeSegurity.dart';
import 'package:ecloudatm/ui/login/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

import 'router/routers.dart';
import 'sharedPreferences/sharedPreferences.dart';
import 'ui/codeQr/codeQr.dart';
import 'ui/intro/intro.dart';
bool init = false;
Future<void> main() async {
  await ReduxSignUp.init();
  await ReduxLogin.init();

  //var api = JvAmigosApi();
  //Store<AppState> store = await createStore(api: api, persistor: persistor);

  //var persistor = createPersistor(
  //  AppSettings.appDisplayName + AppSettings.debug.toString());

  //var api = endPointApi();
  //Store<AppState> store = await createStore(api: api);

  // var configuredApp;
  //configuredApp = AppConfig(persistor: persistor, child: MyApp(store));


      runApp(AppLock(
        builder: (args) => MyApp2(),
        lockScreen: MyApp3(),
        enabled: false,


      ));
  init = true;
  print("prueba24:"+init.toString());

  //runApp(MyApp());
}

class MyApp2 extends StatelessWidget {
  // MyApp(this.store);

  // final Store<AppState> store;
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', ''),
        const Locale.fromSubtags(languageCode: 'fr'), // Arabic, no country code
      ],
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppSettings.appDisplayName,
      theme: ThemeData(
        fontFamily: "lato",
        primarySwatch: Colors.blue,
        //  visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      //initialRoute: codeSegurityRoute,
      home: FutureBuilder(
        future: AppSharedPreference().getIntro(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("prueba23:"+snapshot.data.toString());
            if (snapshot.data != false) {

              return MyHomePage();
            } else {

              return OnboardingScreen();

            }
          }
          return OnboardingScreen();

          //  return  screenCrearUsuario();
        },
      ),
    );

      //  home: QRViewExample(),

      //home: OnboardingScreen(),

  }
}
class MyApp3 extends StatelessWidget {
  // MyApp(this.store);

  // final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', ''),
        const Locale.fromSubtags(languageCode: 'fr'), // Arabic, no country code
      ],
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppSettings.appDisplayName,
      theme: ThemeData(
        fontFamily: "lato",
        primarySwatch: Colors.blue,
        //  visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: codeSegurityRoute,
      //home: OnboardingScreen(),
    );
  }
}
class MyApp extends StatelessWidget {
  // MyApp(this.store);

  // final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
  //  AppLock.of(context).enable();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', ''),
        const Locale.fromSubtags(languageCode: 'fr'), // Arabic, no country code
      ],
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppSettings.appDisplayName,
      theme: ThemeData(
        fontFamily: "lato",
        primarySwatch: Colors.blue,
        //  visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: homeRoute,
      //home: OnboardingScreen(),
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  Future setIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("intro", true);
  }

  Future getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("intro") != null) {
      return prefs.getBool("intro");
    } else {
      return false;
    }
  }

  Future setIdUserSignUp(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(id, true);
  }

  Future getIdUserSignUp(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(id) != null) {
      return prefs.getBool(id);
    } else {
      return false;
    }
  }

  Future saveSession(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('session', uid);
  }

  Future getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("session") != null) {
      return prefs.getString("session");
    } else {
      return false;
    }
  }
}

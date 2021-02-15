import 'package:ecloudatm/data/models/signupSharedPreferences/signupModel.dart';
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


  Future setIdUserSignUpComplete(int path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("path", path);
  }

  Future getIdUserSignUpComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("path") != null) {
      return prefs.getString("path");
    } else {
      return false;
    }
  }

  Future setIdUserSignUp(String id,String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(id, data);
  }
  Future setIdUserSignUpClear(String id,String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }
  Future getIdUserSignUp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("id") != null) {
     modelSignUpSharedPreferences dataModel = new modelSignUpSharedPreferences(prefs.getString("phone"),prefs.getString("id"),prefs.getString("email"));
 return dataModel;
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

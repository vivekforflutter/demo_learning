import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final String LANGUAGE = "LANGUAGE";
  static final SessionManager _singleton = SessionManager._internal();

  factory SessionManager() {
    return _singleton;
  }

  SessionManager._internal();
  //common for all string type prefs
  Future<void> setString(String key, String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, val);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? null;
  }
}

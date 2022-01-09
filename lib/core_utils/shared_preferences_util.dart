import 'package:shared_preferences/shared_preferences.dart';

abstract class SharePreferenceKey {
  static const String appLogin = 'login';
}

class SharePreferenceData {
  static final SharePreferenceData _userData = SharePreferenceData._internal();

  factory SharePreferenceData() {
    return _userData;
  }

  SharePreferenceData._internal();

  Future<void> setLogin({required bool value}) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setBool(SharePreferenceKey.appLogin, value);
  }

  Future<bool> getLogin() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(SharePreferenceKey.appLogin) ?? false;
  }
}

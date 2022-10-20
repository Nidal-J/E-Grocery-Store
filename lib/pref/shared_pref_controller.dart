import 'dart:developer';

import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  id,
  name,
  email,
  mobile,
  gender,
  cityId,
  loggedIn,
  token,
  lang,
  isDark,
}

class SharedPrefController {
  SharedPrefController._();
  static SharedPrefController? _instance;
  late SharedPreferences _preferences;
  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPrefeerences() async {
    _preferences = await SharedPreferences.getInstance();
    log(deviceLocale);
  }

  Future<void> save({required User user}) async {
    await _preferences.setBool(PrefKeys.loggedIn.name, true);
    await _preferences.setInt(PrefKeys.id.name, user.id);
    await _preferences.setString(PrefKeys.name.name, user.name);
    await _preferences.setString(PrefKeys.email.name, user.email ?? '');
    await _preferences.setString(PrefKeys.mobile.name, user.mobile);
    await _preferences.setString(PrefKeys.gender.name, user.gender);
    await _preferences.setString(PrefKeys.cityId.name, user.cityId);
    await _preferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
  }

  Future<void> updateProfile({
    required String name,
    required String gender,
    required String cityId,
  }) async {
    await _preferences.setString(PrefKeys.name.name, name);

    await _preferences.setString(PrefKeys.gender.name, gender);
    await _preferences.setString(PrefKeys.cityId.name, cityId);
  }

  bool get loggedIn => _preferences.getBool(PrefKeys.loggedIn.name) ?? false;

  Future<void> clear() => _preferences.clear();

  T? getByKey<T>({required String key}) {
    if (_preferences.containsKey(key)) {
      return _preferences.get(key) as T;
    }
    return null;
  }

  String get token => _preferences.getString(PrefKeys.token.name) ?? '';

  Future<void> saveLang(String lang) async {
    await _preferences.setString(PrefKeys.lang.name, lang);
  }

  Future<void> saveMode(bool isDark) async {
    await _preferences.setBool(PrefKeys.isDark.name, isDark);
  }
}

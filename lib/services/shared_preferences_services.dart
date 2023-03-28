import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static final String _sharedTest = "sharedTest";

  Future<String?> getSharedTest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sharedTest) ?? null;
  }

  Future<bool> clearSharedTest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_sharedTest);
  }

  Future<bool> setSharedTest(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_sharedTest, value);
  }
}

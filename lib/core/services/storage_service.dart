import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Storage service
/// store data locally for the whole app
/// 1. Store token
/// 2.
///
class StorageService {
  late SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setValue(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool isUserOpenFirstTime(String key) {
    return _preferences.getBool(key) ?? false;
  }
}

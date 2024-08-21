import 'dart:convert';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../config/theme/theme.dart';
import '../models/profile_model.dart';
import '../models/token/token.dart';

abstract class LocalStorage {
  static LocalStorage? _instance;
  static LocalStorage get instance => _instance!;

  static const tokenKey = 'token';
  static const themeTypeKey = 'theme_type';
  static const localeKey = 'locale_type';
  static const roleKey = 'roleKey';

  factory LocalStorage() => instance;

  LocalStorage._();

  static init() async {
    assert(_instance == null);
    _instance = await SharedPrefLocalStorageImpl._().init();
    return _instance!;
  }

  void setInt(String key, int value);
  void setDouble(String key, double value);
  void setBool(String key, bool value);
  void setString(String key, String value);
  void setStringList(String key, List<String> value);
  void setObject(String key, Object? value);

  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String>? getStringList(String key);
  dynamic getObject(String key);

  void addListener<T>(String key, Function(dynamic value) listener);
  void removeListener(String key);

  set isHasCourier(bool value) => setBool('is_your_courier', value);
  bool get isHasCourier => getBool('is_your_courier') ?? false;

  ThemeType get themeType => ThemeType.values.firstWhere(
        (element) => element.name == getString(themeTypeKey),
        orElse: () => ThemeType.lightGreen,
      );
  set themeType(ThemeType type) => setString(themeTypeKey, type.name);

  Locale? get locale {
    final map = getObject(localeKey);
    return map != null
        ? Locale.fromSubtags(
            languageCode: map['language_code'],
            countryCode: map['country_code'],
          )
        : null;
  }

  set locale(Locale? locale) => setObject(
        localeKey,
        locale != null
            ? {
                'language_code': locale.languageCode,
                'country_code': locale.countryCode,
              }
            : null,
      );

  Token? get token {
    final map = getObject(tokenKey);
    return map != null ? Token.fromJson(map) : null;
  }

  set token(Token? token) => setObject(tokenKey, token?.toJson());

  Role? get role {
    final roleString = getString(roleKey);
    return roleString != null ? _stringToRole(roleString) : null;
  }

  set role(Role? role) =>
      setString(roleKey, role != null ? _roleToString(role) : '');

  String _roleToString(Role role) {
    switch (role) {
      case Role.courier:
        return 'courier';
      case Role.salesman:
        return 'shop';
      case Role.restaurant:
        return 'restaurant';
      default:
        throw Exception('Invalid role');
    }
  }

  Role _stringToRole(String roleString) {
    switch (roleString) {
      case 'courier':
        return Role.courier;
      case 'shop':
        return Role.salesman;
      case 'restaurant':
        return Role.restaurant;
      default:
        throw Exception('Invalid role string');
    }
  }
}

class SharedPrefLocalStorageImpl extends LocalStorage {
  SharedPreferences? _preferences;
  Map<String, Function(dynamic value)> listeners = {};

  SharedPrefLocalStorageImpl._() : super._();

  Future<SharedPrefLocalStorageImpl> init() async {
    _preferences = await SharedPreferences.getInstance();

    return this;
  }

  @override
  void setInt(String key, int value) {
    _preferences?.setInt(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setDouble(String key, double value) {
    _preferences?.setDouble(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setBool(String key, bool value) {
    _preferences?.setBool(key, value);

    listeners[key]?.call(value);
  }

  @override
  void setString(String key, String value) {
    _preferences?.setString(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setStringList(String key, List<String> value) {
    _preferences?.setStringList(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setObject(String key, Object? value) {
    _preferences?.setString(key, jsonEncode(value));
    listeners[key]?.call(value);
  }

  @override
  bool? getBool(String key) => _preferences?.getBool(key);
  @override
  int? getInt(String key) => _preferences?.getInt(key);
  @override
  double? getDouble(String key) => _preferences?.getDouble(key);
  @override
  String? getString(String key) => _preferences?.getString(key);
  @override
  List<String>? getStringList(String key) => _preferences?.getStringList(key);
  @override
  dynamic getObject(String key) {
    final value = _preferences?.getString(key);
    if (value != null) return jsonDecode(value);
    return null;
  }

  @override
  void addListener<T>(String key, Function(dynamic value) listener) {
    // _preferences?.
    listeners[key] = listener;
  }

  @override
  void removeListener(String key) => listeners.remove(key);
}

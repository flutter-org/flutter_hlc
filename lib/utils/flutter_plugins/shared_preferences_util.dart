import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferencesUtil._();

  static final SharedPreferencesUtil _instance = SharedPreferencesUtil._();

  factory SharedPreferencesUtil.instance() => _instance;

  SharedPreferences? _prefs;

  Future<bool> _initSharedPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs != null;
  }

  /// Int - set && get
  Future<bool> setInt(String key, int value) async {
    await _initSharedPreferences();
    bool result = await _prefs!.setInt(key, value);
    return result;
  }

  Future<int?> getInt(String key) async {
    await _initSharedPreferences();
    int? result = _prefs!.getInt(key);
    return result;
  }

  /// Bool - set && get
  Future<bool> setBool(String key, bool value) async {
    await _initSharedPreferences();
    bool result = await _prefs!.setBool(key, value);
    return result;
  }

  Future<bool?> getBool(String key) async {
    await _initSharedPreferences();
    bool? result = _prefs!.getBool(key);
    return result;
  }

  /// Double - set && get
  Future<bool> setDouble(String key, double value) async {
    await _initSharedPreferences();
    bool result = await _prefs!.setDouble(key, value);
    return result;
  }

  Future<double?> getDouble(String key) async {
    await _initSharedPreferences();
    double? result = _prefs!.getDouble(key);
    return result;
  }

  /// String - set && get
  Future<bool> setString(String key, String value) async {
    await _initSharedPreferences();
    bool result = await _prefs!.setString(key, value);
    return result;
  }

  Future<String?> getString(String key) async {
    await _initSharedPreferences();
    String? result = _prefs!.getString(key);
    return result;
  }

  /// StringList - set && get
  Future<bool> setStringList(String key, List<String> value) async {
    await _initSharedPreferences();
    bool result = await _prefs!.setStringList(key, value);
    return result;
  }

  Future<List<String>?> getStringList(String key) async {
    await _initSharedPreferences();
    List<String>? result = _prefs!.getStringList(key);
    return result;
  }

  /// remove
  Future<bool> remove(String key) async {
    await _initSharedPreferences();
    bool result = await _prefs!.remove(key);
    return result;
  }

  /// remove
  Future<bool> clear() async {
    await _initSharedPreferences();
    return _prefs!.clear();
  }
}

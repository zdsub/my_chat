import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _sharedPreferences;
late final Setting settings;

/// 初始化配置信息
void initSettings() async {
  _sharedPreferences = await SharedPreferences.getInstance();
  settings = Setting();
}

/// 配置信息
class Setting {
  String _key = _sharedPreferences.getString("key") ?? "";
  final CompletionSetting completion = CompletionSetting();

  String get key => _key;

  set key(String value) {
    if (_key != value) {
      _key = value;
      _sharedPreferences.setString("key", value);
    }
  }
}

/// Completions配置信息
class CompletionSetting {
  String model = "text-davinci-003";
  int? max_tokens;
  double? temperature;
  double? top_p;
}

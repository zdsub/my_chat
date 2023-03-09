import 'package:shared_preferences/shared_preferences.dart';

import 'mode/completion_setting.dart';

late final SharedPreferences sharedPreferences;
late final Setting settings;

/// 初始化配置信息
void initSettings() async {
  sharedPreferences = await SharedPreferences.getInstance();
  settings = Setting();
}

/// 配置信息
class Setting {
  String _key = sharedPreferences.getString("key") ?? "";
  final CompletionSetting completion = CompletionSetting();

  String get key => _key;

  set key(String value) {
    if (_key != value) {
      _key = value;
      sharedPreferences.setString("key", value);
    }
  }
}

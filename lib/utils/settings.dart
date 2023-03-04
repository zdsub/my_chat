import 'package:shared_preferences/shared_preferences.dart';

import '../settings/setting.dart';

/// 初始化设置信息
void initSettings() {
  SharedPreferences
    .getInstance()
    .then(_initSettings);
}

/// 真·初始化设置信息
void _initSettings(SharedPreferences prefs) {
  final key = prefs.getString("key");
  if (key != null) {
    settings.key = key;
  }
}

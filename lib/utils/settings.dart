import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting.dart';

/// 初始化设置信息
void initSettings() {
  SharedPreferences
    .getInstance()
    .then(_initSettings);
}

/// 真·初始化设置信息
void _initSettings(prefs) {
  Setting.key = prefs.getString("key");
}

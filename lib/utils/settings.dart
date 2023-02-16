import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting.dart';

void initSettings() {
  SharedPreferences
      .getInstance()
      .then(_initSettings);
}

void _initSettings(prefs) {
  Setting.key = prefs.getString("key");
}

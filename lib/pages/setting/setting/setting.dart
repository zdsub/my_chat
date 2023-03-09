import 'package:flutter/material.dart';

import 'containers/key_setting_container.dart';
import 'containers/mode_setting_container.dart';
import 'containers/about_setting_container.dart';

/// 设置页面
class SettingPage extends StatelessWidget {
  const SettingPage({ super.key });

  static void show(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            KeySettingContainer(),
            ModeSettingContainer(),
            AboutSettingContainer()
          ]
        )
      )
    );
  }
}

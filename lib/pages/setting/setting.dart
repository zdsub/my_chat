import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/containers/about_setting_container.dart';
import 'package:my_chat/pages/setting/containers/completion_setting_container.dart';
import 'package:my_chat/pages/setting/containers/key_setting_container.dart';

/// 设置页面
class SettingPage extends StatefulWidget {
  const SettingPage({ super.key });

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
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
            CompletionSettingContainer(),
            AboutSettingContainer()
          ]
        )
      )
    );
  }
}

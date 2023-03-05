import 'package:flutter/material.dart';
import 'package:my_chat/widgets/set_key_dialog.dart';
import 'package:my_chat/pages/setting/setting_container.dart';
import 'package:my_chat/pages/setting/setting_item.dart';

import '../../settings/settings.dart';

/// 设置页面
class SettingPage extends StatefulWidget {
  const SettingPage({ super.key });

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  void setKey() async {
    final result = await SetKeyDialog.show(context);
    if (result) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            SettingContainer(
              child: SettingItem(
                title: "密钥",
                value: settings.key,
                onTap: setKey
              )
            )
          ]
        )
      )
    );
  }
}

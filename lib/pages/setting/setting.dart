import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/setting_container.dart';
import 'package:my_chat/pages/setting/setting_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/setting.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            SettingContainer(
              child: SettingItem(title: "密钥", value: Setting.key ?? "", onTap: () async{
                final result = await showDialog(context: context, builder: (context) => _SettingDialog());
                if (result) {
                  setState(() {});
                }
              })
            )
          ]
        )
      )
    );
  }
}

class _SettingDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void onCancel(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  void onConfirm(BuildContext context) {
    final key = _textEditingController.text;

    if (key.isNotEmpty && key != Setting.key) {
      Setting.key = key;
      SharedPreferences
        .getInstance()
        .then((prefs) => prefs.setString("key", key));
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    if (Setting.key != null) {
      _textEditingController.text = Setting.key!;
    }

    return AlertDialog(
      title: const Text("设置密钥"),
      content: TextField(
        controller: _textEditingController
      ),
      actions: [
        TextButton(
          onPressed: () => onCancel(context),
          child: const Text("取消")
        ),
        TextButton(
            onPressed: () => onConfirm(context),
            child: const Text("确定")
        )
      ]
    );
  }
}

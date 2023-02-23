import 'package:flutter/material.dart';
import 'package:my_chat/models/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 配置对话框
class SettingDialog extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  SettingDialog({ super.key });

  static void show(BuildContext context) {
    showDialog(context: context, builder: (context) => SettingDialog());
  }

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onConfirm(BuildContext context) {
    final key = textEditingController.text;

    if (key.isNotEmpty && key != Setting.key) {
      Setting.key = key;
      SharedPreferences
        .getInstance()
        .then((prefs) => prefs.setString("key", key));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (Setting.key != null) {
      textEditingController.text = Setting.key!;
    }

    return AlertDialog(
      content: Row(
        children: [
          const Text("密钥："),
          Expanded(
            child: TextField(
              controller: textEditingController,
            )
          )
        ]
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

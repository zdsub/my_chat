import 'package:flutter/material.dart';
import 'package:my_chat/models/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 配置对话框
class SettingDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  SettingDialog({ super.key });

  @override
  Widget build(BuildContext context) {
    if (Setting.key != null) {
      _textEditingController.text = Setting.key!;
    }

    return AlertDialog(
      content: Row(
        children: [
          const Text("密钥："),
          Expanded(
            child: TextField(
              controller: _textEditingController,
            )
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("取消")
        ),
        TextButton(
          onPressed: () {
            final key = _textEditingController.text;
            if (key.isNotEmpty && key != Setting.key) {
              Setting.key = key;
              SharedPreferences
                  .getInstance()
                  .then((prefs) => prefs.setString("key", key));
            }
            Navigator.of(context).pop();
          },
          child: const Text("确定")
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_chat/settings/settings.dart';
import 'package:my_chat/widgets/input_dialog/text_input_dialog.dart';

/// 设置密钥对话框
class SetKeyDialog extends StatelessWidget {
  const SetKeyDialog({ super.key });

  static Future<String?> show(BuildContext context) async {
    final result = await showDialog(context: context, builder: (context) => const SetKeyDialog());
    if (result != null) {
      settings.key = result;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextInputDialog(
      title: "设置密钥",
      content: settings.key
    );
  }
}

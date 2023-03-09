import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_item.dart';
import 'package:my_chat/settings/settings.dart';
import 'package:my_chat/widgets/input_dialog/text_input_dialog.dart';

class KeySettingContainer extends StatefulWidget {
  const KeySettingContainer({ super.key });

  @override
  State<StatefulWidget> createState() => _KeySettingContainerState();
}

class _KeySettingContainerState extends State<KeySettingContainer> {
  void setKey() async {
    final key = await showDialog(
      context: context,
      builder: (context) =>
        TextInputDialog(
          title: "设置密钥",
          content: settings.key
        )
    );
    if (key != null) {
      setState(() => settings.key = key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      items: [
        SettingItem(
          title: "密钥",
          value: settings.key,
          onTap: setKey
        )
      ]
    );
  }
}

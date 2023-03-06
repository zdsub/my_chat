import 'package:flutter/material.dart';

import '../../../settings/settings.dart';
import '../../../widgets/set_key_dialog.dart';
import '../widgets/setting_container.dart';
import '../widgets/setting_item.dart';

/// 密钥配置项组件
class KeySettingContainer extends StatefulWidget {
  const KeySettingContainer({ super.key });

  @override
  State<StatefulWidget> createState() => _KeySettingContainerState();
}

class _KeySettingContainerState extends State<KeySettingContainer> {
  void setKey() async {
    final result = await SetKeyDialog.show(context);
    if (result) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      children: [
        SettingItem(
          title: "密钥",
          value: settings.key,
          onTap: setKey
        )
      ]
    );
  }
}

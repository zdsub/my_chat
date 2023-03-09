import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_item.dart';

class ResetSettingContainer extends StatelessWidget {
  const ResetSettingContainer({ super.key });

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      items: [
        SettingItem(
          title: "恢复默认",
          onTap: () {}
        )
      ]
    );
  }
}

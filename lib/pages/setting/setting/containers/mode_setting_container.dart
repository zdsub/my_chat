import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/completion_setting/completion_setting.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_item.dart';

class ModeSettingContainer extends StatelessWidget {
  const ModeSettingContainer({ super.key });

  void onCompletion(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CompletionSettingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      items: [
        SettingItem(
        title: "completion",
        onTap: () => onCompletion(context)
        )
      ]
    );
  }
}

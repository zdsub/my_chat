import 'package:flutter/material.dart';
import 'package:my_chat/pages/about/about.dart';
import 'package:my_chat/pages/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/widgets/setting_item.dart';

/// 关于设置项组件
class AboutSettingContainer extends StatelessWidget {
  const AboutSettingContainer({ super.key });

  void onAbout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      children: [
        SettingItem(
          title: "关于",
          onTap: () => onAbout(context)
        )
      ]
    );
  }
}

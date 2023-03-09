import 'package:flutter/material.dart';
import 'package:my_chat/pages/about/about.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/setting/widgets/setting_item.dart';

class AboutSettingContainer extends StatelessWidget {
  const AboutSettingContainer({ super.key });

  void onAbout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      items: [
        SettingItem(
          title: "关于",
          onTap: () => onAbout(context)
        )
      ]
    );
  }
}

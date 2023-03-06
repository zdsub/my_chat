import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/widgets/setting_item.dart';
import 'package:my_chat/settings/settings.dart';

/// Completions配置项组件
class CompletionSettingContainer extends StatefulWidget {
  const CompletionSettingContainer({ super.key });

  @override
  State<StatefulWidget> createState() => _CompletionSettingContainerState();
}

class _CompletionSettingContainerState extends State<CompletionSettingContainer> {
  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      children: [
        SettingItem(
          title: "model",
          value: settings.completion.model,
          onTap: () {}
        ),
        SettingItem(
          title: "max_tokens",
          value: settings.completion.max_tokens.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "temperature",
          value: settings.completion.temperature.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "top_p",
          value: settings.completion.top_p.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "frequency_penalty",
          value: settings.completion.frequency_penalty.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "presence_penalty",
          value: settings.completion.presence_penalty.toString(),
          onTap: () {}
        ),
        // SettingItem(
        //   title: "重置配置",
        //   onTap: () {}
        // )
      ]
    );
  }
}

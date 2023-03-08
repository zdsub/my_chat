import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/widgets/setting_container.dart';
import 'package:my_chat/pages/setting/widgets/setting_item.dart';
import 'package:my_chat/settings/settings.dart';

import '../../../widgets/input_dialog/text_select_dialog.dart';

/// Completions配置项组件
class CompletionSettingContainer extends StatefulWidget {
  const CompletionSettingContainer({ super.key });

  @override
  State<StatefulWidget> createState() => _CompletionSettingContainerState();
}

class _CompletionSettingContainerState extends State<CompletionSettingContainer> {
  void setModel() async {
    final model = await showDialog(
      context: context,
      builder: (context) =>
        TextSelectDialog(
          title: "model",
          value: settings.completion.model,
          selectionList: CompletionSetting.modelList
        )
    );

    if (model != null) {
      setState(() => settings.completion.model = model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingContainer(
      title: "Completion",
      children: [
        SettingItem(
          title: "model",
          value: settings.completion.model,
          onTap: setModel
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
        SettingItem(
          title: "stop",
          value: settings.completion.stop.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "best_of",
          value: settings.completion.best_of.toString(),
          onTap: () {}
        ),
        SettingItem(
          title: "恢复默认",
          onTap: () {}
        )
      ]
    );
  }
}

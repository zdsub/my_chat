import 'package:flutter/material.dart';

import 'containers/completion_setting_container.dart';
import 'containers/reset_setting_container.dart';

/// Completion设置页面
class CompletionSettingPage extends StatelessWidget {
  const CompletionSettingPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completion设置"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            CompletionSettingContainer(),
            ResetSettingContainer()
          ]
        )
      )
    );
  }
}

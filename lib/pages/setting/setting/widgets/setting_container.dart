import 'package:flutter/material.dart';

import 'setting_item.dart';

/// 设置项容器组件
class SettingContainer extends StatelessWidget {
  final List<SettingItem> items;

  const SettingContainer({ super.key, required this.items });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[300]!
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 8, endIndent: 8)
      )
    );
  }
}

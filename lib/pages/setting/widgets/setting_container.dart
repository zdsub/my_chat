import 'package:flutter/material.dart';
import 'package:my_chat/pages/setting/widgets/setting_item.dart';

/// 设置项容器组件
class SettingContainer extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const SettingContainer({ super.key, required this.children, this.title });

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
      child: Column(
        children: [
          if (title != null) SettingItem(title: title!),
          if (title != null) const Divider(height: 1),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: children.length,
            itemBuilder: (context, index) => children[index],
            separatorBuilder: (context, index) => const Divider(height: 1, indent: 8, endIndent: 8)
          )
        ],
      )
    );
  }
}

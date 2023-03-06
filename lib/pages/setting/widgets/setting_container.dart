import 'package:flutter/material.dart';

/// 设置项容器组件
class SettingContainer extends StatelessWidget {
  final List<Widget> children;

  const SettingContainer({ super.key, required this.children });

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
        shrinkWrap: true,
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 8, endIndent: 8)
      )
    );
  }
}

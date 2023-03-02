import 'package:flutter/material.dart';

/// 设置项容器
class SettingContainer extends StatelessWidget {
  final Widget child;

  const SettingContainer({ super.key, required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[300]!
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: child
    );
  }
}

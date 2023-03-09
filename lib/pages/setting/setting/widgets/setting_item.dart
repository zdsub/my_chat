import 'package:flutter/material.dart';

/// 设置项组件
class SettingItem extends StatelessWidget {
  final String title;
  final String? value;
  final void Function() onTap;

  const SettingItem({ super.key, required this.title, this.value, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16)
            ),
            Row(
              children: [
                if (value != null) Container(
                  margin: const EdgeInsets.only(right: 8),
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Text(
                    value!.isEmpty ? "未设置" : value!,
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    maxLines: 1
                  )
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[500],
                  size: 14
                )
              ]
            )
          ]
        )
      )
    );
  }
}

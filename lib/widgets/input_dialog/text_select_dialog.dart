import 'package:flutter/material.dart';

import 'input_dialog.dart';

/// 文本选择对话框
class TextSelectDialog extends StatefulWidget {
  final String title;
  final String value;
  final List<String> selectionList;

  const TextSelectDialog({ super.key, required this.title, required this.value, required this.selectionList });

  @override
  State<StatefulWidget> createState() => _TextSelectDialogState();
}

class _TextSelectDialogState extends State<TextSelectDialog> {
  late String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InputDialog(
      title: widget.title,
      content: DropdownButton(
        isExpanded: true,
        value: _value,
        items: widget.selectionList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) {
          if (v != _value) {
            setState(() => _value = v!);
          }
        },
      ),
      onConfirm: () => _value
    );
  }
}

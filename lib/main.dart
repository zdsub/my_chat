import 'package:flutter/material.dart';
import 'package:my_chat/pages/home/home.dart';
import 'package:my_chat/utils/settings.dart';

void main() {
  runApp(const MainApp());
  initSettings();
}

class MainApp extends StatelessWidget {
  const MainApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "聊天工具",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomePage()
    );
  }
}

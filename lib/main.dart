import 'package:flutter/material.dart';
import 'package:voicechat/features/homepage/presentation/utils/constants.dart';
import 'package:voicechat/features/homepage/presentation/pages/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voicechat/features/homepage/presentation/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  final Color _drawerBackGroundColor = Colors.deepOrangeAccent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: myText,
      color: _drawerBackGroundColor,
      height: MediaQuery.of(context).size.height,
      width: Constants.drawerWidth(context),
    );
  }
}

Center? get myText => Center(
      child: Text(
        'Here is our drawer',
        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

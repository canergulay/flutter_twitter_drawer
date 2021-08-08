import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final VoidCallback onTap;
  const FirstPage({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, onTap),
      bottomNavigationBar: bottomNavBar(),
      body: Center(
        child: dummyText,
      ),
    );
  }

  Container bottomNavBar() {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.5, color: Colors.black))),
      padding: EdgeInsets.only(top: 6),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.people,
              )),
        ],
      ),
    );
  }
}

Text get dummyText => Text(
      'First Page',
      style: TextStyle(fontSize: 25),
    );

AppBar appBar(BuildContext context, VoidCallback onTap) => AppBar(
      leading: drawerIcon(context, onTap),
    );

IconButton drawerIcon(BuildContext context, VoidCallback onTap) =>
    IconButton(onPressed: onTap, icon: Icon(Icons.menu_rounded));

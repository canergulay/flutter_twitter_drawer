import 'package:flutter/material.dart';
import 'package:voicechat/features/homepage/presentation/utils/constants.dart';
import 'package:voicechat/features/homepage/presentation/pages/drawer.dart';
import 'package:voicechat/features/homepage/presentation/pages/first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  double _oldLeft = 0;
  late final AnimationController drawerController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    drawerController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: Constants.animatonMilliSeconds),
        upperBound: Constants.drawerWidth(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        onHorizontalDragUpdate: onDrag,
        onHorizontalDragEnd: onDragEnd,
        onHorizontalDragStart: onDragStart,
        child: AnimatedBuilder(
            animation: drawerController,
            builder: (BuildContext context, Widget? child) {
              return Stack(
                children: [
                  Positioned(
                    left: _swipeCalculatorDrawer(drawerController.value, context),
                    child: CustomDrawer(),
                  ),
                  Positioned(
                      left: _swipeCalculatorMain(drawerController.value, context),
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: FirstPage(
                            onTap: _drawerOnPressed,
                          ))),
                ],
              );
            }),
      ),
    );
  }

  Function? onDragStart(DragStartDetails details) {
    _oldLeft = drawerController.value;
  }

  Function? onDragEnd(DragEndDetails details) {
    if (_oldLeft <= drawerController.value) {
      drawerController.forward();
    } else {
      drawerController.reverse();
    }
  }

  Function? onDrag(DragUpdateDetails details) {
    final double newValue = details.delta.dx;
    if (newValue > 0) {
      drawerController.value = drawerController.value + 2;
    } else {
      if (drawerController.value > 0) {
        drawerController.value = drawerController.value - 2;
      }
    }
  }

  void _drawerOnPressed() {
    if (drawerController.value == Constants.drawerWidth(context)) {
      drawerController.reverse();
    } else {
      drawerController.forward();
    }
  }
}

double _swipeCalculatorMain(double swipe, BuildContext context) {
  return swipe <= Constants.drawerWidth(context) ? swipe : Constants.drawerWidth(context);
}

double _swipeCalculatorDrawer(double swipe, BuildContext context) {
  double toBeReturned = -Constants.drawerWidth(context) + swipe;
  return swipe <= Constants.drawerWidth(context) ? toBeReturned : 0;
}

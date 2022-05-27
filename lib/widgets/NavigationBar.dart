import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BubbleBottomBar(
        opacity: .2,
        // currentIndex: currentIndex,
        // onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home_filled, color: Colors.black,), activeIcon: Icon(Icons.home, color: Colors.red,), title: Text("خانه")),
          BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.deepPurple,), title: Text("Logs")),
          BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.login, color: Colors.black,), activeIcon: Icon(Icons.login, color: Colors.green,), title: Text("حساب کاربری"))
        ],
      ),
    );
  }
}
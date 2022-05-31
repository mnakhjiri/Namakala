import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:namakala/pages/HomePage.dart';
import 'package:namakala/pages/Login.dart';

import '../pageHandler.dart';

class MyNavigationBar extends StatefulWidget {
  int currentIndex = 0;
  static final MyNavigationBar _myNavigationBar = MyNavigationBar._internal();


  MyNavigationBar._internal();
  factory MyNavigationBar(int index) {
    _myNavigationBar.currentIndex = index;
    return _myNavigationBar;
  }
  static getInstance() {
    return _myNavigationBar;
  }
  // MyNavigationBar(this.currentIndex);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState(currentIndex);
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int currentIndex;

  _MyNavigationBarState(this.currentIndex);

  final List<Widget> pages = [
    PageHandler.index(0),
    PageHandler.index(1),
    PageHandler.index(2),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BubbleBottomBar(
        opacity: .2,
        // currentIndex: currentIndex,
        // onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
          Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => pages[index],
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ));
        },
        elevation: 8,
        currentIndex: widget.currentIndex,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[

          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home_filled, color: Colors.black,), activeIcon: Icon(Icons.home_filled, color: Colors.red,), title: Text("خانه") ),


          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("محصولات")),

          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.login, color: Colors.black,), activeIcon: Icon(Icons.login, color: Colors.red,), title: Text("حساب کاربری")),

        ],
      ),
    );

  }
}
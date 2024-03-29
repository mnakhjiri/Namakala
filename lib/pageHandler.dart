import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:namakala/pages/Cart.dart';
import 'package:namakala/pages/CategoryPage.dart';
import 'package:namakala/pages/HomePage.dart';
import 'package:namakala/pages/Login.dart';
import 'package:namakala/widgets/FloatingButton.dart';

class PageHandler extends StatefulWidget {
  int index = 0;
  PageHandler();
  PageHandler.index(this.index);
  @override
  State<PageHandler> createState() => _PageHandlerState(index);
}

class _PageHandlerState extends State<PageHandler> {

  int pageIndex = 0;
  _PageHandlerState(this.pageIndex);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Namakala",
      theme: ThemeData(
        fontFamily: 'iransans',
        tabBarTheme:  TabBarTheme(
            labelColor: Colors.pink[800],
            labelStyle: TextStyle(color: Colors.pink[800]), // color for text
            indicator: UnderlineTabIndicator( // color for indicator (underline)
                borderSide: BorderSide(color: Colors.black)),
      ),),
      home:  Scaffold(
        body: buildPages(),
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: buildNav(),
    ),

    );
  }
  Widget buildPages(){
    switch(pageIndex){
      case 0:
        return HomePage();
      case 1:
        return CategoryPage();
      case 2:
        return LoginPage();
      default:
        return HomePage();
    }
  }

  Widget buildNav(){
    int selected = pageIndex;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BubbleBottomBar(
        opacity: .2,
        // currentIndex: currentIndex,
        // onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        onTap: (index) {
          setState(() {
            pageIndex = index;
            selected = index;
          });

        },
        elevation: 8,
        currentIndex: selected,
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




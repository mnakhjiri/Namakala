import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:namakala/pages/HomePage.dart';
import 'package:namakala/pages/Login.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({Key? key}) : super(key: key);
  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: "Namakala",
      theme: ThemeData(
        fontFamily: 'iransans',
      ),
      home:  Scaffold(
          resizeToAvoidBottomInset: false,
        body: buildPages(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shopping_bag_outlined),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: buildNav(),
    ),

    );
  }
  Widget buildPages(){
    switch(pageIndex){
      case 0:
        return HomePage();
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



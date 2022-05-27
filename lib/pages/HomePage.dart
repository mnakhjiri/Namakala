import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:namakala/widgets/Search.dart';

import '../widgets/SearchContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Namakala",
        theme: ThemeData(
          fontFamily: 'iransans',
        ),
        home: Scaffold(
          body: Column(
            children: [
              SearchContainer(),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.shopping_bag_outlined),
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: MyNavigationBar(),
        ),
      );
  }
}





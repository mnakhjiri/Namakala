import 'package:flutter/material.dart';

import '../widgets/NavigationBar.dart';

class ProdoctsPage extends StatelessWidget {
  const ProdoctsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Namakala",
      theme: ThemeData(
        fontFamily: 'iransans',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shopping_bag_outlined),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        bottomNavigationBar: MyNavigationBar(1),
      ),
    );
  }
}

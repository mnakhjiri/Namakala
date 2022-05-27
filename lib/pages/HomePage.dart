import 'package:flutter/material.dart';
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
        ),
      );
  }
}



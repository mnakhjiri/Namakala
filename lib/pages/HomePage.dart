import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:namakala/widgets/Search.dart';

import '../widgets/SearchContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Column(
            children: [
              SearchContainer(),
            ],
          );
  }
}





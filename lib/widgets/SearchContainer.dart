import 'package:flutter/material.dart';

import 'Search.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/25),
        height: 200,
        child: SearchBar());
  }
}
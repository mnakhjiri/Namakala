import 'package:flutter/material.dart';

import 'Search.dart';

class SearchContainer extends StatelessWidget {
  SearchContainer({
    Key? key,
  }) : super(key: key);

  var searchText = "جست و جو کنید";

  SearchContainer.text(this.searchText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/25),
        height: MediaQuery.of(context).size.height/10,
        child: SearchBar.text(searchText));
  }
}
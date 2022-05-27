import 'package:flutter/material.dart';
import '../MyIcons.dart';
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final height = size.height;

    final width = size.width;
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: Color(0xffdfdfdf),  ),
        margin: EdgeInsets.only( right: width/80 , left : width/80 ),
        padding: EdgeInsets.only(top :height/500 , bottom: height/500   ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  child: Icon(MyIcons.search,
                    size: 20,
                  )),
              SizedBox(
                width: (width/10)*8,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelStyle: new TextStyle(
                          color:  Colors.black,
                      ),
                    border: InputBorder.none,
                    labelText: "جست و جو کنید",
                  ),
                  controller: _controller,
                  // onSubmitted: (String value) async {
                  //   await showDialog<void>(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: const Text('Thanks!'),
                  //         content: Text(
                  //             'You typed "$value", which has length ${value.characters.length}.'),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.pop(context);
                  //             },
                  //             child: const Text('OK'),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
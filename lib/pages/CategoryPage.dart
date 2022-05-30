import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/10),
                child: Text("کالای دیجیتال",
                  style: TextStyle(
                    fontFamily: "vazirbold",
                    fontSize: 20,
                  ),
                )),
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                      alignment: Alignment.center,
                      child: Image.asset("lib/img/mobile.png",
                        width: MediaQuery.of(context).size.width/3,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:namakala/pages/ProductsPage.dart';

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
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
                child: Text("کالای دیجیتال",
                  style: TextStyle(
                    fontFamily: "vazirbold",
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height/(3),
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem("lib/img/mobile.png" , "موبایل"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/laptop.png" , "لپ تاپ"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/camera.png" , "دوربین"),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
                child: Text("پوشاک",
                  style: TextStyle(
                    fontFamily: "vazirbold",
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height/(3),
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem("lib/img/women.png" , "زنانه"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/men.png" , "مردانه"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/children.png" , "بچگانه"),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
                child: Text("کتاب و لوازم تحریر",
                  style: TextStyle(
                    fontFamily: "vazirbold",
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height/(3),
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem("lib/img/book.png" , "کتاب"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/stationary.png" , "لوازم تحریر"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/music.png" , "موسیقی"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/handicrafts.png" , "صنایع دستی"),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
                child: Text("ورزش و سفر",
                  style: TextStyle(
                    fontFamily: "vazirbold",
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height/(3),
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem("lib/img/sport-clothes.png" , "پوشاک ورزشی"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/sporteq.png" , "لوازم ورزشی"),
                  SizedBox(width: 20,),
                  categoryItem("lib/img/camping.png" , "لوازم سفر و کمپینگ"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class categoryItem extends StatelessWidget {
  final imgPath;
  final imgText;
  categoryItem(this.imgPath, this.imgText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ProdoctsPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ));
        },
        child: Column(
          children: [
            Image.asset(imgPath,
              height: MediaQuery.of(context).size.height/8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/30,
            ),
            Text(imgText,
            style: TextStyle(
              fontFamily: "vazirbold",
              color: Colors.black,
            ),
            )
          ],
        ),
        style:
        ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          primary: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

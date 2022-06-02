import 'package:flutter/material.dart';
import 'package:namakala/widgets/SearchContainer.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import '../widgets/NavigationBar.dart';

class ProdoctsPage extends StatelessWidget {
  var searchText = "جست و جو کنید";
  ProdoctsPage();
  ProdoctsPage.text(this.searchText);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Namakala",
      theme: ThemeData(
        fontFamily: 'iransans',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SearchContainer.text(searchText),
            Expanded(
              child: ListView(
                children: [
                  ProductSection(),
                  SizedBox(height: 5,),
                  ProductSection.arg("گوشی  samsung", "lib/img/products/samsung.png", "30,000,000", "4"),
                  SizedBox(height: 5,),
                  ProductSection.arg("گوشی  شیاومی", "lib/img/products/mi.png", "20,000,000", "4.5"),
                  SizedBox(height: 5,),
                  ProductSection.arg("گوشی  samsung", "lib/img/products/samsung2.png", "28,000,000", "4.7"),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
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
class ProductSection extends StatelessWidget {
  ProductSection();
  var data = "گوشی  Iphone";
  var img_src = "lib/img/products/iphone.png";
  var price = "40,000,000";
  var rating = " 4.5";
  ProductSection.arg(this.data, this.img_src, this.price, this.rating);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFe3e1e1)),

                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                      )
                  )
              ),
              child: Row(
                children: [
                  Image.asset(img_src,
                    width: MediaQuery.of(context).size.width/3,
                    ),
                    Expanded(
                      child: Column(
                      children: [
                        SizedBox(height: 20,),
                         Text(data,
                           textAlign: TextAlign.justify,
                           style: TextStyle(
                             fontFamily: 'vazirbold',
                             color: Colors.black,
                             height: 1.5 ,
                             fontSize: 18,
                           ),
                         ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Text(price.toPersianDigit()  + " تومان",
                              style: TextStyle(
                                color: Colors.black,
                              )
                              ),
                              SizedBox(width: 20,),
                              Text(rating.toPersianDigit() +  "⭐",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(onPressed: (){},
                            style: ButtonStyle(

                                backgroundColor:MaterialStateProperty.all(Colors.red) ,
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )
                                )
                            ),
                            child: Text("خرید",
                            style: TextStyle(
                              fontFamily: "vazirbold",
                              color: Colors.white,
                            ),),),
                        ),
                        SizedBox(height: 15,),
                      ],

                  ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}


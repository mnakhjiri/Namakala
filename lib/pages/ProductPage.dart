import 'package:flutter/material.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10 , top:10 , right: 20),
              child:Align(
                alignment: Alignment.bottomRight,
                child: Text("Galaxy S21  گوشی" ,  style: TextStyle(
                  fontSize: 25,
                ),),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40 ,  right: 20),
              child:Align(
                alignment: Alignment.bottomRight,
                child: Text("5G مدل" ,  style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height/2.5,
                child: Slider()),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              child: Directionality(
                textDirection: TextDirection.rtl  ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox(
                            width: MediaQuery.of(context).size.height/6,
                            child: Image.asset("lib/img/companies/samsung-company.png" , fit: BoxFit.cover,)),

                    ),
                    Text("نمایندگی سامسونگ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),

                    )
                  ],
                ),
              ),
            ),
            RadioGroup(),

          ],
        ),


        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height/10,
          child: Directionality(
            
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: Text(   "30,000,000 تومان".toPersianDigit() , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                ),
                ElevatedButton(onPressed: (){}, child: Container(
                  child: Text("افزودن به سبد خرید"),
                ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(left: 30 , right: 30)),
                        backgroundColor:  MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                            )
                        )
                    )
                )
              ],
            ),
          ),
        ),
      );
  }

  const ProductPage({Key? key}) : super(key: key);
}
class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 1 / 1.25);
    return PageView(
      controller: controller,
      children:  <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider-2.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider-3.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),


      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../pages/ProductPage.dart';

class AddedProductSection extends StatelessWidget {
  AddedProductSection();
  var data = "گوشی  Iphone";
  var img_src = "lib/img/products/iphone.png";
  var price = "40,000,000";
  var rating = " 4.5";
  AddedProductSection.arg(this.data, this.img_src, this.price, this.rating);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductPage()),
                );

              },
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
                    width: MediaQuery.of(context).size.width/5,
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
                        Text(price.toPersianDigit()  + " تومان",
                            style: TextStyle(
                              color: Colors.black,
                            )
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


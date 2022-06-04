import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../pages/ProductPage.dart';

class CartSection extends StatelessWidget {
  CartSection();
  var data = "گوشی  Iphone";
  var img_src = "lib/img/products/iphone.png";
  var price = "40,000,000";
  var rating = " 4.5";
  CartSection.arg(this.data, this.img_src, this.price, this.rating);
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
                        // SizedBox(
                        //   width: 200,
                        //   child: ElevatedButton(onPressed: (){},
                        //     style: ButtonStyle(
                        //
                        //         backgroundColor:MaterialStateProperty.all(Colors.red) ,
                        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(25),
                        //             )
                        //         )
                        //     ),
                        //     child: Text("خرید",
                        //       style: TextStyle(
                        //         fontFamily: "vazirbold",
                        //         color: Colors.white,
                        //       ),),),
                        // ),
                        SizedBox(height: 15,),
                      ],

                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("تعداد : 5 ".toPersianDigit() , style: TextStyle(
                          color: Colors.black,
                        ),),
                        Row(

                          children: [
                            SizedBox(width: 40 , child: ElevatedButton(onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              )
                            ),
                            child: Center(child: Icon(Icons.add , size: 10,)))),
                            SizedBox(width : 10),
                            SizedBox(width: 40 , child: ElevatedButton(onPressed: (){},
                                style: ButtonStyle(
                                    backgroundColor:  MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    )
                                ),
                                child: Center(child: Icon(Icons.remove , size: 10,)))),
                          ],
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}


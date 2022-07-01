import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../pages/ProductPage.dart';

class UserProductSection extends StatelessWidget {
  UserProductSection(this.price, this.date);
  var price = "0";
  var date = "1400 / 2 / 3";
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
                  Expanded(
                    child: Column(

                      children: [
                        SizedBox(height: 15,),

                        Text(date.toPersianDigit() , style: TextStyle(color: Colors.black , fontSize: 20), textDirection: TextDirection.ltr,),
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


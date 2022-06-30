import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/pages/Profile.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../ServerConnection.dart';
import '../pages/EditProduct.dart';
import '../pages/ProductPage.dart';

class AddedProductSection extends StatelessWidget {
  AddedProductSection();
  var data = "گوشی  Iphone";
  var img_src = "lib/img/products/iphone.png";
  var price = "40,000,000";
  var rating = " 4.5";
  var editHidden = false;
  AddedProductSection.arg(this.data, this.img_src, this.price, this.rating);
  AddedProductSection.argHidden(this.data, this.img_src, this.price, this.rating , this.editHidden);
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
                  MaterialPageRoute(builder: (context) =>  ProductPage.name(data)),
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
                  Image.network(img_src ,  width: MediaQuery.of(context).size.width/5),
                  // Image.asset(img_src,
                  //   // width: MediaQuery.of(context).size.width/5,
                  //
                  // ),
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
                  Visibility(
                    visible: !editHidden,
                    child: Container(
                      child: Column(
                        children: [
                          Row(

                            children: [
                              SizedBox(width: 40 , child: ElevatedButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  EditProduct(data)),
                                );
                              },
                                  style: ButtonStyle(
                                      backgroundColor:  MaterialStateProperty.all(Colors.black),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      )
                                  ),
                                  child: Center(child: Icon(Icons.edit , size: 10,)))),
                              SizedBox(width : 10),
                              SizedBox(width: 40 , child: ElevatedButton(onPressed: (){
                                send("deleteProduct-" + data, CurrentUser.port);
                              },
                                  style: ButtonStyle(
                                      backgroundColor:  MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      )
                                  ),
                                  child: Center(child: Icon(Icons.remove , size: 12, color: Colors.white,)))),
                            ],
                          )
                        ],
                      ),
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
  send(String serverData  ,int port) async{
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
    });
  }

}


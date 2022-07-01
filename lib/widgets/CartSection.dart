import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../CartData.dart';
import '../ServerConnection.dart';
import '../pages/ProductPage.dart';

class CartSection extends StatefulWidget {
  CartData cartData;

  CartSection.arg(this.cartData);

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.cartData.visible,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ProductPage.name(widget.cartData.product["name"])),
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
                    Image.network(widget.cartData.product["images"][0],
                      width: MediaQuery.of(context).size.width/5,
                    ),
                    Expanded(
                      child: Column(

                        children: [
                          SizedBox(height: 20,),
                          Text(widget.cartData.product["name"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'vazirbold',
                              color: Colors.black,
                              height: 1.5 ,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text((widget.cartData.product["price"] as String).toPersianDigit()  + " تومان",
                              style: TextStyle(
                                color: Colors.black,
                              )
                          ),

                          SizedBox(height: 15,),

                          SizedBox(height: 15,),
                        ],

                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("تعداد : ${widget.cartData.count} ".toPersianDigit() , style: TextStyle(
                            color: Colors.black,
                          ),),
                          Row(

                            children: [
                              SizedBox(width: 40 , child: ElevatedButton(onPressed: (){
                                setState((){
                                  widget.cartData.increase();
                                  cartSend("setCart-"  + CurrentUser.phoneNumber +  "-" + widget.cartData.product["name"] + "-" + widget.cartData.count.toString() , CurrentUser.port);

                                });
                              },
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
                              SizedBox(width: 40 , child: ElevatedButton(onPressed: (){
                                setState((){
                                  widget.cartData.decrease();
                                  cartSend("setCart-"  + CurrentUser.phoneNumber +  "-" + widget.cartData.product["name"] + "-" + widget.cartData.count.toString() , CurrentUser.port);
                                });
                              },
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
      ),
    );
  }
  cartSend(String serverData  , int port) async {
    String result = "ok";
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      print("hi");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
    });
  }
}


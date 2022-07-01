import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/widgets/CartSection.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';


import '../CartData.dart';
import '../ServerConnection.dart';
import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class Buy extends StatefulWidget {

  List<CartData> cartList;

  Buy(this.cartList);

  @override
  State<Buy> createState() => _BuyState();

}

class _BuyState extends State<Buy> {
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تکمیل خرید" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children:  [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),

                  child: SizedBox(
                    width: MediaQuery.of(context).size.width /1.25,
                    child:  TextField(
                      controller: addressController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'آدرس',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),

                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(child: Text("")),
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height/10,
        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                if(addressController.text != ""){
                  var finalResult = 0;
                  for(CartData cartData in widget.cartList){
                    finalResult+= cartData.getPrice();
                    cartSend("setCount-" + cartData.product["name"] + "-" + (cartData.max - cartData.count).toString(), CurrentUser.port);
                    cartSend("setCart-" + CurrentUser.phoneNumber + "-" +  cartData.product["name"] + "-" + "0" , CurrentUser.port);
                  }
                  var order = {};
                  order["price"] = finalResult.toString();
                  order["address"] = addressController.text;
                  order["userPhone"] = CurrentUser.phoneNumber;
                   cartSend("addOrder-" + jsonEncode(order), CurrentUser.port);
                  animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text("سفارش با موفقیت ثبت شد" , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
                    child: MaterialButton(
                      // FIRST BUTTON IS REQUIRED
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),);
                }else{
                  animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text("لطفا آدرس را وارد کنید" , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
                    child: MaterialButton(
                      // FIRST BUTTON IS REQUIRED
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),);
                }
              }, child: Container(
                child: Text("تکمیل خرید" , style: TextStyle(color: Colors.white),),
              ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 70 , right: 70 , top : 15 , bottom : 15)),
                      backgroundColor:  MaterialStateProperty.all(Colors.black),
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





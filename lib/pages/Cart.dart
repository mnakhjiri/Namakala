import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/pages/Buy.dart';
import 'package:namakala/widgets/CartSection.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../CartData.dart';
import '../ServerConnection.dart';
import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
  bool isLoaded = false;
  CartPage({Key? key}) : super(key: key);
}

class _CartPageState extends State<CartPage> {
  List<Widget> sections = [];
  var price = 0;
  List<CartData> cartdatas = [];
  @override
  void initState() {
    super.initState();
  }
  var icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    if(CurrentUser.isLogin == false){
     return Scaffold(
       body: Center(child:Text("برای خرید ابتدا وارد حساب خود شوید" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
       appBar: AppBar(
         centerTitle: true,
         title: Text("سبد خرید" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
         backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
         elevation: 0.0,
         leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Colors.black),
           onPressed: (){
             Navigator.of(context).pop();
           },
         ),

       ),

     );
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            child: FutureBuilder(
                future: send(
                    "getUserCart-",
                    CurrentUser.port),
                builder: (context, snapshot) => ListView(
                    children:sections
                )),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("سبد خرید" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),


      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height/10,
        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text(   "${price} تومان".toPersianDigit() , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Buy()));

              }, child: Container(
                child: Text("ادامه فرایند خرید" , style: TextStyle(color: Colors.white),),
              ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 30 , right: 30)),
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
  Future<void> send(String serverData, int port) async {
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        var result = utf8.decode(response);
        var jsons = result.split("-");
        var listArray = [];
        if(widget.isLoaded == false){
          print("object");
          widget.isLoaded = true;
          setState((){
          });
        }
        for (String json in jsons) {
          listArray.add(jsonDecode(json));
        }
        var currentCart = listArray[0];
        var finalCurrentCart = {};
        for(var key in currentCart.keys ){
          finalCurrentCart[jsonDecode(key)] = currentCart[key];
        }
        var maxCart = listArray[1];
        var finalMaxCart = {};
        for(var key in maxCart.keys ){
          finalMaxCart[jsonDecode(key)] = maxCart[key];
        }
        maxCart = finalMaxCart;
        currentCart = finalCurrentCart;
        cartdatas = [];
        for(var product in currentCart.keys){
          var maxFound;
          for(var maxProduct in maxCart.keys){
            if(product["name"] == maxProduct["name"]){
              maxFound =  maxCart[maxProduct];
            }
          }
          print("count + " + (currentCart[product] as String).toEnglishDigit() );
          cartdatas.add(new CartData(int.parse((product["price"] as String).toEnglishDigit()), int.parse((maxFound as String).toEnglishDigit()), product , int.parse((currentCart[product] as String).toEnglishDigit()) ));
        }
        price = 0;
        sections = [];
        for(CartData cartData in cartdatas){
          if(cartData.count > 0){
            sections.add(
                CartSection.arg(cartData)
            );
          }
          price += cartData.getPrice();
        }
        sections.add(
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState((){});
                  },
                  child: Icon(
                    Icons.refresh_sharp,
                    color: Colors.black,
                    size: 40.0,
                  ),
                )
            )
        );
      });
    });
  }
}

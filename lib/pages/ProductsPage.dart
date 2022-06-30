import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/pages/ProductPage.dart';
import 'package:namakala/widgets/FloatingButton.dart';
import 'package:namakala/widgets/SearchContainer.dart';
import  'package:persian_number_utility/persian_number_utility.dart';
import '../CurrentUser.dart';
import '../ServerConnection.dart';
import '../widgets/NavigationBar.dart';

class ProdoctsPage extends StatefulWidget {
  var isLoaded = false;
  var searchText = "جست و جو کنید";
  ProdoctsPage();
  ProdoctsPage.text(this.searchText);
  var name = "";
  ProdoctsPage.full(this.searchText, this.name);

  @override
  State<ProdoctsPage> createState() => _ProdoctsPageState();
}

class _ProdoctsPageState extends State<ProdoctsPage> {
  List<Widget> sections = [];
  @override
  void initState() {
    super.initState();
    print("state initialized ");
    setState(() {});
  }
  Future<void> send(String serverData, ServerType serverType) async {
    int? port = ServerConnection.ports[serverType];
    await Socket.connect(ServerConnection.host, port!).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        var result = utf8.decode(response);
        var jsons = result.split(",,");
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
        sections = [];
        for (var arrrayItem in listArray) {
          sections.add(ProductSection.arg(
              arrrayItem["name"],
              arrrayItem["images"][0],
              arrrayItem["price"],
              arrrayItem["rating"]));
        }
      });
    });
  }

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
            SearchContainer.text(widget.searchText),
            Expanded(
              child: FutureBuilder(
                  future: send(
                      "getProducts-${widget.name}",
                      ServerType.ProductView),
                  builder: (context, snapshot) => ListView(
                      children:sections
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        bottomNavigationBar: MyNavigationBar(1),
      ),
    );
  }
}
class ProductSection extends StatefulWidget {

  ProductSection();
  var data = "گوشی  Iphone";
  var img_src = "lib/img/products/iphone.png";
  var price = "40,000,000";
  var rating = " 4.5";
  ProductSection.arg(this.data, this.img_src, this.price, this.rating);

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  Widget cartWidget = SizedBox(
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
  );
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductPage.name(widget.data)),
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
                  Image.network(widget.img_src,
                    width: MediaQuery.of(context).size.width/3,
                    ),
                    Expanded(
                      child: Column(
                      children: [
                        SizedBox(height: 20,),
                         Text(widget.data,
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
                              Text(widget.price.toPersianDigit()  + " تومان",
                              style: TextStyle(
                                color: Colors.black,
                              )
                              ),
                              SizedBox(width: 20,),
                              Text(widget.rating.toPersianDigit() +  "⭐",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15,),
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


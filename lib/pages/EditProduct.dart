import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/pageHandler.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../CurrentUser.dart';
import '../ServerConnection.dart';
import '../widgets/passwordField.dart';

class EditProduct extends StatefulWidget {
  EditProduct(this.name);
  var name;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController attController = TextEditingController();
  TextEditingController overalAttController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController Urls = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        fontFamily: 'vazirbold',
      ),

      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            padding: EdgeInsets.all(20),
            children: [
              Container(
                child: Text('ویرایش کالا',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height/20,
                    fontFamily: 'vazirbold',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text('برای عدم تغییر بخشی آن را خالی قرار دهید',
                  style: TextStyle(
                    fontSize:16,
                    fontFamily: 'vazirbold',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'نام کالا',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: categoryController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'دسته بندی کالا (با - جدا شود)',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: priceController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'قیمت',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: attController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'ویژگی های اجباری ',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Text("مثال : اندازه-بزرگ-کوچک*رنگ-قرمز-آبی"  , textAlign: TextAlign.center,)),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: overalAttController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'ویژگی های مشترک برای هر دسته (با - جدا شود) ',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: countController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'تعداد ',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: Urls,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: ' ( "url1" "url2" "url3"  : مثال )  آدرس عکس ها',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(onPressed: (){
                    var serverMap = {};
                    var strs = attController.text.split("\*");
                    var atts = {};
                    for(String str in strs){
                      var datas = str.split("-");
                      var temp = datas[0];
                      datas.removeAt(0);
                      atts[temp] = datas;
                    }
                    serverMap['count'] = countController.text.toEnglishDigit();
                    serverMap['name'] = nameController.text;
                    serverMap['categories'] = categoryController.text.split("-");
                    serverMap['price'] = priceController.text;
                    serverMap['properties'] = atts;
                    serverMap['info'] = overalAttController.text.split("-");
                    serverMap['images'] = Urls.text.split("-");
                    send( "editProduct-" + widget.name + "-"+ jsonEncode(serverMap), CurrentUser.port);
                    animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text("محصول با موفقیت تغییر یافت" , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
                      child: MaterialButton(
                        // FIRST BUTTON IS REQUIRED
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () {
                        },
                      ),
                    ),);



                  }, child:
                  Text('ویرایش کالا', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
                    style:
                    ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      textStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
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


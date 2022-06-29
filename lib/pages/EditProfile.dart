import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/pageHandler.dart';

import '../ServerConnection.dart';
import '../widgets/passwordField.dart';
import 'Profile.dart';

class EditProfile extends StatefulWidget {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _mailController = new TextEditingController();

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final imgController = TextEditingController();
  var serverResult = "درحال ارتباط با سرور";
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
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Container(
                child: Text('ویرایش اطلاعات کاربری',
                  style: TextStyle(
                    fontSize:30,
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
                margin: EdgeInsets.only(top : 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'نام و نام خانوادگی',
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
                    controller: phoneController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'شماره تماس',
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
                    controller: mailController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'ایمیل',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              PasswordWidget.controller(passController),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child:  TextField(
                    controller: imgController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'لینک عکس پروفایل',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(onPressed: (){
                    var result = checkInputs();
                    if(result == ""){
                      var newUser = {
                        "name": nameController.text,
                        "phoneNumber": phoneController.text,
                        "mail": mailController.text,
                        "pass": passController.text,
                        "img": imgController.text,
                      };
                      send(  "edit" + "-"+ jsonEncode(newUser), CurrentUser.port);
                      Timer(Duration(milliseconds: 500) , (){
                        animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text(" اطلاعات با موفقیت تغییر یافت برای مشاهده تغییرات پس از بازگشت دوباره وارد بخش حساب کاربری شوید." , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
                        child: MaterialButton(
                          // FIRST BUTTON IS REQUIRED

                          onPressed: () {
                          },
                        ),
                      ),);});
                    }else{
                      animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text(result , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
                        child: MaterialButton(
                          // FIRST BUTTON IS REQUIRED
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Colors.white,
                          child: Text('متوجه شدم'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),);
                    }


                  }, child:
                  Text('ویرایش اطلاعات', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
                    style:
                    ElevatedButton.styleFrom(
                      primary: Colors.black,
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
  String checkInputs(){
    RegExp phoneReg = new RegExp(
      r"09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}",
    );
    RegExp mailReg = new RegExp(
      r"^(.+)@(.+)$",
    );
    RegExp passReg = new RegExp(
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
    );
    String result = "";
    var phoneAlert = "شماره درست وارد نشده است";
    var passAlert = "رمز عبور در فرمت مناسبی نمی باشد"  + "\n" + "رمز باید شامل حروف کوچک و بزرگ  و عدد و حداقل 8 کاراکتر باشد";
    var mailAlert = "ایمیل در فرمت درستی نمی باشد";
    if(!phoneReg.hasMatch(phoneController.text) && phoneController.text != ""){
      result += phoneAlert + "\n\n";
    }
    if(!mailReg.hasMatch(mailController.text) && mailController.text != ""){
      result += mailAlert + "\n\n";
    }
    if(!passReg.hasMatch(passController.text) && passController.text != ""){
      result += passAlert + "\n\n";
    }
    return result.trim();
  }
  Future<String> send(String serverData  ,int port) async{
    String result  = "ok";
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        result = utf8.decode(response);
        setState((){
          var userInfo =  jsonDecode(result);
          CurrentUser.name = userInfo["name"];
          CurrentUser.mail = userInfo["mail"];
          CurrentUser.pass = userInfo["pass"];
          CurrentUser.phoneNumber = userInfo["phoneNumber"];
          if(userInfo["img"] == null){
            CurrentUser.img = "";
          }else{
            CurrentUser.img = userInfo["img"];
          }
        });
      });
    });
    return result;
  }
}


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:namakala/ServerConnection.dart';
import 'package:namakala/pageHandler.dart';

import '../widgets/passwordField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => PageHandler.index(2))
              );
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
          child: Text('ثبت نام',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/20,
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
                    hintText: 'شماره تماس (با 0 شروع شود)',
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
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(onPressed: ()  async {
                  var result = checkInputs();
                  if(result == ""){
                    var user = {
                      "name": nameController.text,
                      "phoneNumber": phoneController.text,
                      "mail" : mailController.text,
                      "pass" : passController.text
                    };
                      send(jsonEncode(user), ServerType.RegisterHandler);
                      Timer(Duration(milliseconds: 500) , (){animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text(serverResult , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
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
                        onPressed: () {
                        },
                      ),
                    ),);
                  }
                }, child:
                Text('ثبت نام', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
                  style:
                  ElevatedButton.styleFrom(
                    primary: Color(0xFFf72500),
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
    if(nameController.text == ""){
      result += "نام خالی می باشد" + "\n\n";
    }
    if(!phoneReg.hasMatch(phoneController.text)){
      result += phoneAlert + "\n\n";
    }
    if(!mailReg.hasMatch(mailController.text)){
      result += mailAlert + "\n\n";
    }
    if(!passReg.hasMatch(passController.text)){
      result += passAlert + "\n\n";
    }
    return result.trim();
  }
  Future<String> send(String serverData  , ServerType type) async{
    String result  = "ok";
    int? port = ServerConnection.ports[type];
    await Socket.connect(ServerConnection.host, port!).then((serverSocket) {
      print("connected");
      var listServer = utf8.encode(serverData) + [0];
      // print(String.fromCharCodes(listServer));
      // print(utf8.decode(listServer));
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        result = utf8.decode(response);
        setState((){

          if(result == "registered"){
            serverResult = "با موفقیت ثبت نام شدید از طریق پنل وارد حساب خود شوید";
          }
          if(result == "unregistered"){
            serverResult = "شماره همراه تکراری است لطفا وارد شده یا شماره جدیدی وارد کنید";
          }
        });
      });
    });
    return result;
  }
}


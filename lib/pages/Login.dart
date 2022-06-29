import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/pages/Profile.dart';
import 'package:namakala/pages/Register.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import '../CurrentUser.dart';
import '../ServerConnection.dart';
import '../widgets/NavigationBar.dart';

class LoginPage extends StatefulWidget {
  PasswordWidget passwordWidget = PasswordWidget();
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loggedIn = false;
  var phone = "";
  var pass = "";
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      if(!loggedIn && !CurrentUser.isLogin){
        return ListView(
          padding: EdgeInsets.all(30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginWelcome(),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width /1.25,
                child:  TextField(
                  controller: phoneController,
                  onChanged: (text) {
                    phone = text;
                  },
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

            widget.passwordWidget,

            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width /1.25,
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(onPressed: (){
                  send( phone + " " + widget.passwordWidget.passValue  , ServerType.LoginHandler);

                  // check later
                  Timer(Duration(milliseconds: 300) , (){
                    if(loggedIn == false){
                      animated_dialog_box.showCustomAlertBox(context: context, yourWidget: Center(child: Text("کاربری با این مشخصات یافت نشد" , style: TextStyle(), textAlign: TextAlign.center,)), firstButton: Center(
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
                    }else{

                    }
                  });
                }, child:
                Text('ورود', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
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
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width /1.25,
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => RegisterPage())
                  );
                }, child:
                Text('ثبت نام', style: TextStyle(color: Color(0xFFf72500), fontFamily: 'vazirbold' , fontSize: 17),),
                  style:
                  ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.red,),
                    primary: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return ProfilePage();
  }
  Future<String> send(String serverData  , ServerType type) async{
    String result  = "ok";
    int? port = ServerConnection.ports[type];
    await Socket.connect(ServerConnection.host, port!).then((serverSocket) {
      // print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        result = utf8.decode(response);
        print(result);
        setState((){
          if(result == "failed"){
            print("failed");
          }else{
            setState((){
              loggedIn = true;
              CurrentUser.isLogin = true;
              var info = jsonDecode(result);
              CurrentUser.name = info['name'];
              CurrentUser.phoneNumber = info['phoneNumber'];
              CurrentUser.mail = info['mail'];
              CurrentUser.pass = info['pass'];

              // CurrentUser.phoneNumber = result.split(" ")[0];
              // CurrentUser.port = int.parse(result.split(" ")[1]);
            });
          }

        });
      });
    });
    return result;
  }
}



class LoginWelcome extends StatelessWidget {
  const LoginWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top : MediaQuery.of(context).size.height/7),
        child: Text('ورود',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/20,
          fontFamily: 'vazirbold',
        ),
          textAlign: TextAlign.center,
        ),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  var passValue = "";
  PasswordWidget();

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {

  bool _isHidden = true;
  void _togglePasswordView(){
    setState((){
      _isHidden = !_isHidden;
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width /1.25,
        child:  TextField(
          onChanged: (text){
            widget.passValue = text;
          },
          obscureText: _isHidden,
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon( Icons.visibility),
            ),
            hintText: 'رمز عبور',
            labelStyle: TextStyle(
              color: Colors.black,
            ),

          ),

        ),
      ),
    );
  }

}
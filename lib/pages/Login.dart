import 'package:flutter/material.dart';
import 'package:namakala/pages/Register.dart';

import '../widgets/NavigationBar.dart';
import '../widgets/passwordField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: const TextField(
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
        PasswordWidget(),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width /1.25,
            height: MediaQuery.of(context).size.height / 15,
            child: ElevatedButton(onPressed: (){}, child:
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

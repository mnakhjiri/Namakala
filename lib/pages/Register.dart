import 'package:flutter/material.dart';
import 'package:namakala/pageHandler.dart';
import 'package:namakala/pages/Login.dart';

import '../widgets/passwordField.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'vazirbold',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                child: const TextField(
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
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width /1.25,
                child: const TextField(
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
            PasswordWidget(),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width /1.25,
                height: MediaQuery.of(context).size.height / 15,
                child: ElevatedButton(onPressed: (){}, child:
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
}

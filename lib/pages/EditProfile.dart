import 'package:flutter/material.dart';
import 'package:namakala/pageHandler.dart';

import '../widgets/passwordField.dart';

class EditProfile extends StatefulWidget {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _mailController = new TextEditingController();

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                  Text('آپلود عکس', style: TextStyle(color: Colors.white, fontFamily: 'vazirbold' , fontSize: 17),),
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
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(onPressed: (){}, child:
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
}


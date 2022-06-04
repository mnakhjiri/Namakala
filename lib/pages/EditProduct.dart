import 'package:flutter/material.dart';
import 'package:namakala/pageHandler.dart';

import '../widgets/passwordField.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
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
                  child: const TextField(
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
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'دسته بندی کالا (با / جدا شود)',
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
                      hintText: 'نام فروشنده',
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
                  child: const TextField(
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
              Center(child: Text("مثال : {رنگ}{قرمز20 , سفید10 , صورتی5},{سایز}{کوچک3 , بزرگ2}"  , textAlign: TextAlign.center,)),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /1.25,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'ویژگی های مشترک برای هر دسته (با / جدا شود) ',
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
                      hintText: ' ( {url1} , {url2}  : مثال )  آدرس عکس ها',
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
                  child: ElevatedButton(onPressed: (){}, child:
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
}


import 'package:flutter/material.dart';
import 'package:namakala/pages/EditProfile.dart';
import 'package:namakala/pages/addProduct.dart';
import 'package:namakala/widgets/AddedProductSection.dart';
import 'package:namakala/widgets/FavProduct.dart';
import 'package:namakala/widgets/SearchContainer.dart';
import 'package:namakala/widgets/UserProductSection.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
            SliverToBoxAdapter(
              child: SafeArea(
                child:
                 Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/20,),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50), // Image border
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.height/9,
                                    child: Image.asset("lib/img/avatar.jpg" , fit: BoxFit.cover,)),

                              ),
                            ),
                            Text("کاربر تست" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 )),
                          ],
                        ),
                      )
                    ],
                  ),

              ),
            ),
              SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TabBar(
                    tabs: [
                      Tab(child: Icon(Icons.info , color: Colors.black,)),
                      Tab(child: Icon(Icons.history , color: Colors.black,)),
                      Tab(child: Icon(Icons.my_library_add , color: Colors.black,)),
                      Tab(child: Icon(Icons.favorite , color: Colors.black,)),
                    ],
                  ),
                ),
              ),
                SliverFillRemaining(
                  child: Directionality(
                    
                    textDirection: TextDirection.rtl,
                    child: TabBarView(
                      children: [
                        UserInfo(),
                        UserHistory(),
                        MyProducts(),
                        Fav()
                      ],
                    ),
                  ),
                )
          ])),
    );

  }
}

class Fav extends StatelessWidget {
  const Fav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Text("لیست علاقه مندی ها" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
        SearchContainer.text("جست و جو در علاقه مندی ها"),
        FavProduct(),
        FavProduct.arg("گوشی  شیاومی", "lib/img/products/mi.png", "20,000,000", "4.5"),
        FavProduct.arg("گوشی  samsung", "lib/img/products/samsung2.png", "28,000,000", "4.7"),

      ],
    );
  }
}

class MyProducts extends StatelessWidget {
  const MyProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Text("کالا های من" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
        SizedBox(height: 15,),
        Padding(
          padding: EdgeInsets.only(left: 60 , right : 60),
          child: ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()));
          }, child: Text("افزودن کالا") , style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15)),
              backgroundColor:  MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              )
          )),
        ),
        AddedProductSection(),
        AddedProductSection.arg("گوشی  شیاومی", "lib/img/products/mi.png", "20,000,000", "4.5"),
        AddedProductSection.arg("گوشی  samsung", "lib/img/products/samsung2.png", "28,000,000", "4.7"),

      ],
    );
  }
}

class UserHistory extends StatelessWidget {
  const UserHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Center(child: Text("سفارش های ثبت شده" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
          SearchContainer.text("جست و جو در سفارش ها"),
          UserProductSection(),
          UserProductSection.arg("گوشی  شیاومی", "lib/img/products/mi.png", "20,000,000", "4.5"),
          UserProductSection.arg("گوشی  samsung", "lib/img/products/samsung2.png", "28,000,000", "4.7"),

        ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(child: Text("اطلاعات کاربری" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
        SizedBox(height: 25,),
        Center(child: Text("نام:" , style: TextStyle( fontSize: 15),)),
        SizedBox(height: 15,),
        Center(child: Text("علی علوی" , style: TextStyle( fontSize: 20),)),
        SizedBox(height: 50,),
        Center(child: Text("ایمیل:" , style: TextStyle( fontSize: 15),)),
        SizedBox(height: 15,),
        Center(child: Text("Ali@ali.com" , style: TextStyle( fontSize: 20),)),
        SizedBox(height: 50,),
        Center(child: Text("شماره تماس:" , style: TextStyle( fontSize: 15),)),
        SizedBox(height: 15,),
        Center(child: Text("09121212121" , style: TextStyle( fontSize: 20),)),
        SizedBox(height: 15,),
        Padding(
          padding: EdgeInsets.only(left: 40 , right : 40),
          child: ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()));
          }, child: Text("ویرایش اطلاعات کاربری") , style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15)),
              backgroundColor:  MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              )
          )),
        )
      ],
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/pageHandler.dart';
import 'package:namakala/pages/EditProfile.dart';
import 'package:namakala/pages/Login.dart';
import 'package:namakala/pages/addProduct.dart';
import 'package:namakala/widgets/AddedProductSection.dart';
import 'package:namakala/widgets/FavProduct.dart';
import 'package:namakala/widgets/SearchContainer.dart';
import 'package:namakala/widgets/UserProductSection.dart';

import '../ServerConnection.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> sections = [];
  List<Widget> favSections = [];
  List<Widget> orders = [];
  @override
  void initState() {
    super.initState();
    print("state initialized ");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget imgWidget = Image.asset(
      "lib/img/avatar.jpg",
      fit: BoxFit.cover,
    );
    if (CurrentUser.img != "") {
      imgWidget = Image.network(CurrentUser.img);
    }
    print(CurrentUser.name);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              // Image border
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.height / 9,
                                  child: imgWidget),
                            ),
                          ),
                          Text(CurrentUser.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          ElevatedButton(
                              onPressed: () {
                                send("exit- ", CurrentUser.port);
                                CurrentUser.isLogin = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageHandler()));
                              },
                              child: Text("خروج"),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(15)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )))),
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
                    Tab(
                        child: Icon(
                      Icons.info,
                      color: Colors.black,
                    )),
                    Tab(
                        child: Icon(
                      Icons.history,
                      color: Colors.black,
                    )),
                    Tab(
                        child: Icon(
                      Icons.my_library_add,
                      color: Colors.black,
                    )),
                    Tab(
                        child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                    )),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TabBarView(
                  children: [
                    const UserInfo(),
                  FutureBuilder(
                    future: orderSend("getOrders-", CurrentUser.port),
                    builder: (context , snapshot) => ListView(
                      children: [
                        Center(
                            child: Text(
                              "سفارش های ثبت شده",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SearchContainer.text("جست و جو در سفارش ها"),
                        Column(
                          children: orders,
                        )
                      ],
                    ),
                  ),
                    FutureBuilder(
                        future: send("userProduct- ", CurrentUser.port),
                        builder: (context, snapshot) => ListView(
                              children: [
                                const Center(
                                    child: Text(
                                  "کالا های من",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60, right: 60),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddProduct()));
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.all(15)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ))),
                                      child: const Text("افزودن کالا")),
                                ),
                                Column(children: sections)
                              ],
                            )),
                    FutureBuilder(
                        future: favSend(
                            "favProduct-${CurrentUser.phoneNumber}",
                            CurrentUser.port),
                        builder: (context, snapshot) => ListView(
                              children:[
                                Center(
                                    child: Text(
                                      "لیست علاقه مندی ها",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    )),
                                SearchContainer.text("جست و جو در علاقه مندی ها"),
                                Column(
                                  children:favSections ,
                                )
                              ]
                            )),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  Future<void> favSend(String serverData, int port) async {
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        var result = utf8.decode(response);
        var jsons = result.split(",,");
        print(jsons);
        var listArray = [];
        for (String json in jsons) {
          listArray.add(jsonDecode(json));
        }
        favSections = [];
        for (var arrrayItem in listArray) {
          favSections.add(AddedProductSection.argHidden(
              arrrayItem["name"],
              arrrayItem["images"][0],
              arrrayItem["price"],
              arrrayItem["rating"],
              true));
        }
      });
    });
  }
  Future<void> orderSend(String serverData, int port) async {
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        var result = utf8.decode(response);
        var serverOrders = jsonDecode(result);
        orders = [];
        print("orders are : ");
        print(serverOrders);
        for(var order in serverOrders){
          var ordermap = jsonDecode(order);
          orders.add(
            UserProductSection(ordermap["price"].toString(), ordermap["address"] )
          );
        }
      });
    });
  }
  Future<void> send(String serverData, int port) async {
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        var result = utf8.decode(response);
        var jsons = result.split(",,");
        var listArray = [];
        for (String json in jsons) {
          listArray.add(jsonDecode(json));
        }
        sections = [];
        for (var arrrayItem in listArray) {
          sections.add(AddedProductSection.arg(
              arrrayItem["name"],
              arrrayItem["images"][0],
              arrrayItem["price"],
              arrrayItem["rating"]));
        }
      });
    });
  }
// send(String serverData  , int port) async{
//   String result  = "ok";
//   await Socket.connect(ServerConnection.host, port).then((serverSocket) {
//     // print("connected");
//     serverSocket.write(serverData + "\u0000");
//     serverSocket.flush();
//   });
// }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: Text(
          "اطلاعات کاربری",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
        SizedBox(
          height: 25,
        ),
        Center(
            child: Text(
          "نام:",
          style: TextStyle(fontSize: 15),
        )),
        SizedBox(
          height: 15,
        ),
        Center(
            child: Text(
          CurrentUser.name,
          style: TextStyle(fontSize: 20),
        )),
        SizedBox(
          height: 50,
        ),
        Center(
            child: Text(
          "ایمیل:",
          style: TextStyle(fontSize: 15),
        )),
        SizedBox(
          height: 15,
        ),
        Center(
            child: Text(
          CurrentUser.mail,
          style: TextStyle(fontSize: 20),
        )),
        SizedBox(
          height: 50,
        ),
        Center(
            child: Text(
          "شماره تماس:",
          style: TextStyle(fontSize: 15),
        )),
        SizedBox(
          height: 15,
        ),
        Center(
            child: Text(
          CurrentUser.phoneNumber,
          style: TextStyle(fontSize: 20),
        )),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Text("ویرایش اطلاعات کاربری"),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )))),
        )
      ],
    );
  }
}

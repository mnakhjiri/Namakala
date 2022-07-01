import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:namakala/CurrentUser.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../CurrentUser.dart';
import '../CurrentUser.dart';
import '../ServerConnection.dart';
import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
  var name = "";

  ProductPage.name(this.name);
  bool isOwner = false;
  bool isPriced = false;
  ProductPage();
}

class _ProductPageState extends State<ProductPage> {
  List<Widget> sections = [];
  Widget priceWidget = Center(child: Text(   "".toPersianDigit() , style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20
  ),),
  );
  Widget cartWidget = ElevatedButton(onPressed: (){},style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.only(left: 30 , right: 30)),
      backgroundColor:  MaterialStateProperty.all(Colors.red),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      )
  ), child: Container(
    child: Text("افزودن به سبد خرید"),
  ));

   setCart(){
    if(CurrentUser.isLogin == false){
       cartWidget = ElevatedButton(onPressed: (){},style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.only(left: 30 , right: 30)),
          backgroundColor:  MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
          )
      ), child: Container(
        child: Text("ابتدا وارد شوید"),
      ));
    }
  }
  cartAdd(){

  }
  var userPhone = "";
  cartSend(String serverData  , int port) async{
  String result  = "ok";
  await Socket.connect(ServerConnection.host, port).then((serverSocket) {
    print("connected");
    serverSocket.write(serverData + "\u0000");
    serverSocket.flush();
  });
}
  @override
  void initState(){
    super.initState();
    cartWidget = ElevatedButton(onPressed: (){
      setState((){
        cartSend("setCart" + "-" + CurrentUser.phoneNumber + "-" + widget.name + "-" + "1" ,CurrentUser.port );
        cartWidget = ElevatedButton(onPressed: (){

        },style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.only(left: 30 , right: 30)),
            backgroundColor:  MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            )
        ), child: Container(
          child: Text("در سبد خرید"),
        ));
      });
    },style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.only(left: 30 , right: 30)),
        backgroundColor:  MaterialStateProperty.all(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        )
    ), child: Container(
      child: Text("افزودن به سبد خرید"),
    ));
    setCart();

    if(CurrentUser.isLogin == true){
      userPhone = CurrentUser.phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Visibility(
                  visible: CurrentUser.isLogin,
                  child: GestureDetector(

                    onTap: () {
                      setState((){
                        if(icon == Icons.favorite_border){
                          icon = Icons.favorite;
                          favSend("fav-" + "set" + "-" + widget.name , CurrentUser.port);
                        }else{
                          icon = Icons.favorite_border;
                          favSend("fav-" + "reset" + "-" + widget.name , CurrentUser.port);

                        }
                      });
                    },
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 26.0,
                    ),
                  ),
                )
            )
          ],
        ),
        body: FutureBuilder(
          future: send(userPhone + "-" + widget.name, ServerType.ProductView),
          builder: (context ,  snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
              case ConnectionState.done:
                return ListView(
                  children: sections,
                );
            }
          },
        ),

        //
        // Center(child: CircularProgressIndicator(
        //   color: Colors.red,
        // )),

        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height/10,
          child: Directionality(

            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                priceWidget,
                cartWidget,

              ],
            ),
          ),
        ),
      );
  }
  favSend(String serverData  ,int port) async{
    await Socket.connect(ServerConnection.host, port).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
    });
  }
  var icon = Icons.favorite_border;
  Future<void> send(String serverData, ServerType serverType) async {
    int? port = ServerConnection.ports[serverType];
    var result = "";
    await Socket.connect(ServerConnection.host, port!).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        result = utf8.decode(response);
        print(result);
        var results= result.split("-");
        var productMap = jsonDecode(results[1]);
        if(results[0] == "true" && widget.isOwner == false){
          widget.isOwner = true;
          setState((){

            cartWidget = ElevatedButton(onPressed: (){},style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(left: 20 , right: 20)),
                backgroundColor:  MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                )
            ), child: Container(
              child: Text("فروشنده اید"),

            ));
            priceWidget = Center(child: Text(  (productMap["price"] as String).toPersianDigit() + " تومان" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            );
            if(productMap["favUsers"].contains(CurrentUser.phoneNumber)){
              icon = Icons.favorite;
            }else{
              icon = Icons.favorite_outline;
            }
          });

        }else if(widget.isPriced == false && widget.isOwner == false){
          setState((){
            print("hi");
            if(productMap["carts"].containsKey(CurrentUser.phoneNumber) && productMap["carts"][CurrentUser.phoneNumber] != "0"){
              cartWidget = ElevatedButton(onPressed: (){

              },style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(left: 30 , right: 30)),
                  backgroundColor:  MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  )
              ), child: Container(
                child: Text("در سبد خرید"),
              ));
            }else{
              if( int.parse((productMap["count"] as String).toEnglishDigit()) == 0 ){
                cartWidget = ElevatedButton(onPressed: (){},style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(left: 20 , right: 20)),
                    backgroundColor:  MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    )
                ), child: Container(
                  child: Text("اتمام موجودی"),

                ));
              }
            }

            if(productMap["favUsers"].contains(CurrentUser.phoneNumber)){
              icon = Icons.favorite;
            }else{
              icon = Icons.favorite_outline;
            }
            widget.isPriced = true;
            priceWidget = Center(child: Text(   (productMap["price"] as String).toPersianDigit() + " تومان" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            );
          });
        }
        Widget img = Image.asset("lib/img/avatar.jpg" , fit: BoxFit.cover,);
        if(results[2] != "null"){
          img = Image.network(results[2] , fit:BoxFit.cover ,);

        }
        List<Widget> radios = [];
        print( productMap["properties"]);
        productMap["properties"].keys.forEach(
                (key){
              print("key is" + key);
              radios.add(
                SizedBox(height: 20,)
              );
              radios.add(
                Text(key , style: TextStyle(
                  fontSize: 17
                ),),
              );
              radios.add(
                  Center(child: RadioGroup(key, productMap["properties"][key]))
              );
            }
        );
        List<Widget> infos = [];
        for(var info in productMap["info"]){
          infos.add(
            Text(    info , style: TextStyle( height: 1.50, ), textAlign: TextAlign.justify, textDirection: TextDirection.rtl,),
          );
        }

        sections = [
          Container(
            padding: EdgeInsets.only(bottom: 10 , top:10 , right: 20),
            child:Align(
              alignment: Alignment.bottomRight,
              child: Text(productMap["name"] ,  style: TextStyle(
                fontSize: 25,
              ),),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: Slider(productMap["images"])),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(30),
            child: Directionality(
              textDirection: TextDirection.rtl  ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox(
                        width: MediaQuery.of(context).size.height/6,
                        child: img),

                  ),
                  Text(productMap["seller"]["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),

                  )
                ],
              ),
            ),
          ),
          Column(
            children: radios,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text("توضیحات کالا" , style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Container( padding: EdgeInsets.all(20), child: Column(
                  children: [
                    Text(
                       " امتیاز کاربران :  ⭐" + productMap["rating"]+ "\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                      children: infos,
                    )
                  ],
                ))
              ],
            ),
          )
        ];
      });
    });
  }
}
class Slider extends StatelessWidget {
  Slider(this.images);
  var images;

  @override
  Widget build(BuildContext context) {
    List<Widget> sliders = [];
    for(var image in images){
      sliders.add(
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  NetworkImage(image),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),
      );
    }
    final PageController controller = PageController(viewportFraction: 1 / 1.25);
    return PageView(
      controller: controller,
      children:  sliders
    );
  }
}

// <Widget>[
// Padding(
// padding: const EdgeInsets.only(left:20 , right: 20),
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image:  AssetImage("lib/img/products/s21-slider.jpg"),
// fit: BoxFit.cover
// )
// )
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left:20 , right: 20),
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image:  AssetImage("lib/img/products/s21-slider-2.jpg"),
// fit: BoxFit.cover
// )
// )
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left:20 , right: 20),
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image:  AssetImage("lib/img/products/s21-slider-3.jpg"),
// fit: BoxFit.cover
// )
// )
// ),
// ),
//
//
// ],


// Container(
// padding: EdgeInsets.only(bottom: 10 , top:10 , right: 20),
// child:Align(
// alignment: Alignment.bottomRight,
// child: Text("Galaxy S21  گوشی" ,  style: TextStyle(
// fontSize: 25,
// ),),
// ),
// ),
// Container(
// padding: EdgeInsets.only(bottom: 40 ,  right: 20),
// child:Align(
// alignment: Alignment.bottomRight,
// child: Text("5G مدل" ,  style: TextStyle(
// color: Colors.black54,
// fontSize: 20,
// ),),
// ),
// ),
// Container(
// height: MediaQuery.of(context).size.height/2.5,
// child: Slider()),
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.black12,
// ),
// padding: EdgeInsets.all(20),
// margin: EdgeInsets.all(30),
// child: Directionality(
// textDirection: TextDirection.rtl  ,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(10), // Image border
// child: SizedBox(
// width: MediaQuery.of(context).size.height/6,
// child: Image.asset("lib/img/companies/samsung-company.png" , fit: BoxFit.cover,)),
//
// ),
// Text("نمایندگی سامسونگ",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// ),
//
// )
// ],
// ),
// ),
// ),
// RadioGroup(),
// Container(
// padding: EdgeInsets.all(15),
// child: Divider(
// color: Colors.black,
// ),
// ),
// Container(
// margin: EdgeInsets.only(top: 40),
// child: Column(
// children: [
// Text("توضیحات کالا" , style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),),
// Container( padding: EdgeInsets.all(20), child: Column(
// children: [
// Text(
// " امتیاز کاربران :  ⭐4.6  "+ "\n",
// style: TextStyle(
// fontWeight: FontWeight.bold
// ),
// ),
// Text(    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد." , style: TextStyle( height: 1.50, ), textAlign: TextAlign.justify, textDirection: TextDirection.rtl,),
// ],
// ))
// ],
// ),
// )





import 'package:flutter/material.dart';
import 'package:namakala/widgets/CartSection.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class Buy extends StatefulWidget {
  @override
  State<Buy> createState() => _BuyState();

  const Buy({Key? key}) : super(key: key);
}

class _BuyState extends State<Buy> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تکمیل خرید" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: const [
                Center(child: Text("برای تکمیل خرید ابتدا باید وارد حساب کاربری خود شوید"))
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height/10,
        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: Container(
                child: Text("تکمیل خرید" , style: TextStyle(color: Colors.white),),
              ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 70 , right: 70 , top : 15 , bottom : 15)),
                      backgroundColor:  MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 1 / 1.25);
    return PageView(
      controller: controller,
      children:  <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider-2.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20 , right: 20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage("lib/img/products/s21-slider-3.jpg"),
                      fit: BoxFit.cover
                  )
              )
          ),
        ),


      ],
    );
  }
}





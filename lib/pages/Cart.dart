import 'package:flutter/material.dart';
import 'package:namakala/widgets/CartSection.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../widgets/RadioGroup.dart';
import '../widgets/SearchContainer.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();

  const CartPage({Key? key}) : super(key: key);
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }
  var icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CartSection(),
                SizedBox(height: 5,),
                CartSection.arg("گوشی  samsung", "lib/img/products/samsung.png", "30,000,000", "4"),
                SizedBox(height: 5,),
                CartSection.arg("گوشی  شیاومی", "lib/img/products/mi.png", "20,000,000", "4.5"),
                SizedBox(height: 5,),
                CartSection.arg("گوشی  samsung", "lib/img/products/samsung2.png", "28,000,000", "4.7"),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("سبد خرید" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),


      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height/10,
        child: Directionality(

          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text(   "30,000,000 تومان".toPersianDigit() , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              ),
              ElevatedButton(onPressed: (){}, child: Container(
                child: Text("ادامه فرایند خرید" , style: TextStyle(color: Colors.white),),
              ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 30 , right: 30)),
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





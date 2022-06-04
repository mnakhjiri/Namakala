import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:namakala/widgets/NavigationBar.dart';
import 'package:namakala/widgets/Search.dart';

import '../widgets/SearchContainer.dart';
import 'CategoryPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Column(
            children: [
              SearchContainer(),
              Expanded(
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [

                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: Image.asset("lib/img/slider1.jpg").image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: Image.asset("lib/img/slider2.jpeg").image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: Image.asset("lib/img/slider3.png").image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: Image.asset("lib/img/slider4.jpg").image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),



                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
                            child: Text("بخش های پرفروش",
                              style: TextStyle(
                                fontFamily: "vazirbold",
                                fontSize: 20,
                              ),
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/(3),
                          child: ListView(
                            padding: EdgeInsets.all(20),
                            scrollDirection: Axis.horizontal,
                            children: [
                              categoryItem("lib/img/mobile.png" , "موبایل"),
                              SizedBox(width: 20,),
                              categoryItem("lib/img/book.png" , "کتاب"),
                              SizedBox(width: 20,),
                              categoryItem("lib/img/sporteq.png" , "لوازم ورزشی"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
  }
}





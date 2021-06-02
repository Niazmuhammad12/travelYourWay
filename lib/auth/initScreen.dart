import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
class initScreen extends StatefulWidget {
  @override
  _initScreenState createState() => _initScreenState();
}

class _initScreenState extends State<initScreen> {
  int _currentPosition=0;
  List imgList = [
    'assets/images/hotelBookingIcon.png',
    'assets/images/traveling.png',
    'assets/images/login_page.png'

  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             CarouselSlider(
              height: MediaQuery.of(context).size.height,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
               viewportFraction: 0.95,
              reverse: false,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentPosition = index;
                  if(index==2){
                    setState(() {
                      navigateToLoginInScreen(context);
                    });
                  }
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(

                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: map<Widget>(imgList, (index, url) {
            //     return Container(
            //       width: 10.0,
            //       height: 10.0,
            //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: _currentPosition == index ? Colors.redAccent : Colors.green,
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

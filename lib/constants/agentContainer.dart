import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

getCard(String imageUrl, String name ,String location){
  return Container(
    height: 220,
    width: 190,
    child: Card(
      elevation: 5.0,

      margin: EdgeInsets.only(top: 6.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
            Image.asset(imageUrl,height: 120.0,width: 120.0,)  ,
          SizedBox(
            height: 15.0,
          ),
          Text(
            name,

          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            location,
      style: TextStyle(
        color: Colors.blue,
      ),
          )
        ],
      ),
    ),
  );
}
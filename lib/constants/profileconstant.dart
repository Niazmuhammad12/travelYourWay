
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myContainer(BuildContext context, String text, int count,color){
  return  Card(
    elevation: 10.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    margin: EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 5.0,),
        Text(
          count.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ],
    ),
  );
}
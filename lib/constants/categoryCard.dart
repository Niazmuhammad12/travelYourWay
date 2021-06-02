
import 'package:flutter/material.dart';

Card getCategoryCard(String iconUrl,String text,String description){

  return Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: EdgeInsets.all(6.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Image.asset(iconUrl,height: 70,width: 80,)),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),
              )),
        ),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(description)),

      ],
    ),
  );

}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/constants/constants.dart';

int showPassword = 0;
var userEmail;
var userID;
var userName;
String passwordIconUrl="assets/images/passwordIcon.png";
OutlineInputBorder textFieldsBorder=new OutlineInputBorder(

  borderSide:BorderSide(color: blueColor,width: 1.0),
  borderRadius:BorderRadius.all(Radius.circular(5.0)),
);
TextStyle labelstyle=TextStyle(
    color: blueColor
);
getUserIdFromShared() async{
  SharedPreferences  preferences = await SharedPreferences.getInstance();
  userID=preferences.getString("id");

}
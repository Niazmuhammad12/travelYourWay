import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/classes/country.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/screens/homeScreen.dart';
import 'package:travel_your_way/screens/phoneVerification.dart';

class PushData{
  var data;
  var user;
  bool msg;
  var ticket_id;
  // String message;
  // dynamic companyData;
  // dynamic followedCompanies;

 apply(var applyMap, BuildContext context) async{
   SharedPreferences  preferences = await SharedPreferences.getInstance();

   applyMap['user_id']=preferences.getString("id").toString();
   print(applyMap);
    try{

      var response=await http.post("http://10.0.2.2:8000/api/visas",body: applyMap);

      if(response.statusCode==200) {
        // print(response.body);
        print("data is fetch successfully from server with response of : "+response.statusCode.toString());
        // var convertDataToJson=jsonDecode(response.body);
        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
        // data=convertDataToJson;
        // return data;

      }

      // else{
      //   print("error no data      "+response.statusCode.toString());
      // }
    } catch(e){
      print("we have the following  error while getting data from server ");
      print(e);
    }
  }

  // registerUser (String name , String email, String password,BuildContext context) async{
  //   var response=await http.post("http://10.0.2.2:8000/api/register",body:{
  //     "name":name,
  //     "email": email,
  //     "password": password
  //   });
  //   Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => LoginScreen()));
  //   var responseDate=jsonDecode(response.body);
  //   msg=responseDate["success"];
  //   if(msg){
  //     user=responseDate["user"];
  //   }
  //
  //
  // }
  addTicket(var applyMap) async{
    SharedPreferences  preferences = await SharedPreferences.getInstance();

    applyMap['user_id']= preferences.getString("id").toString();
    print(applyMap);
    try{

      var response=await http.post("http://10.0.2.2:8000/api/tickets",body: applyMap);


      print(response.body);
      print("data is fetch successfully from server with response of : "+response.statusCode.toString());

      var convertDataToJson=jsonDecode(response.body);

      ticket_id=convertDataToJson['ticket_id'].toString();
      print("ticket id is :"+ticket_id);



    } catch(e){
      print("we have the following  error while getting data from server ");
      print(e);
    }
  }

  addPassenger(var applyMap, context) async{
    // SharedPreferences  preferences = await SharedPreferences.getInstance();

    applyMap['ticket_id']= ticket_id!=null?ticket_id.toString():'1';
    applyMap['nationality']= "pakistan";
    print(applyMap);
    try{

      var response=await http.post("http://10.0.2.2:8000/api/ticket_passenger",body: applyMap);

      // if(response.statusCode==200) {
      print(response.body);
      print("data is fetch successfully from server with response of : "+response.statusCode.toString());
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
      // print(response.body);

      // data=convertDataToJson;
      // return data;

      // }

      // else{
      //   print("error no data      "+response.statusCode.toString());
      // }
    } catch(e){
      print("we have the following  error while getting data from server ");
      print(e);
    }
  }


  // Future likeCompany(String uId,String cId) async{
  //   final String url="http://www.bestofferkktc.com/api/v1/likeCompany";
  //  var response= await http.post(url,body:
  //   { "Uid": uId,
  //     "Cid": cId
  //   }
  //   );
  //   var body=jsonDecode(response.body);
  //  message=body["message"];
  //
  // }
/*  Future getFollowCompany()  async{
    final String url="http://www.bestofferkktc.com/api/v1/getLikes";
    var response= await http.get(url);
    if(response.statusCode==200){
      var convertDataToJson=jsonDecode(response.body);
      followedCompanies=convertDataToJson["likes"];
    }
  }*/
}
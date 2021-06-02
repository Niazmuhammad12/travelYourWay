import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/controllers/login_notifier.dart';
import 'package:travel_your_way/screens/homeScreen.dart';
class LoginAPi{

  static login({String email,String password, BuildContext context}) async{
    var response = await http.post("http://10.0.2.2:8000/api/login", body: {
      "email":email.trim().toString(),
      "password": password.trim().toString()
    });

    var responseDate = jsonDecode(response.body);
/*    msg = responseDate["success"];

    print(loginMessage);*/
    if (!responseDate["success"]) {

       context.read<LoginNotifier>().setLoginMessage(responseDate["message"].toString());


    }
    else{
      context.read<LoginNotifier>().setUserEmail(email.trim());

             addUserToken(context);
    }
  }

  static addUserToken(BuildContext context) async{
    print("we are in the token :  "+ context.read<LoginNotifier>().userEmail.trim());
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    print("in last step:"+context.read<LoginNotifier>().userEmail.trim());
    preferences.setString("email",context.read<LoginNotifier>().userEmail.trim()).then((_) => navigateTO(context, HomeScreen()));
    // navigateTO(context, DashBoard());
    // List<Users> cutomers;


    // cutomers= await FetchData().getAllUsers();
    // for (int i=0;i<cutomers.length;i++)
    // {
    //   Users customer= cutomers[i];
    //   if(customer.email==_emailController.text.trim().toString()){
    //     // print("customer name is : "+customer.name.toString());
    //     setState(() {
    //       preferences.setString("id",customer.id.toString());
    //       preferences.setString("name",customer.name.toString());
    //
    //     });
    //
    //   }
    // }
    print(" token added ");
  }
 static removeUserToken(BuildContext context) async{
    // print("we are in the ftoken :  "+ context.read<LoginNotifier>().userEmail.trim().toString());
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    // print("in last step:"+context.read<LoginNotifier>().userEmail.trim());
    preferences.remove("email").then((_) => navigateTO(context, LoginScreen()));

    print(" token removed ");
  }
}
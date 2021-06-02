import 'dart:async';


import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/authService.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/controllers/login_notifier.dart';
import 'package:travel_your_way/screens/homeScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<DataConnectionStatus> listener;

  bool InternetStatus = false;
  var contentmessage = "Unknown";
  var token=null;
@override
  void initState(){
    // TODO: implement initState
  // checkConnection(context);
  checkUser(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
print("user email is:"+context.read<LoginNotifier>().userEmail.toString());
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png",), fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedSplashScreen(
          splash: Image.asset("assets/images/logo1_blue.png",
            fit: BoxFit.cover,
          ),
         nextScreen: context.read<LoginNotifier>().userEmail==null?LoginScreen():HomeScreen(),

          splashTransition: SplashTransition.fadeTransition,
          duration: 60,
          splashIconSize: MediaQuery.of(context).size.width-60,


        ),
      ),


    );
  }

  void _showDialog(String title,String content ,BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text(title),
              content: new Text(content),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        checkConnection(context);
                      });

                    },
                    child: new Text("Close"))
              ]
          );
        }
    );
  }

  checkConnection(BuildContext context) async{
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status){
        case DataConnectionStatus.connected:
          setState(() {
            InternetStatus=true;
          });
          break;
        case DataConnectionStatus.disconnected:
           setState(() {
             InternetStatus=false;
           });
          contentmessage = "Please check your internet connection and try again";
          _showDialog("you are not connected to the internet",contentmessage,context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }
  // readUserToken() async{
  //   SharedPreferences  preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //
  //     userEmail=preferences.getString("email");
  //     token=preferences.getString("email");
  //   });
  //
  //
  //
  // }
  checkUser(BuildContext  context ) async{
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    print(" we are crossing ");
    String email=preferences.getString("email");
    print("email is :"+email.toString());
    context.read<LoginNotifier>().setUserEmail(email);

  }
}
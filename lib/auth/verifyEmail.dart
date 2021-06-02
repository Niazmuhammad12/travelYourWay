
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/screens/homeScreen.dart';


class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
final auth=FirebaseAuth.instance;
User user;
bool verified=false;
Timer timer;
@override
  void initState() {
  user=auth.currentUser;
  user.sendEmailVerification();
  timer=Timer.periodic(Duration(seconds: 5), (timer) { });
  checkEmailVerified();
  verified==false?progressBar():HomeScreen();
  // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
  timer.cancel();
  // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "The Email Has Been Send To ",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),

            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              user.email,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w500
              ),

            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Verify Email to Continue",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              ),

            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
                onPressed: (){
                  user.sendEmailVerification();
                  checkEmailVerified();

            },
              color: Colors.red,
              child: Text(
                "Resend",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),

            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: (){
                checkEmailVerified();

              },
              color: Colors.red,
              child: Text(
                "Continue If Verified",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),

            )
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async{
  user=auth.currentUser;
  await user.reload();
  timer.cancel();
  if(user.emailVerified){
    setState(() {
      verified=true;
    });
   HomeScreen();
  }
  }

  Widget progressBar(){
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
        strokeWidth: 2.0,

      ),
    );
  }
}

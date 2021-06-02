import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/auth/signupScreen.dart';

import 'package:travel_your_way/screens/homeScreen.dart';
import 'package:travel_your_way/screens/loginWithPhone.dart';
import 'package:travel_your_way/screens/phoneVerification.dart';



void navigateToSignUpScreen(BuildContext context){
  Future.delayed(Duration.zero, () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  });

}

void navigateToLoginInScreen(BuildContext context){
  Future.delayed(Duration.zero, () {
    Navigator.pushNamed(context, "/login");
  });

}
void navigateToLoginWithPhone(BuildContext context) {
  Future.delayed(Duration.zero, () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhone()));
  });
}
void navigateToHome(BuildContext context) {
  Future.delayed(Duration.zero, () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  });
}
void navigatePhoneVerifyScreen(BuildContext context,String phoneNumber, var verificationId) {
  Future.delayed(Duration.zero, () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneVerification(phoneNumber,verificationId)));
  });
}
// void navigateToTripDetails(BuildContext context) {
//   Future.delayed(Duration.zero, () {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => ));
//   });
// }
// void navigateToHome(BuildContext context) {
//   Future.delayed(Duration.zero, () {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//   });
// }'
void navigateTO(BuildContext context,screen) {
  Future.delayed(Duration.zero, () {
    Navigator.push(context,
        PageRouteBuilder(
       transitionDuration: Duration(milliseconds: 350),
          transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child){
         animation =CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
         return ScaleTransition(
           scale: animation,
         alignment: Alignment.center,
           child: child,
         );

          },
          pageBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
         return screen;
          }
    ));
        });
}

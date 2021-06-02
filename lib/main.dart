import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/auth/signupScreen.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:travel_your_way/controllers/login_notifier.dart';
import 'package:travel_your_way/screens/profile.dart';

import 'package:travel_your_way/auth/verifyEmail.dart';
import 'package:travel_your_way/screens/homeScreen.dart';
import 'package:travel_your_way/screens/loginWithPhone.dart';
import 'package:travel_your_way/screens/splashScreen.dart';


import 'auth/initScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
providers: [
  ChangeNotifierProvider(
    create: (_) => ConstantsNotifier(),
  ),
  ChangeNotifierProvider(
    create: (_) => LoginNotifier(),
  ),
],
        child: MaterialApp(
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => SplashScreen(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              '/login': (context) => LoginScreen(),
              '/signup': (context) => SignUpScreen(),
              '/loginWithPhone': (context) => LoginWithPhone(),
              '/home': (context) => HomeScreen(),
              '/profile': (context) => ProfileScreen(),
              '/verifyEmail': (context) => VerifyEmail(),
            },
          debugShowCheckedModeBanner: false,
          ),
      ) ,
      );

}

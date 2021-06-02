
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/auth/signInWithGoogle.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/screens/homeScreen.dart';

class AuthService {
  final _storage = FlutterSecureStorage();

 bool emailSent;
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,snapShot){
     if(SignInWithGoogle().isSignIn){
       progressBar();
     }
      if(snapShot.hasData){
           return HomeScreen();

        }
       return LoginScreen();

      },
    );
  }
  signIn (AuthCredential credential) async{
    await FirebaseAuth.instance.signInWithCredential(credential);

  }
  Widget progressBar(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  signOut() async{
   await FirebaseAuth.instance.signOut();

  }
   resetPassword( String email) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    emailSent=true;

  }
  //
  // addNewId(var key, var value) async{
  //   await _storage.write(key: key, value: value);
  // }
  //
  // dynamic readToken(var key) async{
  //   var token=await _storage.read(key: key);
  //   return token;
  // }
  // deleteToken(var key) {
  //  _storage.deleteAll();
  //
  //
  // }
}
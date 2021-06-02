
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_your_way/classes/routes.dart';

class SignInWithGoogle extends ChangeNotifier{

  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn=GoogleSignIn();
  bool isSignIn;
  SignInWithGoogle(){
    isSignIn=false;
  }
   bool get_isSignIn() {
     return isSignIn;
   }
   set_isSignIn(bool isSignIn){
    this.isSignIn=isSignIn;
   }



  loginByGoogle() async{
    isSignIn=true;
    final GoogleSignInAccount googleUser=await googleSignIn.signIn();
    if(googleUser==null){
      isSignIn=false;
      return;
    }
    else {
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );
      await firebaseAuth.signInWithCredential(credential);
      isSignIn=false;
    }
  }

void logOut( BuildContext context) async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    navigateToLoginInScreen(context);
}
}
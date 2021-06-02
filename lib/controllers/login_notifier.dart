
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier{

 String _loginMessage=null;
bool _showPassword=true;
 String _userEmail="";
IconData _passwordIcon=(Icons.visibility);

 IconData get passwordIcon => _passwordIcon;


  void changePasswordVisibility(){
   _showPassword=!_showPassword;
   _passwordIcon=_showPassword==true?_passwordIcon=(Icons.visibility):_passwordIcon=(Icons.visibility_off);
    notifyListeners();
 }
 String get loginMessage => _loginMessage;

setLoginMessage(String msg){
 _loginMessage=msg;
 notifyListeners();
}

 bool get showPassword => _showPassword;


 String get userEmail => _userEmail;

   void setUserEmail(String value) async{
    // SharedPreferences  preferences = await SharedPreferences.getInstance();
    // _userEmail=preferences.getString("email");
    _userEmail=value;
    notifyListeners();
  }
}

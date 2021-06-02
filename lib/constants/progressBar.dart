

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;
 showProgress(BuildContext context){
   pr = new ProgressDialog(context);
   pr.style(
       message: 'Please Wait..',
       borderRadius: 10.0,
       backgroundColor: Colors.white,
       progressWidget: CircularProgressIndicator(),
       elevation: 10.0,
       insetAnimCurve: Curves.easeInOut,
       progress: 0.0,
       maxProgress: 100.0,
       progressTextStyle: TextStyle(
           color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
       messageTextStyle: TextStyle(
           color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
   );

 }
 void hideProgress(){
   pr.hide();
 }


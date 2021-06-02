
// import 'package:firebase_auth/firebase_auth.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:travel_your_way/auth/authService.dart';
import 'package:travel_your_way/constants/progressBar.dart';

import 'homeScreen.dart';

/* ignore: must_be_immutable*/
class PhoneVerification extends StatefulWidget {
 var phoneNumber;


 final verificationId;

  PhoneVerification(this.phoneNumber,this.verificationId);
  @override _PhoneVerificationState createState() => _PhoneVerificationState();}

  class _PhoneVerificationState extends State<PhoneVerification> {
  // String verificationCode=LoginWithPhone().verificationId;
    bool showMsg=false;
    var smsCode;
    @override
  void initState() {
    // TODO: implement initState
      pr.hide();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final verificationId=widget.verificationId;

   String msg="";
   return
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png") ,fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,

        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Verification",
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                  "Enter verification code we sent to "+widget.phoneNumber.substring(0,4)+"...."+widget.phoneNumber.substring(9)
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                  "6 digit code"
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: PinCodeTextField(
                  textInputType: TextInputType.number,
                  pinTheme: PinTheme(
                   shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.black38,
                      inactiveColor: Colors.white,
                      activeColor: Colors.white,
                      disabledColor: Colors.white
                  ),
                  length: 6,
                  onChanged: (v){


                  },
                  onCompleted: (v){
                setState(() {
                  smsCode=v;
                });
                  },
                  animationType: AnimationType.fade,
                  backgroundColor: Colors.white,
                  obsecureText: false,

                  animationDuration: Duration(milliseconds: 200),
                  textStyle: TextStyle(fontSize: 20, height: 1.6),

                  enableActiveFill: true,


                ),
              ),
              Padding(padding: EdgeInsets.all(20.0),
              child: FlatButton(
                onPressed: (){

                  if(smsCode==null || smsCode.toString().length<5){
                    setState(() {
                      msg="code not match";
                      showMsg=true;
                    });
                  }
                  print(" verification id:"+verificationId+" sms code:"+smsCode);
                  AuthCredential credential=PhoneAuthProvider.credential(verificationId:
                  verificationId, smsCode:smsCode);


                    AuthService().signIn(credential);

                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()
                    ));
                    // return HomeScreen();


                },
                color: Colors.red,
                child: Text(
                  "Verify",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child:
                Text(
                 showMsg?msg:"",
                  style: TextStyle(
                    color: Colors.red,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

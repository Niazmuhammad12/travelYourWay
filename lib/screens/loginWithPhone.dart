
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/auth/authService.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/progressBar.dart';
import 'package:travel_your_way/screens/phoneVerification.dart';

import 'homeScreen.dart';


class LoginWithPhone extends StatefulWidget {

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> with TickerProviderStateMixin{
  AnimationController controller;
  TextEditingController phoneController=new TextEditingController();
  Animation animation;
  String  verificationId;
  var phoneNo;
  // ProgressDialog pr;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool codeSent=true;
  bool isNoValid=true;

  Future verifyPhone(phoneNumber) async{

    final PhoneVerificationCompleted verified=(AuthCredential result){
      AuthService().signIn(result);
      pr.hide();
      return HomeScreen();

    };
    final PhoneVerificationFailed verificationFailed=(FirebaseAuthException authException){
       print('${authException.message}');
       showSnackbar("verification failed please try again");
       setState(() {
         codeSent=false;
       });
    };
    final PhoneCodeSent smsCode=(String verId,[int forceResend]){
    setState(() {
     this.verificationId=verId;
      this.codeSent=true;
    });
  pr.hide();
    navigatePhoneVerifyScreen(context,phoneNumber,verId);
   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PhoneVerification(phoneNumber,verId)));

    };
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout=(var verId){

      this.verificationId=verId;

    };


    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsCode,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
      timeout: const Duration(seconds: 50),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    showProgress(context);
    controller= AnimationController(
      duration: Duration(seconds: 1),
      vsync:this,);
    animation=CurvedAnimation(parent:controller,curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // pr = new ProgressDialog(context);
    // pr.style(
    //     message: 'Please Wait..',
    //     borderRadius: 10.0,
    //     backgroundColor: Colors.white,
    //     progressWidget: CircularProgressIndicator(),
    //     elevation: 10.0,
    //     insetAnimCurve: Curves.easeInOut,
    //     progress: 0.0,
    //     maxProgress: 100.0,
    //     progressTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //     messageTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(

        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(

            image: AssetImage("assets/images/bg.png") ,fit: BoxFit.cover,
          )
        ),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
          ),
          body: Container(

            child:
                ListView(
                  padding: EdgeInsets.all(5),
    children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 35.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        child: Image.asset("assets/images/closeIcon.png",height:animation.value*40,),
                    onTap:() {
                          Navigator.pop(context);
                    },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 30.0
                      ),
                      child: Image.asset("assets/images/logo.png",height:animation.value*140,),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left: 10.0) ,
                        child: Text(
                            "Enter Phone Number"
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: 10.0) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 55.0,
                              height: 55.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black38),

                              ),
                              child: Text(
                                  "+90"
                              ),
                            ),
                            Expanded(

                              child: Container(
                                height: 74.0,
                                child: TextField(
                                  controller: phoneController,
                                  maxLength: 11,
                                  decoration: InputDecoration(
                                    errorText: this.isNoValid?"":"The Entered Phone Number Not Correct",
                                    errorStyle: TextStyle(
                                      color: this.isNoValid?null:Colors.red,
                                    ),
                                    border: OutlineInputBorder(

                                      borderSide: BorderSide(color: Colors.black38),

                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38),

                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value){
                                    setState(() {
                                      this.phoneNo=value;
                                    });

                                  },
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 55.0),
                            onPressed: (){
                              verifyPhone("+92"+phoneNo);

                              pr.show();
                            },
                            color: Colors.redAccent,
                            child: Text("Get Code",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),),
                          ),
                        ),
                      )
                    ],
                  )



                  // Padding(
                  //   padding:EdgeInsets.only(left: 10.0) ,
                  //   child: Text(
                  //     "Enter Phone Number"
                  //   ),
                  // ),
                  // Padding(
                  //   padding:EdgeInsets.only(top: 10.0) ,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //        Container(
                  //          width: 55.0,
                  //          height: 55.0,
                  //          alignment: Alignment.center,
                  //          decoration: BoxDecoration(
                  //            border: Border.all(color: Colors.black38),
                  //
                  //          ),
                  //          child: Text(
                  //            "+90"
                  //          ),
                  //        ),
                  //       Expanded(
                  //
                  //         child: Container(
                  //           height: 74.0,
                  //           child: TextField(
                  //            controller: phoneController,
                  //             maxLength: 11,
                  //             decoration: InputDecoration(
                  //               errorText: this.isNoValid?"":"The Entered Phone Number Not Correct",
                  //               errorStyle: TextStyle(
                  //                 color: this.isNoValid?null:Colors.red,
                  //               ),
                  //               border: OutlineInputBorder(
                  //
                  //                 borderSide: BorderSide(color: Colors.black38),
                  //
                  //               ),
                  //               enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(color: Colors.black38),
                  //
                  //               ),
                  //             ),
                  //             keyboardType: TextInputType.number,
                  //             onChanged: (value){
                  //              setState(() {
                  //                this.phoneNo=value;
                  //              });
                  //
                  //
                  //              // else if(_isNumeric(value)==false){
                  //              //   phoneController.value=null;
                  //              //
                  //              //
                  //              //
                  //              // }
                  //
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //
                  //
                  //     ],
                  //   ),
                  // ),

                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(top: 20.0),
                  //     child: MaterialButton(
                  //       padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 55.0),
                  //       onPressed: (){
                  //
                  //         codeSent==false?verifyPhone("+92"+phoneNo):
                  //
                  //        navigateToPhoneVerification(
                  //             context, "+92" + phoneNo);
                  //
                  //         // codeSent==false?CircularProgressIndicator(
                  //         //   strokeWidth: 3.0,
                  //         //   valueColor: AlwaysStoppedAnimation<Color>
                  //         //     (Colors.redAccent),
                  //         //   value:codeSent==false?double.infinity:0,
                  //         // ):null;
                  //         // if(phoneNo.toString().length<11){
                  //         //   setState(() {
                  //         //     this.isNoValid=false;
                  //         //   });
                  //         // }
                  //    //      if(codeSent==true) {
                  //    // print("navigating to second screen");
                  //    //        navigateToPhoneVerification(
                  //    //            context, "+92" + phoneNo, verificationId);
                  //    //      }
                  //    //
                  //    //      else{
                  //    //        this.isNoValid=false;
                  //    //        // navigateToPhoneVerification(
                  //    //        //     context, "+91" + phoneNo, verificationId,this.authResult);
                  //    //      }
                  //
                  //
                  //       },
                  //       color: Colors.redAccent,
                  //       child: Text(codeSent?"Verify":"Get Code",style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0
                  //       ),),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
         ] ),
        ),

    ),
      ));
  }
  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }
  void showSnackbar(String message) {
    ScaffoldMessenger(key:_scaffoldKey,child: SnackBar(content: Text(message)));
  }
}

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/auth/verifyEmail.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/constants.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:http/http.dart' as http;
import 'package:travel_your_way/auth/loginScreen.dart';
ScrollController scrollController=new ScrollController();
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin{
  FirebaseAuth _auth=FirebaseAuth.instance;
  var signUpMsg;
  bool msg;
  var user;
  AnimationController controller;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
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
    return Container(
      height: MediaQuery.of(context).size.height,

      child: Scaffold(
       // backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: blueColor,
          title: Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Text("Create Account")),
        ),
        body: Container(
          // margin: EdgeInsets.only(top: 30.0),
          // padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              // Container(
              //     height:animation.value*100,
              //     child: Image.asset("assets/images/logo.png",alignment: Alignment.center)),

              // SizedBox(height: 30.0,),
              Expanded(
                child: Form(
      key: _formKey,
                  child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 25.0),
                    children:  [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Image.asset("assets/images/logo1_blue.png",height: animation.value*130,),
                            // Text(
                            //   "Login",
                            //   style: TextStyle(
                            //     color: Colors.blue,
                            //     fontSize: 22.0,
                            //   ),
                            // ),


                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child:
                            Text(
                              signUpMsg!=null?signUpMsg.toString():"",
                              style: TextStyle(
                                color: Colors.red,

                              ),
                            ),

                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: TextFormField(
                              controller:_nameController,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  focusedBorder: textFieldsBorder,
                                  disabledBorder: textFieldsBorder,

                                  contentPadding: EdgeInsets.all(4.0),
                                  border: textFieldsBorder,
                                  labelText: 'full name',
                                  // hintText: "Email"
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'name required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: TextFormField(
                              controller: _emailController,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  focusedBorder: textFieldsBorder,
                                  disabledBorder: textFieldsBorder,

                                  contentPadding: EdgeInsets.all(4.0),
                                  border: textFieldsBorder,
                                  labelText: 'Email',
                                  hintText: "Email"),
                              validator: (String value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'valid email required';
                                }
                                return null;
                              },
                            ),

                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: showPassword == 0 ? true : false,
                              onTap: () {
                                setState(() {
                                  // listViewController.jumpTo(120.0);
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  child: Image.asset(passwordIconUrl,width: 20,height: 20,),
                                  onTap: () {
                                    setState(() {

                                      showPassword == 1
                                          ? showPassword = 0
                                          : showPassword = 1;
                                      passwordIconUrl.endsWith("assets/images/passwordIcon.png")?
                                      passwordIconUrl="assets/images/passwordIcon2.png":
                                      passwordIconUrl="assets/images/passwordIcon.png";
                                    });
                                  },
                                ),
                                focusedBorder: textFieldsBorder,
                                disabledBorder: textFieldsBorder,
                                contentPadding: EdgeInsets.all(4.0),
                                border: textFieldsBorder,
                                labelText: 'password',
                                // hintText: "Password",

                              ),
                              validator: (String value) {
                                if (value.length<6) {
                                  return 'the password must be at least 6 char';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                            child: TextFormField(
                              controller: _conformPasswordController,

                              obscureText: showPassword == 0 ? true : false,
                              onTap: () {
                                setState(() {
                                  // listViewController.jumpTo(120.0);
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  child: Image.asset(passwordIconUrl,width: 20,height: 20,),
                                  onTap: () {
                                    setState(() {
                                      showPassword == 1
                                          ? showPassword = 0
                                          : showPassword = 1;
                                      passwordIconUrl.endsWith("assets/images/passwordIcon.png")?
                                      passwordIconUrl="assets/images/passwordIcon2.png":
                                      passwordIconUrl="assets/images/passwordIcon.png";
                                    });
                                  },
                                ),
                                focusedBorder: textFieldsBorder,
                                disabledBorder: textFieldsBorder,
                                contentPadding: EdgeInsets.all(4.0),
                                border: textFieldsBorder,
                                labelText: 'conform password',
                                // hintText: "conform password",

                              ),
                              validator: (String value) {
                                if (value.length<6 || _passwordController.text!=_conformPasswordController.text) {
                                  return 'password not match';
                                }
                                return null;
                              },

                            ),
                          ),



                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                            child: Material(
                              elevation: 6.0,
                              color: blueColor,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              child: Container(
                                height: 30.0,
                                width: 90.0,
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                   if(_formKey.currentState.validate()){
                                     registerUser();
                                   }

                                    });
                                  },

                                  child: Text("SignUp",style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(

                                  child: Text(
                                      "already have account?",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: blueColor,
                                      )
                                  ),
                                  onTap: (){
                                    setState(() {
                                      navigateToLoginInScreen(context);
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _conformPasswordController.dispose();
  //   super.dispose();
  // }
  // void _register() async {
  //   try{
  //     final  user = (await
  //     _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     )
  //     ).user;
  //     if (user != null) {
  //       setState(() {
  //         _success = true;
  //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyEmail()));
  //         _userEmail = user.email;
  //       });
  //     } else {
  //       setState(() {
  //         _success = false;
  //         navigateToSignUpScreen(context);
  //       });
  //     }
  //   } on FirebaseAuthException catch (e){
  //     if (e.code == 'weak-password') {
  //       showSnackbar("password is too weak");
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       showSnackbar("email already in use try sing in");
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e){
  //     print(e);
  //   }
  //
  //
  // }
  void showSnackbar(String message) {
    ScaffoldMessenger(key:_scaffoldKey,child: SnackBar(content: Text(message)));
  }

  registerUser () async{
    var response=await http.post("http://10.0.2.2:8000/api/register",body:{
      "name":_nameController.text.trim().toString(),
      "email": _emailController.text.trim().toString(),
      "password":  _conformPasswordController.text.trim().toString()
    });

    var responseDate=jsonDecode(response.body);
    var responseMsg=responseDate["message"];
    msg=responseDate["success"];
    if(msg){
      setState(() {
        user=responseDate["user"];
           // navigateToLoginInScreen(context);
      });
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => LoginScreen()));

    }
    else
      {
        setState(() {
          signUpMsg=responseMsg["email"];
          print("we are in");
          print(signUpMsg.toString());
        });
      }


  }

}

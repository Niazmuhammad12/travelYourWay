import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/authService.dart';
import 'package:travel_your_way/auth/initScreen.dart';
import 'package:travel_your_way/auth/signInWithGoogle.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/auth/signupScreen.dart';
import 'package:travel_your_way/classes/fetchData.dart';
import 'file:///E:/study/AndroidStudioProjects/travel_your_way/lib/auth/login_api.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:http/http.dart' as http;
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/classes/users.dart';
import 'package:travel_your_way/constants/constants.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:travel_your_way/controllers/login_notifier.dart';
import 'package:travel_your_way/screens/homeScreen.dart';
import 'package:travel_your_way/screens/loginWithPhone.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int showPassword = 0;
  String loginMessage = "";
  String _userEmail;
  bool _success = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _debugLocked = false;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {
        loginMessage = "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      height: height,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //       colorFilter: ColorFilter.mode(
      //           Colors.black.withOpacity(0.5), BlendMode.darken),
      //       image: AssetImage("assets/images/loginBackground.png"),
      //       fit: BoxFit.cover,
      //     )),
      child: SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.transparent,
           appBar: AppBar(
             backgroundColor: blueColor,
             leading: IconButton(
               icon: Icon(Icons.arrow_back,color: Colors.white,),
               onPressed: (){
                   _backPressed();
               },

             ),

             title: Center(child: Text("Login")),
           ),
            body: Container(
              // margin: EdgeInsets.only(top: 30.0),
              // padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    Expanded(

                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 25.0),
                          children: [
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 8.0),
                                  child: Text(
                                    context.watch<LoginNotifier>().loginMessage!=null?
                                    context.watch<LoginNotifier>().loginMessage.toString():" "
                                    ,
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 8.0),
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
                                        labelStyle: TextStyle(
                                          color: blueColor,
                                        ),
                                        hintText: "Email"),
                                    validator: (String value) {
                                      if (value.isEmpty ||
                                          !value.contains('@')) {
                                        return 'email incorrect';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 8.0),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: context.watch<LoginNotifier>().showPassword
                                        ? true
                                        : false,
                                    onTap: () {
                                        setState(() {
                                        // listViewController.jumpTo(120.0);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(

                                        child: Icon(context.watch<LoginNotifier>().passwordIcon,color: blueColor,),
                                        onTap: () {
                                      context.read<LoginNotifier>().changePasswordVisibility();
                                        },
                                      ),
                                      focusedBorder: textFieldsBorder,
                                      disabledBorder: textFieldsBorder,
                                      contentPadding: EdgeInsets.all(4.0),
                                      border: textFieldsBorder,
                                      labelText: 'password',
                                      hintText: "Password",

                                    ),
                                    validator: (String value) {
                                      if (value.length < 6) {
                                        return 'incorrect password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                          "don't have account?"
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // navigateToSignUpScreen(context);
                                          Navigator.pushNamed(
                                              context, '/signup');
                                        },
                                        child: Text(
                                          "Create Account",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: blueColor,
                                          ),
                                        ),
                                      )
                                    ],

                                  ),


                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 12.0),
                                  child: Material(
                                    elevation: 6.0,
                                    color: blueColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: Container(
                                      height: 30.0,
                                      width: 90.0,
                                      child: FlatButton(

                                        onPressed: () {
                                          setState(() {

                                            if(_formKey.currentState.validate()){
                                             LoginAPi.login(email: _emailController.text.toString(),
                                             password: _passwordController.text.toString(),
                                               context: context
                                             );
                                            }
                                            // navigateToHome(context);
                                          });
                                        },
                                        child: Text("LOGIN", style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(

                                  margin: EdgeInsets.only(top: 15.0),
                                  width: height >= 340 ? MediaQuery
                                      .of(context)
                                      .size
                                      .width - 140 : MediaQuery
                                      .of(context)
                                      .size
                                      .width - 60,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          GestureDetector(

                                            child: Text(
                                              "Login With Phone",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: blueColor,
                                              ),
                                            ),
                                            onTap: () {
                                              navigateToLoginWithPhone(context);
                                            },

                                          ),
                                          SizedBox(
                                            height: 14.0,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              SignInWithGoogle()
                                                  .loginByGoogle();
                                              navigateToHome(context);
                                            },
                                            child: Text(
                                              "login With Google",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: blueColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 14.0,
                                          ),

                                        ],
                                      ),
                                      height >= 325
                                          ? SizedBox(width: 20.0,)
                                          : SizedBox(width: 4.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .end,
                                        children: [
                                          Image.asset(
                                            "assets/images/phone.png",
                                            fit: BoxFit.cover,
                                            width: 18.0,
                                            height: 20.0,
                                            // alignment: Alignment.centerRight,
                                          ),
                                          SizedBox(
                                            height: 14.0,
                                          ),
                                          Image.asset(
                                            "assets/images/googleicon.png",
                                            fit: BoxFit.cover,
                                            width: 18.0,
                                            height: 20.0,
                                            // alignment: Alignment.centerRight,
                                          ),
                                          SizedBox(
                                            height: 14.0,
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: blueColor,
                                            fontWeight:  FontWeight.w600
                                          )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  // void _signInWithEmailAndPassword() async {
  //   final user = (await _auth.signInWithEmailAndPassword(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   )).user;
  //
  //   if (user != null) {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => HomeScreen()));
  //     setState(() {
  //       _success = true;
  //       _userEmail = user.email;
  //     });
  //   } else {
  //     setState(() {
  //       _success = false;
  //     });
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // login() async {
  //   bool msg;
  //   var response = await http.post("http://10.0.2.2:8000/api/login", body: {
  //     "email": _emailController.text.trim().toString(),
  //     "password": _passwordController.text.trim().toString()
  //   });
  //
  //   var responseDate = jsonDecode(response.body);
  //   msg = responseDate["success"];
  //
  //   print(loginMessage);
  //   if (!msg) {
  //    setState(() {
  //      loginMessage=responseDate["message"];
  //    });
  //   }
  //   else{
  //
  //     setState(()  {
  //       userEmail=_emailController.text.trim().toString();
  //
  //     });
  //     addUserToken();
  //     navigateToHome(context);
  //   }
  //
  // }
  //
  // addUserToken() async{
  //   List<Users> cutomers;
  //   SharedPreferences  preferences = await SharedPreferences.getInstance();
  //   preferences.setString("email",_emailController.text.trim().toString() );
  //   cutomers= await FetchData().getAllUsers();
  //   for (int i=0;i<cutomers.length;i++)
  //   {
  //     Users customer= cutomers[i];
  //     if(customer.email==_emailController.text.trim().toString()){
  //       // print("customer name is : "+customer.name.toString());
  //       setState(() {
  //         preferences.setString("id",customer.id.toString());
  //         preferences.setString("name",customer.name.toString());
  //
  //       });
  //
  //     }
  //   }
  //   print(" token added ");
  // }
  Future<bool> _backPressed(){
    return showDialog(context: context,

        builder: (context)=>AlertDialog(
          title: Text("Are you sure to exit the App"),
          actions: [
            FlatButton(onPressed: (){
              Navigator.pop(context,false);

            }, child: Text("No")),
            FlatButton(onPressed: (){
            SystemNavigator.pop();
            }, child: Text("yes"))
          ],
        ));
  }

}

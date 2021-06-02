
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/routes.dart';

import 'package:travel_your_way/constants/bottomnavigationbar.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/constants/constants.dart';
import 'package:travel_your_way/constants/profileconstant.dart';
import 'package:travel_your_way/constants/showDrawerAnimationBuilder.dart';
import 'package:travel_your_way/constants/swipe_controller.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:travel_your_way/screens/drawerscreen.dart';
import 'package:travel_your_way/screens/homeScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double value=0;
  List<String> names = [
    "Pending",
    "Submitted",
    "Completed",
    "Requests",

  ];
  List<Color> colors = [
   Colors.blueAccent,
   Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.lightGreen

  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
     decoration:topContainerDecoration,
      child: Stack(
        children: [
          DrawerScreen(),
          DrawerAnimationBuilder(
              child: WillPopScope(
                onWillPop:_backPressed ,
                child: Scaffold(
                    appBar: myAppBar(context, HomeScreen(), 0),
                    body: Container(
                      child : SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.withOpacity(.3)),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/profile.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                    "Cute Babe",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0
                                ),
                                ),
                              ),
                              SizedBox(height: 12.0,),
                              Expanded(
                                child: GridView.builder(
                                  itemCount: names.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0
                                  ),
                                  itemBuilder: (BuildContext context, int index){
                                    return InkWell(
                                      onTap: (){
                                        setState(() {
                                          switch(index){
                                            case 0:
                                              {
                                                // navigateTO(context, AgentsScreen("immigration"),);
                                                break;
                                              }
                                            case 1:
                                              {
                                                // navigateTO(context, AgentsScreen("visit"));
                                                break;
                                              }
                                            case 2:
                                              {
                                                // navigateTO(context, AgentsScreen("hajj"));
                                                break;
                                              }
                                            case 3:
                                              {
                                                // navigateTO(context, AgentsScreen("umrah"));
                                                break;
                                              }
                                            case 4:
                                              {
                                                // navigateTO(context, AgentsScreen("flight"));
                                                break;
                                              }
                                            case 5:
                                              {
                                                // navigateTO(context, ApplyForUmrah());
                                                break;
                                              }


                                          }
                                        });
                                      },
                                    child: myContainer(context ,  names[index], index+2,colors[index]),
                                    );

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    bottomNavigationBar: bottomNavigationBar(context),
                  ),
              ),
              ),
      SwipeController(),
        ],
      ),
    );


    // return Container(
    //   width: double.infinity,
    //   height: MediaQuery.of(context).size.height,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Profile'),
    //       centerTitle: true,
    //       actions: [
    //         Center(
    //           child: Padding(
    //             padding: EdgeInsets.only(right: 10),
    //             child: IconButton(
    //               icon: Icon(Icons.settings),
    //               onPressed: (){
    //                 myDrawer("name", "", context);
    //                 // to do on setting icon
    //               }
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     body: Container(
    //       child : SingleChildScrollView(
    //         child: Container(
    //           height: MediaQuery.of(context).size.height,
    //           margin: EdgeInsets.all(10.0),
    //           child: Column(
    //             children: [
    //               Container(
    //                 height: 150,
    //                 width: 150,
    //                 padding: EdgeInsets.all(10),
    //                 margin: EdgeInsets.all(10),
    //                 decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: Colors.blue.withOpacity(.3)),
    //                 child: ClipOval(
    //                   child: Image.asset(
    //                     "assets/images/profile.jpg",
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 8.0,),
    //               Align(
    //                 alignment: Alignment.center,
    //                 child: Text(
    //                     "Cute Babe",
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 20.0
    //                 ),
    //                 ),
    //               ),
    //               SizedBox(height: 12.0,),
    //               Expanded(
    //                 child: GridView.builder(
    //                   itemCount: names.length,
    //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 2,
    //                       crossAxisSpacing: 8.0,
    //                       mainAxisSpacing: 8.0
    //                   ),
    //                   itemBuilder: (BuildContext context, int index){
    //                     return InkWell(
    //                       onTap: (){
    //                         setState(() {
    //                           switch(index){
    //                             case 0:
    //                               {
    //                                 // navigateTO(context, AgentsScreen("immigration"),);
    //                                 break;
    //                               }
    //                             case 1:
    //                               {
    //                                 // navigateTO(context, AgentsScreen("visit"));
    //                                 break;
    //                               }
    //                             case 2:
    //                               {
    //                                 // navigateTO(context, AgentsScreen("hajj"));
    //                                 break;
    //                               }
    //                             case 3:
    //                               {
    //                                 // navigateTO(context, AgentsScreen("umrah"));
    //                                 break;
    //                               }
    //                             case 4:
    //                               {
    //                                 // navigateTO(context, AgentsScreen("flight"));
    //                                 break;
    //                               }
    //                             case 5:
    //                               {
    //                                 // navigateTO(context, ApplyForUmrah());
    //                                 break;
    //                               }
    //
    //
    //                           }
    //                         });
    //                       },
    //                     child: myContainer(context ,  names[index], index+2,colors[index]),
    //                     );
    //
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     bottomNavigationBar: bottomNavigationBar(context),
    //   ),
    // );
  }
  Future<bool> _backPressed(){
    context.read<ConstantsNotifier>().updateIndex(0);
    navigateTO(context, HomeScreen());
    // return showDialog(context: context,
    //
    //     builder: (context)=>AlertDialog(
    //       title: Text("Are you sure to exit the App"),
    //       actions: [
    //         FlatButton(onPressed: (){
    //           Navigator.pop(context,false);
    //
    //         }, child: Text("No")),
    //         FlatButton(onPressed: (){
    //           Navigator.pushReplacement<void, void>(
    //             context,
    //             MaterialPageRoute<void>(
    //               builder: (BuildContext context) =>  LoginScreen(),
    //             ),
    //           );
    //         }, child: Text("yes"))
    //       ],
    //     ));
  }
}


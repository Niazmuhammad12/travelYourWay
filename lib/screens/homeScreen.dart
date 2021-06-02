import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_your_way/auth/authService.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/classes/fetchData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/classes/users.dart';
import 'package:travel_your_way/constants/bottomnavigationbar.dart';
import 'package:travel_your_way/constants/categoryCard.dart';
import 'package:travel_your_way/constants/constants.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/constants/showDrawerAnimationBuilder.dart';
import 'package:travel_your_way/constants/swipe_controller.dart';
import 'package:travel_your_way/screens/agentsScreen.dart';
import 'package:travel_your_way/screens/drawerscreen.dart';
List<String> images = [
  "assets/images/visa.png",
  "assets/images/visa.png",
  "assets/images/hajj.png",
  "assets/images/makka.png",
  "assets/images/flight.png",
  "assets/images/hotel.png",

];
List<String> names = [
  "Immigration",
  "Visit",
  "Hajj",
  "Umrah",
  "Flight",
  "Hotel",

];
List<String> namesDescription = [
  "apply for immigration visa",
  "apply for visit visa",
  "apply for hajj visa",
  "apply for umrah visa",
  "book air ticket",
  "book hotel",

];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // FirebaseAuth auth=FirebaseAuth.instance;

@override
  Future<void> initState()  {
    // TODO: implement initState
  getCustomerId();
    super.initState();

    // AuthService().readToken("token")==null?AuthService().addNewId("token", userID):null;

  }
  @override
  Widget build(BuildContext context) {
    // userImage=auth.currentUser.email!=null?auth.currentUser.photoURL:null;
    // userName=auth.currentUser.email!=null?auth.currentUser.displayName:null;
    // userEmail=auth.currentUser.email!=null?auth.currentUser.email:null;
    double topContainerHeight=MediaQuery.of(context).size.height*.20;

    return Container(
 decoration: topContainerDecoration,


      child: Stack(
        children: [
          DrawerScreen(),
          DrawerAnimationBuilder(
            child: WillPopScope(
              onWillPop: _backPressed,
              child: Scaffold(
                appBar: myAppBar(context, null, 4),
                body: Stack(
                  children: [
                   topContainer(context),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:topContainerHeight/1.9,left: 10,right: 10 ),
                        // padding: EdgeInsets.all(6.0),
                        child:


                        GridView.builder(
                          itemCount: images.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0
                          ),
                          itemBuilder: (BuildContext context, int index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  switch(index){
                                    case 0:
                                      {
                                        navigateTO(context, AgentsScreen("immigration"),);
                                        break;
                                      }
                                    case 1:
                                      {
                                        navigateTO(context, AgentsScreen("visit"));
                                        break;
                                      }
                                    case 2:
                                      {
                                        navigateTO(context, AgentsScreen("hajj"));
                                        break;
                                      }
                                    case 3:
                                      {
                                        navigateTO(context, AgentsScreen("umrah"));
                                        break;
                                      }
                                    case 4:
                                      {
                                        navigateTO(context, AgentsScreen("flight"));
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
                              child: getCategoryCard(images[index],names[index],namesDescription[index]),);

                          },
                        )),
                  ],
                ),

                // bottomNavigationBar:MyBottomNavigationBar(),
                bottomNavigationBar:  bottomNavigationBar(context),
              ),
            ),
          ),
          SwipeController(),
        ],
      ),
    );
  }

  getCustomerId() async{
    List<Users> customers;
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    setState(() {
      userName=preferences.getString('name');
      userEmail=preferences.getString("email");
    });
    // customers= await FetchData().getAllUsers();
    //   for (int i=0;i<customers.length;i++)
    //     {
    //       Users customer= customers[i];
    //       if(customer.email==userEmail){
    //         // print("customer name is : "+customer.name.toString());
    //           setState(() {
    //             userID=customer.id;
    //             userName=customer.name;
    //           });
    //
    //       }
        }

    // print("user id is"+ userID!=null?userID:" no id");


Future<bool> _backPressed(){
  return showDialog(context: context,

      builder: (context)=>AlertDialog(
        title: Text("Are you sure to exit the App"),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(context,false);

          }, child: Text("No")),
          FlatButton(onPressed: (){
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  LoginScreen(),
              ),
            );
          }, child: Text("yes"))
        ],
      ));
}
  }
  // addUserIdToSharedPre( String id) async{
  //   SharedPreferences  preferences = await SharedPreferences.getInstance();
  //   preferences.setString("id", id);
  // }



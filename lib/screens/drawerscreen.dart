import 'package:flutter/material.dart';
import 'package:travel_your_way/auth/loginScreen.dart';
import 'package:travel_your_way/auth/login_api.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/screens/homeScreen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Material(
          color: Colors.transparent,
          child: Container(

            width: MediaQuery.of(context).size.width/2,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 70.0),
            child: Column(
              children: [
                Expanded(child: ListView(
                  children: [
                    ListTile(
                      onTap: (){
                        context.read<ConstantsNotifier>().updateIndex(0);
                        context.read<ConstantsNotifier>().updateShowDrawer(0);

                        navigateTO(context, HomeScreen());
                      },
                      leading: Icon(Icons.home,size: 25.0,color: Colors.white,),
                      title: Text("Home",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white                        ),),
                    ),
                    ListTile(
                      onTap: (){

                      },
                      leading: Icon(Icons.settings,size: 25.0,color: Colors.white,),
                      title: Text("Setting", style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white                        ),),
                    ),
                    ListTile(
                      onTap: (){
                        context.read<ConstantsNotifier>().updateShowDrawer(0);
                        context.read<ConstantsNotifier>().updateIndex(0);
                        LoginAPi.removeUserToken(context);
                      },
                      leading: Icon(Icons.logout,size: 25.0,color: Colors.white,),
                      title: Text("Logout" , style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white                        ),),
                    ),
                    ListTile(
                      onTap: (){
                       context.read<ConstantsNotifier>().updateShowDrawer(0);
                      },
                      leading: Icon(Icons.arrow_right,size: 25.0,color: Colors.white,),
                      title: Text("Close" , style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white                        ),),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));

  }
}

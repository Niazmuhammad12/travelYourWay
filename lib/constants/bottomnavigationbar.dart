
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:travel_your_way/screens/homeScreen.dart';
import 'package:travel_your_way/screens/profile.dart';
 GlobalKey bottomNavigationKey=GlobalKey();

bottomNavigationBar(BuildContext  context ){
  int currentIndex=  context.watch<ConstantsNotifier>().index;
  return CurvedNavigationBar(
    // key: bottomNavigationKey,
      index: currentIndex,
      items:[
        Icon(Icons.home, size: 30,),
        // Icon(Icons.category,size: 30),
        Icon(Icons.account_circle_rounded , size: 30),

      ],
    onTap: (index){
      // final CurvedNavigationBarState navigationBarState =_bottomNavigationKey.currentState;
        switch(index){

          case 0:
            {
               // navigationBarState.setPage(1);
              if(currentIndex!=0) {
                context.read<ConstantsNotifier>().updateIndex(0);
                navigateTO(context, HomeScreen());
              }


              break;
            }
          // case 1:
          //   {
          //     // navigationBarState.setPage(2);
          //   navigateTO(context, HomeScreen());
          //       break;
          //
          //   }
          case 1:
            {
              // navigationBarState.setPage(3);
              if(currentIndex!=1) {
                context.read<ConstantsNotifier>().updateIndex(1);
                navigateTO(context, ProfileScreen());
              }
              break;
            }

        }
  },
    height: 50,
    letIndexChange: (index) => true,


  );

}
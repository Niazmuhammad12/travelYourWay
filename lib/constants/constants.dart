import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
final  Color blueColor=Color.fromRGBO(4, 50, 77, 1.0);
//04324D
final Color blueColor2=Color.fromRGBO(4, 50, 77, 0.8);

final BoxDecoration  topContainerDecoration=BoxDecoration(
    gradient: LinearGradient(
      colors: [
        blueColor,
        blueColor2,
      ],
      end: Alignment.topCenter,
      begin: Alignment.bottomCenter,
    )
);

Container topContainer(BuildContext context){
  return Container(
    height:MediaQuery.of(context).size.height*.20,
    decoration:  BoxDecoration(
      color: blueColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],

    ),
  );


}
AppBar myAppBar(BuildContext context, screen, int index){
  return AppBar(
    elevation: 3,
    backgroundColor:blueColor,
    title:Image.asset("assets/images/logo1_white.png",height: 35.0,),
    // Text("SkilTrak",
    // style: GoogleFonts.pacifico(),
    // ),
    centerTitle: true,
    leading: InkWell(
      onTap: (){
        context.read<ConstantsNotifier>().updateShowDrawer(0);
        if(index<=2){
          context.read<ConstantsNotifier>().updateIndex(index);
        }
        screen!=null?navigateTO(context, screen):null;
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),

    actions: [
      Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
              icon: Icon(Icons.chat_rounded,color: Colors.white,),
              onPressed: (){
                // context.read<DashBoardNotifier>().updateShowDrawer();
                // to do on setting icon
              }
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                context.read<ConstantsNotifier>().updateShowDrawer(1);
                // to do on setting icon
              }
          ),
        ),
      ),

    ],

  );
}

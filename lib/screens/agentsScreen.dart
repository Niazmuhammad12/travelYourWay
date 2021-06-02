
import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/users.dart';
import 'package:travel_your_way/classes/fetchData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/agentContainer.dart';
import 'package:travel_your_way/screens/applyForHajj.dart';
import 'package:travel_your_way/screens/applyForImmigrationVisa.dart';
import 'package:travel_your_way/screens/applyForTicket%20.dart';
import 'package:travel_your_way/screens/applyForUmrah.dart';
import 'package:travel_your_way/screens/applyForVisitVisa.dart';
class AgentsScreen extends StatefulWidget {
  String type;
  AgentsScreen(this.type);
  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  // FetchData obj=new FetchData();
  // Future<List<Users>> agents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Agent"),
      ),
      body: Column(
        children:[
          Expanded(
            child: Container(
              child: FutureBuilder<List<Users>>(
                future:FetchData().getAllUsers(),
                builder: (context , snapshot){
                  if(snapshot.hasData) {
                    return ListView.builder(
                      // shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Users user=snapshot.data[index];
                          if (user.membership.toString().endsWith("ent")) {
                            print(" name:"+ user.name +" email: "+user.email);
                            return
                              GestureDetector(
                                onTap: (){
                                 switch(widget.type){
                                   case "immigration":
                                     {
                                       navigateTO(context, ApplyForImmigrationVisa(user.id.toString()));
                                      break;
                                     }
                                   case "visit":
                                     {
                                       navigateTO(context, ApplyForVisitVisa(user.id.toString()));
                                       break;
                                     }
                                   case "hajj":
                                     {
                                       navigateTO(context, ApplyForHajj(user.id.toString()));
                                       break;
                                     }
                                   case "umrah":
                                     {
                                       navigateTO(context, ApplyForUmrah(user.id.toString()));
                                       break;
                                     }
                                   case "flight":
                                     {
                                       navigateTO(context, ApplyForTicket(user.id.toString()));
                                       break;
                                     }
                                 }
                                },
                                child: Padding(

                                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                             child: getCard("assets/images/agent.png", user.name.toString(), user.email.toString())
                          ),
                              ); }
                          else {
                            return Container(
                            );
                          }
                        }
                    );
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                },


              ),
            ),
          ),
     ] ),

    );
  }
}

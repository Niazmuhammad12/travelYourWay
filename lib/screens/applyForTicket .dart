

import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/addDataToJson.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/screens/contactInformation.dart';
import 'package:travel_your_way/screens/flightDetails.dart';

import 'package:travel_your_way/screens/passengerInformation.dart';
import 'package:travel_your_way/screens/visaDetails.dart';
class ApplyForTicket extends StatefulWidget {
  var agentId;
  ApplyForTicket(this.agentId);
  @override
  _ApplyForTicketState createState() => _ApplyForTicketState();
}

class _ApplyForTicketState extends State<ApplyForTicket> {
  TabController _tabController;
  String buttonText="Save & Next";
  int _currentStep = 0;
  Map mapOfTicket={};
  Map mapOfPassenger={};
  StepperType stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner:false,
     home: Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            onPressed: (){
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          automaticallyImplyLeading: false,
          title: Text('Ticket Booking'),
          centerTitle: true,
        ),
        body:  SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  controlsBuilder:  (BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel }) {
                    return Row(
                      children: <Widget>[
                        TextButton(
                          // style: ButtonStyle(
                          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          // ),
                          onPressed: onStepContinue,
                          child: Text(
                            buttonText
                          ),
                        ),
                        TextButton(
                          onPressed: onStepCancel,
                          child: const Text('Back'),
                        ),
                      ],
                    );
                  },
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue:  continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Ticket Details'),
                      content: FilghtDetails(),

                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Passenger Details'),
                      content:PassengerInformation(true),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),

                    // Step(
                    //   title: new Text('contact info'),
                    //   content: ContactInformation(),
                    //   isActive:_currentStep >= 0,
                    //   state: _currentStep >= 2 ?
                    //   StepState.complete : StepState.disabled,
                    // ),

                    // Step(
                    //   title: new Text('education info'),
                    //   content: EducationDetails(),
                    //   isActive:_currentStep >= 0,
                    //   state: _currentStep >= 5 ?
                    //   StepState.complete : StepState.disabled,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),


      ),
   );
  }
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    if(_currentStep==0 && flightDetailsFormKey.currentState.validate()){
      setState(() {

        var flightInfo=AddDataToJson().addFlightDetails();
        mapOfTicket.addAll(flightInfo);
        // mapOfTicket['agent_id']=widget.agentId.toString();
        buttonText="Submit";
        _currentStep += 1;
        pushTicket();

      });

    }
    else if(_currentStep==1 && passengerInfoFormKey.currentState.validate()){

      setState(() {
        var personalInfo=AddDataToJson().addPersonalInfo();
        mapOfPassenger.addAll(personalInfo);
      pushPassenger();
      showAlertDialog();

      });

    }

    else{
      return null;
    }
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1,

    ) : null;
  }
  Future<void> pushTicket() async {
    // print(mapOfUmrahVisa);
    await PushData().addTicket(mapOfTicket);
  }
  Future<void> pushPassenger() async {
    // print(mapOfUmrahVisa);
    await PushData().addPassenger(mapOfPassenger,context);
  }
  showAlertDialog(){
    return showDialog(
      context: context,
      builder:(context)=> AlertDialog(
        title: Text("Applied"),
        content: Text("applied successfully for ticket "),
        actions: [
          FlatButton(onPressed: (){
            navigateToHome(context);
          }, child: Text("OK")),

        ],
      )
    );
  }
  }




import 'package:flutter/material.dart';
import 'package:travel_your_way/classes/addDataToJson.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/screens/contactInformation.dart';

import 'package:travel_your_way/screens/passengerInformation.dart';
import 'package:travel_your_way/screens/visaDetails.dart';
class ApplyForHajj extends StatefulWidget {
  var agentId;
  ApplyForHajj(this.agentId);
  @override
  _ApplyForHajjState createState() => _ApplyForHajjState();
}

class _ApplyForHajjState extends State<ApplyForHajj> {
  TabController _tabController;
  String buttonText="Save & Next";
  int _currentStep = 0;
  Map mapOfHajjDetails={};
  StepperType stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner:false,
     home: WillPopScope(
       // ignore: missing_return
       onWillPop: (){
        showDialog(context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Cancel"),
              content: Text("Do You Want To Cancel?"),
              actions: [
                FlatButton(
                    onPressed: (){
                     Navigator.pop(context);
                }, child: Text("No")),
                FlatButton(
                    onPressed: (){
                   navigateToHome(context);
                    }, child: Text("Yes")),
              ],
           elevation: 6.0,
            );
       });
       },
       child: Scaffold(
          appBar: AppBar(
            leading:  GestureDetector(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                )
            ),
            automaticallyImplyLeading: false,
            title: visaType==null?Text('Hajj Visa'):Text("${visaType} Visa"),
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
                            //
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
                        title: new Text('Passenger Details'),
                        content:PassengerInformation(false),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0 ?
                        StepState.complete : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Visa Details'),
                        content: VisaDetails("hajj"),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1 ?
                        StepState.complete : StepState.disabled,
                      ),

                      Step(
                        title: new Text('Contact Info'),
                        content: ContactInformation(),
                        isActive:_currentStep >= 0,
                        state: _currentStep >= 2 ?
                        StepState.complete : StepState.disabled,
                      ),
                      // Step(
                      //   title: new Text('family info'),
                      //   content: FamilyBackground(),
                      //   isActive:_currentStep >= 0,
                      //   state: _currentStep >= 3 ?
                      //   StepState.complete : StepState.disabled,
                      // ),
                      // Step(
                      //   title: new Text('passport info'),
                      //   content: PassportInformation(),
                      //   isActive:_currentStep >= 0,
                      //   state: _currentStep >= 4 ?
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
    if(_currentStep==0 && passengerInfoFormKey.currentState.validate()){
      setState(() {
        var personalInfo=AddDataToJson().addPersonalInfo();
        mapOfHajjDetails.addAll(personalInfo);
        _currentStep += 1;
      });

    }
    else if(_currentStep==1 && visaDetailsFormKey.currentState.validate()){
      setState(() {
        var tripInfo=AddDataToJson().addVisaDetails();
        mapOfHajjDetails.addAll(tripInfo);
        buttonText="Submit";
        _currentStep += 1;
      });

    }
    else if(_currentStep==2 && contactInfoFormKey.currentState.validate()){
      setState(() {
        var contactInfo=AddDataToJson().addContactInfo();
        mapOfHajjDetails.addAll(contactInfo);
        // mapOfHajjDetails['user_id']=userID.toString();
        mapOfHajjDetails['agent_id']=widget.agentId.toString();
             pushData();
             showAlertDialog();
      });

    }
    // else if(_currentStep==3 && familyBackgroundFormKey.currentState.validate()){
    //   setState(() {
    //     var familyInfo=addFamilyInfo();
    //     mapOfHajjDetails.addAll(familyInfo);
    //     _currentStep += 1;
    //     buttonText="Submit";
    //   });
    //
    // }
    // else if(_currentStep==4 && passportInfoFormKey.currentState.validate()){
    //   setState(() {
    //     var passportInfo=addPassportInfo();
    //     mapOfHajjDetails.addAll( passportInfo);
    //     mapOfHajjDetails['user_id']="3";
    //      pushData();
    //      showAlertDialog();
    //   });
    //
    // }
    else{
      return null;
    }
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1,

    ) : null;
  }

  Future<void> pushData() async {
    // print(mapOfHajjDetails);
    await PushData().apply(mapOfHajjDetails,context);
  }
  showAlertDialog(){
    return AlertDialog(
      title: Text("Applied"),
      content: Text("applied successfully for hajj  "),
      actions: [
        FlatButton(onPressed: (){
          navigateToHome(context);
        }, child: Text("OK")),

      ],
    );
  }

  }


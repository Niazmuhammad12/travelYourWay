
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_your_way/classes/addDataToJson.dart';
import 'package:travel_your_way/classes/fetchData.dart';
import 'package:travel_your_way/classes/personalInfo.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/screens/contactInformation.dart';

import 'package:travel_your_way/screens/passengerInformation.dart';
import 'package:travel_your_way/screens/visaDetails.dart';
class ApplyForImmigrationVisa extends StatefulWidget {
  var agentId;
  ApplyForImmigrationVisa(this.agentId);
  @override
  _ApplyForImmigrationVisaState createState() => _ApplyForImmigrationVisaState();
}

class _ApplyForImmigrationVisaState extends State<ApplyForImmigrationVisa> {
  TabController _tabController;
 // PersonalInformation personalInformation=new PersonalInformation();
 // TripDetails tripDetails=new TripDetails("");
 // ContactInformation contactInformation=new ContactInformation();
 // PassportInformation passportInformation=new PassportInformation();
 // EducationDetails educationDetails=new EducationDetails();
 // FamilyBackground familyBackground=new FamilyBackground();
  Map mapOfVisaApplyDetails={};
  String buttonText="Save & Next";
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
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
          title: visaType==null?Text('Immegration Visa'):Text("${visaType} Visa"),
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
                          //   textStyle:MaterialStateProperty.all(TextStyle(
                          //     color: Colors.white,
                          //   ))
                          // ),
                          onPressed: onStepContinue,
                          child: Text(
                            buttonText
                          ),
                        ),
                        TextButton(
                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          //     textStyle:MaterialStateProperty.all(TextStyle(
                          //       color: Colors.white,
                          //     ))
                          // ),
                          onPressed: onStepCancel,
                          child: const Text('CANCEL'),
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
                      content: VisaDetails("immegration"),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),

                    Step(
                      title: new Text('Contact Details'),
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
   );
  }


  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    if(_currentStep==0 && passengerInfoFormKey.currentState.validate()){

      setState(() {
        var personalInfo=AddDataToJson().addPersonalInfo();
        mapOfVisaApplyDetails.addAll(personalInfo);

        _currentStep += 1;

      });

    }
    else if(_currentStep==1 && visaDetailsFormKey.currentState.validate()){

      setState(() {
        var tripInfo=AddDataToJson().addVisaDetails();
      mapOfVisaApplyDetails.addAll(tripInfo);

        _currentStep += 1;
        buttonText="Submit";
      });

    }
    else if(_currentStep==2 && contactInfoFormKey.currentState.validate()){
      setState(() {
        var contactInfo=AddDataToJson().addContactInfo();
        mapOfVisaApplyDetails.addAll(contactInfo);
        // mapOfVisaApplyDetails['user_id']=userID.toString();
        mapOfVisaApplyDetails['agent_id']=widget.agentId.toString();

        pushData();
        showAlertDialog();
      });

    }
    // else if(_currentStep==3 && familyBackgroundFormKey.currentState.validate()){
    //   setState(() {
    //     var familyInfo=addFamilyInfo();
    //     mapOfVisaApplyDetails.addAll(familyInfo);
    //     _currentStep += 1;
    //   });
    //
    // }
    // else if(_currentStep==4 && passportInfoFormKey.currentState.validate()){
    //   setState(() {
    //     var passportInfo=addPassportInfo();
    //     mapOfVisaApplyDetails.addAll( passportInfo);
    //     _currentStep += 1;
    //     buttonText="Submit";
    //   });
    //
    // }
    // else if(_currentStep==5 && educationDetailsFormKey.currentState.validate()){
    //
    //   setState(() {
    //     var educationInfo=addEducationInfo();
    //     mapOfVisaApplyDetails.addAll( educationInfo);
    //     mapOfVisaApplyDetails['user_id']="3";
    //
    //     pushData();
    //
    //
    //     // _currentStep += 1;
    //
    //   });
    //
    // }
    else{
      return null;
    }
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }

Future<void> pushData() async {
    // print(mapOfVisaApplyDetails);
  await PushData().apply(mapOfVisaApplyDetails,context);
    showAlertDialog();
}
showAlertDialog(){

    return AlertDialog(
      title: Text("Applied"),
      content: Text("applied successfully for visa "),
      actions: [
        FlatButton(onPressed: (){
          navigateToHome(context);
        }, child: Text("OK")),

      ],
    );
}
  }




import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:travel_your_way/classes/addDataToJson.dart';
import 'package:travel_your_way/classes/pushData.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/screens/contactInformation.dart';

import 'package:travel_your_way/screens/passengerInformation.dart';
import 'package:travel_your_way/screens/visaDetails.dart';
class ApplyForUmrah extends StatefulWidget {
  var agentId;
  ApplyForUmrah(this.agentId);
  @override
  _ApplyForUmrahState createState() => _ApplyForUmrahState();
}

class _ApplyForUmrahState extends State<ApplyForUmrah> {
  TabController _tabController;
  String buttonText="Save & Next";
  int _currentStep = 0;
  String uID;
  Map mapOfUmrahVisa={};
  StepperType stepperType = StepperType.vertical;
  @override
  void initState() {
    // TODO: implement initState
    // getUserIdFromShared();
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
          title: visaType==null?Text('Umrah Visa'):Text("${visaType} Visa"),
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
                      title: new Text('Passenger Details '),
                      content:PassengerInformation(false),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Visa Details'),
                      content: VisaDetails("umrah"),
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
        mapOfUmrahVisa.addAll(personalInfo);
        _currentStep += 1;
      });

    }
    else if(_currentStep==1 && visaDetailsFormKey.currentState.validate()){
      setState(() {
        var tripInfo=AddDataToJson().addVisaDetails();
        mapOfUmrahVisa.addAll(tripInfo);
        buttonText="Submit";
        _currentStep += 1;
      });

    }
    else if(_currentStep==2 && contactInfoFormKey.currentState.validate()){
      setState(() {
        var contactInfo=AddDataToJson().addContactInfo();
        mapOfUmrahVisa.addAll(contactInfo);
        // mapOfUmrahVisa['user_id']=userID.toString();
        mapOfUmrahVisa['agent_id']=widget.agentId.toString();

        pushData();
        showAlertDialog();
        // _currentStep += 1;
      });

    }
    // else if(_currentStep==3 && familyBackgroundFormKey.currentState.validate()){
    //   setState(() {
    //     var familyInfo=addFamilyInfo();
    //     mapOfUmrahVisa.addAll(familyInfo);
    //     _currentStep += 1;
    //     buttonText="Submit";
    //   });
    //
    // }
    // else if(_currentStep==4 && passportInfoFormKey.currentState.validate()){
    //   setState(() {
    //     var passportInfo=addPassportInfo();
    //     mapOfUmrahVisa.addAll( passportInfo);
    //     mapOfUmrahVisa['user_id']="3";
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
    setState(() => _currentStep -= 1,

    ) : null;
  }
  Future<void> pushData() async {
    // print(mapOfUmrahVisa);
    await PushData().apply(mapOfUmrahVisa,context);
  }
  showAlertDialog(){
    return
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      return AlertDialog(
        title: Text("Applied"),
        content: Text("applied successfully for umrah "),
        actions: [
          FlatButton(onPressed: (){
            navigateToHome(context);
          }, child: Text("OK")),

        ],
      );
    });

  }

  }



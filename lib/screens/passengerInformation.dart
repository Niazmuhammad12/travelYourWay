import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
final passengerInfoFormKey = GlobalKey<FormState>();
ScrollController listViewController=new ScrollController();
 // TextEditingController countryOfBirthController = TextEditingController();
 TextEditingController nationalityController = TextEditingController();
 TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
final TextEditingController passportNumberController = TextEditingController();
 TextEditingController dateOfBirthController = TextEditingController();
String dateOfBirth;
String title;
String paxType;

String gender ;
class PassengerInformation extends StatefulWidget {
  bool show;
  PassengerInformation(this.show);
  @override
  _PassengerInformationState createState() => _PassengerInformationState();
}

class _PassengerInformationState extends State<PassengerInformation>  with WidgetsBindingObserver {


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
       SafeArea(
         child: ListView(
           controller: listViewController,
             shrinkWrap: true,
          children:[
            Form(
                 key: passengerInfoFormKey,
                 child: Column(
                   children: [

                     //country of birth
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: TextFormField(
                     //     controller: countryOfBirthController,
                     //     obscureText: false,
                     //
                     //     decoration: InputDecoration(
                     //         focusedBorder: textFieldsBorder,
                     //         disabledBorder: textFieldsBorder,
                     //         labelStyle: labelstyle,
                     //         contentPadding: EdgeInsets.all(4.0),
                     //         border: textFieldsBorder,
                     //         labelText: 'country of birth',
                     //         hintText: "country of birth"),
                     //     validator: (String value) {
                     //       if (value.isEmpty ) {
                     //         return 'country required';
                     //       }
                     //       return null;
                     //     },
                     //   ),
                     // ),
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: GestureDetector(
                     //     onTap: (){
                     //       setState(() {
                     //         listViewController.jumpTo(200.0);
                     //       });
                     //     },
                     //     child: TextFormField(
                     //       controller: cityController,
                     //       obscureText: false,
                     //
                     //       decoration: InputDecoration(
                     //           focusedBorder: textFieldsBorder,
                     //           disabledBorder: textFieldsBorder,
                     //           labelStyle: labelstyle,
                     //           contentPadding: EdgeInsets.all(4.0),
                     //           border: textFieldsBorder,
                     //           labelText: 'city',
                     //           hintText: "city"),
                     //       validator: (String value) {
                     //         if (value.isEmpty ) {
                     //           return 'city required';
                     //         }
                     //         return null;
                     //       },
                     //     ),
                     //   ),
                     // ),
                     // first name
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: DropDownFormField(

                         validator: (value){
                           if(value==null){
                             return " title required";
                           }
                           return null;
                         },
                         titleText: ' Title ',
                         value: title,
                         onSaved: (value) {
                           setState(() {
                             title= value;
                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             title = value;
                           });
                         },
                         dataSource: [
                           {
                             "display": "Mr",
                             "value": "Mr",
                           },
                           {
                             "display": "Miss",
                             "value": "Miss",
                           },
                           {
                             "display": "Mrs",
                             "value": "Mrs",
                           },
                           {
                             "display": "Ms",
                             "value": "Ms",
                           },
                           {
                             "display": "Master",
                             "value": "Master",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: firstNameController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'first name ',
                             hintText: "first name"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'first name required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // last name
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: lastNameController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'last  name ',
                             hintText: "last name"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'last name required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // date of birth
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                        controller: dateOfBirthController,
                         obscureText: false,
                         onTap: (){
                           showDatePicker(
                               context: context,
                               initialDate: DateTime.now(),
                               firstDate: DateTime(1910),
                               lastDate: DateTime(2500),
                           ).then((date){
                             setState(() {
                               dateOfBirth=date.toString();
                               dateOfBirthController.text=date.toString();
                             });

                           });
                         },
                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'date of birth',
                             hintText: "date of birth"),
                         validator: (String value) {
                           if (value.isEmpty) {
                             return 'date of birth required';
                           }
                           return null;
                         },
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: passportNumberController,
                         obscureText: false,
                         keyboardType: TextInputType.number,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'passport number',
                             hintText: "passport number"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'passport number required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // martial status
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: DropDownFormField(
                         validator: (value){
                           if(value==null){
                             return " gender required ";
                           }
                           return null;
                         },
                         titleText: 'Gender',
                         value: gender,
                         onSaved: (value) {
                           setState(() {
                             gender= value;
                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             gender = value;
                           });
                         },
                         dataSource: [
                           {
                             "display": "male",
                             "value": "male",
                           },
                           {
                             "display": "female",
                             "value": "female",
                           },
                           {
                             "display": "other",
                             "value": "other",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: DropDownFormField(
                         validator: (value){
                           if(value==null){
                             return " Pax Type required";
                           }
                           return null;
                         },
                         titleText: ' Pax Type ',
                         value: paxType,
                         onSaved: (value) {
                           setState(() {
                             paxType= value;
                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             paxType = value;
                           });
                         },
                         dataSource: [
                           {
                             "display": "adult",
                             "value": "adult",
                           },
                           {
                             "display": "kid",
                             "value": "kid",
                           },
                           {
                             "display": "infant",
                             "value": "infant",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),
                     widget.show?Padding(
                       padding: EdgeInsets.all(10.0),
                       child: Align(
                            alignment: Alignment.centerRight,
                         child:FlatButton(
                           color: Colors.blue,
                           onPressed: () {
                             // if(passengerInfoFormKey.currentState.validate()){
                             //   setState(() {
                             //     print(" no showing progress bar ");
                             //     return AlertDialog(
                             //       title: Text("warning"),
                             //       content: Text("want to discard the form"),
                             //       actions: [
                             //         FlatButton(onPressed: (){
                             //          clearFields();
                             //         }, child: Text("Yes")),
                             //       FlatButton(
                             //           onPressed:(){
                             //             Navigator.pop(context);
                             //     }
                             //
                             //        , child:  Text("No"))
                             //       ],
                             //     );
                             //   });
                             // }
                             clearFields();
                           },
                           child: Text("ADD+", style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.w500
                           ),
                           ),
                         ),
                       ),
                       
                     ):SizedBox(height: 2.0,)

                   ],
                 ),
               ),
      ] ),
       );




  }
  clearFields(){
    setState(() {
      firstNameController.text="";
      lastNameController.text="";
      dateOfBirth="";
      dateOfBirthController.text="";
      passportNumberController.text="";
      gender="";
      title="";
      paxType="";

    });
  }
}


import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
final flightDetailsFormKey = GlobalKey<FormState>();
ScrollController listViewController=new ScrollController();
 TextEditingController departureDateController = TextEditingController();
 TextEditingController issuingAirLineController = TextEditingController();
 TextEditingController bookingSourceController = TextEditingController();
TextEditingController departureController = TextEditingController();
 TextEditingController arrivalController = TextEditingController();
String journeyType;
String departureDate;
String category;
String issuingAirline;

class FilghtDetails extends StatefulWidget {

  @override
  _FilghtDetailsState createState() => _FilghtDetailsState();
}

class _FilghtDetailsState extends State<FilghtDetails>  with WidgetsBindingObserver {


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
                 key: flightDetailsFormKey,
                 child: Column(
                   children: [

                     //country of birth
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: GestureDetector(
                         onTap: (){
                           setState(() {
                             listViewController.jumpTo(200.0);
                           });
                         },
                         child: TextFormField(
                           controller: issuingAirLineController,
                           obscureText: false,

                           decoration: InputDecoration(
                               focusedBorder: textFieldsBorder,
                               disabledBorder: textFieldsBorder,
                               labelStyle: labelstyle,
                               contentPadding: EdgeInsets.all(4.0),
                               border: textFieldsBorder,
                               labelText: 'issuing airline',
                               hintText: "issuing airline"),
                           validator: (String value) {
                             if (value.isEmpty ) {
                               return 'issuing airline required';
                             }
                             return null;
                           },
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: GestureDetector(
                         onTap: (){
                           setState(() {
                             listViewController.jumpTo(200.0);
                           });
                         },
                         child: TextFormField(
                           controller: bookingSourceController,
                           obscureText: false,

                           decoration: InputDecoration(
                               focusedBorder: textFieldsBorder,
                               disabledBorder: textFieldsBorder,
                               labelStyle: labelstyle,
                               contentPadding: EdgeInsets.all(4.0),
                               border: textFieldsBorder,
                               labelText: 'booking source',
                               hintText: "booking source"),
                           validator: (String value) {
                             if (value.isEmpty ) {
                               return 'source required';
                             }
                             return null;
                           },
                         ),
                       ),
                     ),
                     // first name
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: DropDownFormField(

                         validator: (value){
                           if(value==null){
                             return " journey required";
                           }
                           return null;
                         },
                         titleText: ' journey',
                         value: journeyType,
                         onSaved: (value) {
                           setState(() {
                             journeyType= value;
                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             journeyType = value;
                           });
                         },
                         dataSource: [
                           {
                             "display": "Single ",
                             "value": "Single ",
                           },
                           {
                             "display": "Round",
                             "value": "Round",
                           },
                           {
                             "display": "Multiple City",
                             "value": "Multiple City ",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: departureController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'From ',
                             hintText: "From"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'departure required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // last name
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: arrivalController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'To',
                             hintText: "To"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'arrival required';
                           }
                           return null;
                         },
                       ),
                     ),

                     // date of birth
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                        controller: departureDateController,
                         obscureText: false,
                         onTap: (){
                           showDatePicker(
                               context: context,
                               initialDate: DateTime.now(),
                               firstDate: DateTime(1910),
                               lastDate: DateTime(2500),
                           ).then((date){
                             setState(() {
                               departureDate=date.toString();
                               departureDateController.text=date.toString();
                             });

                           });
                         },
                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'Date',
                             hintText: "Date"),
                         validator: (String value) {
                           if (value.isEmpty) {
                             return 'departure date required';
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
                             return " class required ";
                           }
                           return null;
                         },
                         titleText: 'Class',
                         value: category,
                         onSaved: (value) {
                           setState(() {
                             category= value;
                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             category = value;
                           });
                         },
                         dataSource: [
                           {
                             "display": "Business ",
                             "value": "Business",
                           },
                           {
                             "display": "First Class",
                             "value": "First Class ",
                           },
                           {
                             "display": "Economy Class",
                             "value": "Economy Class",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),


                   ],
                 ),
               ),
      ] ),
       );




  }
}


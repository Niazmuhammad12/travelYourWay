import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_your_way/classes/fetchData.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
final visaDetailsFormKey = GlobalKey<FormState>();
ScrollController listViewController=new ScrollController();
final TextEditingController visaTypeController = TextEditingController();
final TextEditingController durationController = TextEditingController();
final TextEditingController visaApplyCountryController = TextEditingController();
String visaType ;
class VisaDetails extends StatefulWidget {
  String type;
  VisaDetails(this.type);

  @override
  _VisaDetailsState createState() => _VisaDetailsState();
}

class _VisaDetailsState extends State<VisaDetails>  with WidgetsBindingObserver {

 bool readOnly=false;

  FetchData obj=new FetchData();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);




    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String type=widget.type;
    return
       SafeArea(
         child: ListView(
           controller: listViewController,
             shrinkWrap: true,
          children:[
            Form(
                 key: visaDetailsFormKey,
                 child: Column(
                   children: [
                     // visa apply country not for hajj and umrah
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child:  DropDownFormField(
                         validator: (value){
                           if(value==null){
                             return " type required ";
                           }
                           return null;
                         },
                         titleText: 'Visa Type  ',
                         hintText: 'Please choose one',
                         value: visaType,
                         onSaved: (value) {
                           setState(() {
                             visaType= value;

                           });
                         },
                         onChanged: (value) {
                           setState(() {
                             visaType = value;
                             if(value=="Hajj" || value=="Umrah"){
                               visaApplyCountryController.text="saudi arabia";
                               readOnly=true;
                             }
                             else{
                               visaApplyCountryController.text="";
                               readOnly=false;
                             }
                           });
                         },

                         dataSource: [
                           {
                             "display": "Immigration ",
                             "value": "Immigration",
                           },
                           {
                             "display": "Visit",
                             "value": "Visit",
                           },
                           {
                             "display": "Umrah",
                             "value": "Umrah",
                           },
                           {
                             "display": "Hajj",
                             "value": "Hajj",
                           },

                         ],
                         textField: 'display',
                         valueField: 'value',
                       ),
                     ),
                    Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child:TextFormField(
                         controller:visaApplyCountryController ,
                         obscureText: false,
                         readOnly: readOnly,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: readOnly?visaTypeController.text:"country",
                             hintText: readOnly?visaTypeController.text:"country"),
                         validator: (String value) {
                           if (visaApplyCountryController==null ) {
                             return 'Country required';
                           }
                           return null;
                         },
                       ),
               ),

                     // visa type

                     // departure airport
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: DropDownFormField(
                     //     titleText: 'departure airport ',
                     //     hintText: 'Please choose one',
                     //     value: departureAirport,
                     //     onSaved: (value) {
                     //       setState(() {
                     //         departureAirport= value;
                     //       });
                     //     },
                     //     onChanged: (value) {
                     //       setState(() {
                     //         departureAirport = value;
                     //       });
                     //     },
                     //     dataSource: [
                     //       {
                     //         "display": "islamabad",
                     //         "value":  "islamabad",
                     //       },
                     //       {
                     //         "display":  "karachi",
                     //         "value": "karachi",
                     //       },
                     //       {
                     //         "display": "peshawar",
                     //         "value": "peshawar",
                     //       },
                     //       {
                     //         "display": "lahore",
                     //         "value": "lahore",
                     //       },
                     //       {
                     //         "display": "sialkot",
                     //         "value": "sialkot",
                     //       },
                     //
                     //     ],
                     //     textField: 'display',
                     //     valueField: 'value',
                     //   ),
                     // ),
                     // departure time
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: TextFormField(
                     //     controller: departureTimeController,
                     //     obscureText: false,
                     //     onTap: (){
                     //       showDatePicker(
                     //         context: context,
                     //         initialDate: DateTime.now(),
                     //         firstDate: DateTime(2021),
                     //         lastDate: DateTime(2500),
                     //       ).then((date){
                     //         setState(() {
                     //           departureTime=date.toString();
                     //           departureTimeController.text=date.toString();
                     //         });
                     //
                     //       });
                     //     },
                     //     decoration: InputDecoration(
                     //         focusedBorder: textFieldsBorder,
                     //         disabledBorder: textFieldsBorder,
                     //         labelStyle: labelstyle,
                     //         contentPadding: EdgeInsets.all(4.0),
                     //         border: textFieldsBorder,
                     //         labelText: 'departure time ',
                     //         hintText: "departure time "),
                     //     validator: (String value) {
                     //       if (value.isEmpty) {
                     //         return 'departure time  required';
                     //       }
                     //       return null;
                     //     },
                     //   ),
                     // ),
                     // arival airport

                    // number of days only for hajj umrah and visit visa
                  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: durationController,
                         obscureText: false,
                          keyboardType: TextInputType.number,
                         decoration: InputDecoration(

                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: ' duration ',
                             hintText: "duration (month)"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'duration required';
                           }
                           return null;
                         },
                       ),
                     )
                   ],
                 ),
               ),
      ] ),
       );




  }

 }




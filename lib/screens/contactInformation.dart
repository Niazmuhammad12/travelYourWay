import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
final contactInfoFormKey = GlobalKey<FormState>();
ScrollController listViewController=new ScrollController();
final TextEditingController streetAddressController = TextEditingController();
// final TextEditingController postalCodeController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController countryController = TextEditingController();
final TextEditingController workPhoneController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
// final TextEditingController currentCountryController = TextEditingController();
// final TextEditingController currentCityController = TextEditingController();
// final TextEditingController currentStateController = TextEditingController();
class ContactInformation extends StatefulWidget {
  @override
  _ContactInformationState createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation>  with WidgetsBindingObserver {


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
                 key: contactInfoFormKey,
                 child: Column(
                   children: [
                     // street address
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child:TextFormField(
                         controller: streetAddressController,
                         obscureText: false,
                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: ' address',
                             hintText: " address"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'address required';
                           }
                           return null;
                         },
                       ),
               ),
                      // current city
                     // Padding(
                     //  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: TextFormField(
                     //     controller: currentCityController,
                     //     obscureText: false,
                     //     decoration: InputDecoration(
                     //         focusedBorder: textFieldsBorder,
                     //         disabledBorder: textFieldsBorder,
                     //         labelStyle: labelstyle,
                     //         contentPadding: EdgeInsets.all(4.0),
                     //         border: textFieldsBorder,
                     //         labelText: 'city',
                     //         hintText: "city"),
                     //     validator: (String value) {
                     //       if (value.isEmpty ) {
                     //         return 'city required';
                     //       }
                     //       return null;
                     //     },
                     //   ),
                     // ),
                     // state
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: GestureDetector(
                     //     onTap: (){
                     //       setState(() {
                     //         listViewController.jumpTo(180.0);
                     //       });
                     //     },
                     //     child: TextFormField(
                     //       controller: currentStateController,
                     //       obscureText: false,
                     //       decoration: InputDecoration(
                     //           focusedBorder: textFieldsBorder,
                     //           disabledBorder: textFieldsBorder,
                     //           labelStyle: labelstyle,
                     //           contentPadding: EdgeInsets.all(4.0),
                     //           border: textFieldsBorder,
                     //           labelText: 'state ',
                     //           hintText: "state  "),
                     //       validator: (String value) {
                     //         if (value.isEmpty ) {
                     //           return ' state  required';
                     //         }
                     //         return null;
                     //       },
                     //     ),
                     //   ),
                     // ),
                     // current country
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: countryController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'country',
                             hintText: "country "),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'country required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // email
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child:TextFormField(
                         controller: emailController,
                         obscureText: false,
                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'email',
                             hintText: "email"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'email required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // phone number
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: GestureDetector(
                         onTap: (){
                           setState(() {
                             listViewController.jumpTo(200.0);
                           });
                         },
                         child: TextFormField(
                           controller: phoneController,
                           obscureText: false,

                           decoration: InputDecoration(
                               focusedBorder: textFieldsBorder,
                               disabledBorder: textFieldsBorder,
                               labelStyle: labelstyle,
                               contentPadding: EdgeInsets.all(4.0),
                               border: textFieldsBorder,
                               labelText: 'phone number',
                               hintText: "phone number"),
                           validator: (String value) {
                             if (value.isEmpty ) {
                               return 'phone number required';
                             }
                             return null;
                           },
                         ),
                       ),
                     ),
                     // work phone
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       child: TextFormField(
                         controller: workPhoneController,
                         obscureText: false,

                         decoration: InputDecoration(
                             focusedBorder: textFieldsBorder,
                             disabledBorder: textFieldsBorder,
                             labelStyle: labelstyle,
                             contentPadding: EdgeInsets.all(4.0),
                             border: textFieldsBorder,
                             labelText: 'work phone ',
                             hintText: "work phone"),
                         validator: (String value) {
                           if (value.isEmpty ) {
                             return 'work phone required';
                           }
                           return null;
                         },
                       ),
                     ),
                     // postal code
                     // Padding(
                     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                     //   child: TextFormField(
                     //     controller: postalCodeController,
                     //     obscureText: false,
                     //
                     //     decoration: InputDecoration(
                     //         focusedBorder: textFieldsBorder,
                     //         disabledBorder: textFieldsBorder,
                     //         labelStyle: labelstyle,
                     //         contentPadding: EdgeInsets.all(4.0),
                     //         border: textFieldsBorder,
                     //         labelText: 'postal code ',
                     //         hintText: "postal code"),
                     //     validator: (String value) {
                     //       if (value.isEmpty ) {
                     //         return 'postal code required';
                     //       }
                     //       return null;
                     //     },
                     //   ),
                     // ),
                   ],
                 ),
               ),
      ] ),
       );




  }
}


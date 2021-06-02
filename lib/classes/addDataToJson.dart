
import 'package:travel_your_way/classes/contactInfoClass.dart';
import 'package:travel_your_way/classes/flightDetailsClass.dart';

import 'package:travel_your_way/classes/personalInfo.dart';
import 'package:travel_your_way/classes/visaDetailsClass.dart';
import 'package:travel_your_way/screens/contactInformation.dart';
import 'package:travel_your_way/screens/flightDetails.dart';
import 'package:travel_your_way/screens/passengerInformation.dart';
import 'package:travel_your_way/screens/visaDetails.dart';


class AddDataToJson {

  addPersonalInfo() {
    Map personalInfoMap = PersonalInfo(
        firstNameController.text.toString(),
        lastNameController.text.toString(),
        gender,
        dateOfBirth,
        title,
        paxType,
      passportNumberController.text.toString()

    ).toJson();
    var personalInfoJson = PersonalInfo.fromJson((personalInfoMap));

    return personalInfoMap;
  }

  addFlightDetails() {
    Map flightDetailsMap = FlightDetailsClass(
        issuingAirLineController.text.toString(),
        bookingSourceController.text.toString(),
        departureDateController.text.toString(),
        journeyType,
        departureController.text.toString(),
        arrivalController.text.toString(),
        category,
    ).toJson();
    var passportInfoJson = FlightDetailsClass.fromJson((flightDetailsMap));
    return flightDetailsMap;
  }

//  addEducationInfo(){
//   Map educationInfoMap=EducationInfoClass(
//     degreeCompletionDateController.text.toString(),
//     jobLocationController.text.toString(),
//     degreeNameController.text.toString(),
//     employmentStatusController.text.toString(),
//     salaryController.text.toString(),
//   ).toJson();
//   var  educationInfoJson= EducationInfoClass.fromJson((educationInfoMap));
//   return educationInfoMap;
// }
  addContactInfo() {
    Map contactInfoMap = ContactInfoClass(
      emailController.text.toString(),
      phoneController.text.toString(),
      workPhoneController.text.toString(),
      streetAddressController.text.toString(),
      // currentCityController.text.toString(),
      countryController.text.toString(),
      // postalCodeController.text.toString(),
      // currentStateController.text.toString(),
    ).toJson();
    var contactInfoJson = ContactInfoClass.fromJson((contactInfoMap));
    return contactInfoMap;
  }

//  addFamilyInfo(){
//   Map familyInfoMap=FamilyInfoClass(
//     motherNameController.text.toString(),
//     languageController.text.toString(),
//     fatherNameController.text.toString(),
//     parentLocationController.text.toString(),
//
//   ).toJson();
//   var  familyInfoJson= FamilyInfoClass.fromJson((familyInfoMap));
//   return familyInfoMap;
// }
  addVisaDetails() {
    Map tripInfoMap = TripDetailsClass(
      visaApplyCountryController.text.toString(),
      // departureAirport,
      // departureTime,
      passportNumberController.text.toString(),
      visaType,

      durationController.text.toString(),
    ).toJson();
    var tripInfoJson = TripDetailsClass.fromJson((tripInfoMap));
    return tripInfoMap;
  }
}
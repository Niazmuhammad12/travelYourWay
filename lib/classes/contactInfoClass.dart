

class ContactInfoClass{
  final String email;
  final String phoneNumber;
  final String workPhoneNumber;
  final  String streetAddress;
  // final String currentCity;
  final String currentCountry;
  // final  String postalCode;
  // final String currentState;

  ContactInfoClass(this.email, this.phoneNumber,this.workPhoneNumber,this.streetAddress,this.currentCountry);

  ContactInfoClass.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        phoneNumber = json['phone_number'],
        workPhoneNumber = json['work_phone'],
        streetAddress = json['street'],
  //
        currentCountry = json['country'];
  //       postalCode = json['postal_code'],
  // currentCity = json['city'];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'phone_number': phoneNumber,
        'work_phone': workPhoneNumber,
        'street': streetAddress,
        // 'city': currentCity,
        // 'state': currentState,
        'country':currentCountry,
        // 'postal_code':postalCode


      };
}
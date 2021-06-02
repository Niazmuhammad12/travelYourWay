

class TripDetailsClass{
  final String visaApplyCountry;
  final String passportNumber;
  final String visaType;
  // final  String arrivalAirport;
  final String numberOfDays;
  // final String departureTime;

  TripDetailsClass(this.visaApplyCountry, this.passportNumber,this.visaType, this.numberOfDays);

  TripDetailsClass.fromJson(Map<String, dynamic> json)
      : visaApplyCountry = json['visa_apply_country'],
        passportNumber = json['passport_number'],
         // departureTime=json['departure_date'],
        visaType = json['type'],
        // arrivalAirport = json['arrival_airport'],
  numberOfDays = json['days'];

  Map<String, dynamic> toJson() =>
      {
        'visa_apply_country': visaApplyCountry,
        'passport_number': passportNumber,
        // 'departure_date':departureTime,
        'type': visaType,
        // 'arrival_airport': arrivalAirport,
        'days': numberOfDays,
      };
}
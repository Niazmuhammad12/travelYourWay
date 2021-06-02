
class FlightDetailsClass {
  // final String countryOfdBirth;
  final String issuingAirline;
  final String bookingSource;
  final String journeyType;
  final String departure;
  final String arrival;
  final String departureDate;

  final String category;

  FlightDetailsClass(this.issuingAirline, this.bookingSource,this.departureDate,this.journeyType,this.departure,this.arrival,this.category);

  FlightDetailsClass.fromJson(Map<String, dynamic> json)
      : issuingAirline = json['issuing_airline'],
        bookingSource = json['booking_source'],
        // countryOfdBirth = json['country_of_birth'],
  journeyType = json['journey_type'],
        // passportNumber = json['passport_number'],
  departure = json['departure_airport'],
  arrival = json['arrival_airport'],
  departureDate = json['departure_date'],
  category = json['class'];

  Map<String, dynamic> toJson() =>
      {
        'issuing_airline': issuingAirline,
        'booking_source': bookingSource,
        // 'country_of_birth': countryOfdBirth,
        'departure_airport': departure,
        'journey_type': journeyType,
        'arrival_airport': arrival,
        // 'passport_number':passportNumber,
        'departure_date': departureDate,
        'class': category,

      };
}

class PersonalInfo {
  final String passportNumber;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String title;
  final String paxType;
  final String gender;

  PersonalInfo(this.firstName, this.lastName,this.gender,this.dateOfBirth,this.title,this.paxType,this.passportNumber);

  PersonalInfo.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        lastName = json['last_name'],
        passportNumber = json['passport_number'],
  dateOfBirth = json['date_of_birth'],
  title = json['title'],
  paxType = json['pax_type'],
  gender = json['gender'];

  Map<String, dynamic> toJson() =>
      {
        'first_name': firstName,
        'last_name': lastName,
        'passport_number': passportNumber,
        'title': title,
        'date_of_birth': dateOfBirth,
        'pax_type': paxType,
        'gender': gender,

      };
}
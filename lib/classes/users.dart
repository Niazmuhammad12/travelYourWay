import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.name,
    this.membership,
    this.profileImage,
    this.email,
    this.phoneNumber,
    this.country,
    this.city,
    this.state,
  });

  final int id;
  final String name;
  final String membership;
  final String profileImage;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String state;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    membership: json["membership"],
    profileImage: json["profile_image"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    country: json["country"],
    city: json["city"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "membership": membership,
    "profile_image": profileImage,
    "email": email,
    "phone_number": phoneNumber,
    "country": country,
    "city": city,
    "state": state,
  };
}
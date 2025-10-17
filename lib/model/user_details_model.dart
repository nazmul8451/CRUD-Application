import 'dart:convert';

class UserDetailsModel {
  final String name;
  final String email;
  final int id;
  final UserAdress address;


  UserDetailsModel({
    required this.name,
    required this.email,
    required this.id,
    required this.address,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDetailsModel(
      name: jsonData['name'],
      email: jsonData['email'],
      id: jsonData['id'],
      address:UserAdress.fromJson(jsonData['address']),
    );
  }
}


class UserAdress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String geo;


  UserAdress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserAdress.fromJson (Map<String, dynamic> jsonData){
    return UserAdress(
      street: jsonData['street'],
      suite: jsonData['suite'],
      city: jsonData['city'],
      zipcode: jsonData['zipcode'],
      geo: jsonData['geo']['lat'],
    );
  }


}


import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final String surname;
  final String gsm;
  final String email;
  final String password;
  final String authority;
  final Timestamp creationtime;
  final Timestamp birthday;
  Student(
      {this.id = "",
      required this.name,
      required this.surname,
      required this.gsm,
      required this.email,
      required this.password,
      required this.authority,
      required this.creationtime,
      required this.birthday});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        gsm: json['gsm'],
        email: json['email'],
        authority: json['authority'],
        password: json['password'],
        creationtime: json['creationtime'],
        birthday: json['birthday']);
  }
}

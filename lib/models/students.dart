// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentsListFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.name,
    this.email,
    this.phoneNo,
    this.formUsername,
    this.formPassword,
    this.scholarshipType,
    this.password,
    this.formVerified,
    this.formSubmitted,
    this.date,
    this.slotTime,
  });

  String? name;
  String? email;
  String? phoneNo;
  String? formUsername;
  String? formPassword;
  String? scholarshipType;
  String? password;
  bool? formVerified;
  bool? formSubmitted;
  dynamic date;
  dynamic slotTime;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        formUsername: json["formUsername"],
        formPassword: json["formPassword"],
        scholarshipType: json["scholarshipType"],
        password: json["password"],
        formVerified: json["formVerified"],
        formSubmitted: json["formSubmitted"],
        date: json["date"],
        slotTime: json["slotTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? '',
        "email": email ?? '',
        "phoneNo": phoneNo ?? '',
        "formUsername": formUsername ?? '',
        "formPassword": formPassword ?? '',
        "scholarshipType": scholarshipType == null ? '' : scholarshipType,
        "password": password ?? '',
        "formVerified": formVerified ?? '',
        "formSubmitted": formSubmitted ?? '',
        "date": date ?? '',
        "slotTime": slotTime ?? '',
      };
}

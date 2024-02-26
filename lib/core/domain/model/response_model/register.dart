import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class RegisterModel extends Model {
  String name;
  String email;
  String password;
  String gender;
  String birth;
  String phone;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birth,
    required this.phone,
  });

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? gender,
    String? birth,
    String? phone,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birth: birth ?? this.birth,
        phone: phone ?? this.phone,
      );

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        birth: json["birth"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "birth": birth,
        "phone": phone,
      };
}

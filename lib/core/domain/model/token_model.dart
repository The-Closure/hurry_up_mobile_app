import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class TokenModel extends Model {
  String token;

  TokenModel({
    required this.token,
  });

  TokenModel copyWith({
    String? token,
  }) =>
      TokenModel(
        token: token ?? this.token,
      );

  factory TokenModel.fromJson(String str) =>
      TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}

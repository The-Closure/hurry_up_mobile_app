import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class DeleteBuslineModel extends Model {
  int busLineId;

  DeleteBuslineModel({
    required this.busLineId,
  });

  DeleteBuslineModel copyWith({
    int? busLineId,
  }) =>
      DeleteBuslineModel(
        busLineId: busLineId ?? this.busLineId,
      );

  factory DeleteBuslineModel.fromJson(String str) =>
      DeleteBuslineModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteBuslineModel.fromMap(Map<String, dynamic> json) =>
      DeleteBuslineModel(
        busLineId: json["bus_line_id"],
      );

  Map<String, dynamic> toMap() => {
        "bus_line_id": busLineId,
      };
}

class DeleteBuslineResponseModel extends Model {
  String message;

  DeleteBuslineResponseModel({
    required this.message,
  });

  DeleteBuslineResponseModel copyWith({
    String? message,
  }) =>
      DeleteBuslineResponseModel(
        message: message ?? this.message,
      );

  factory DeleteBuslineResponseModel.fromJson(String str) =>
      DeleteBuslineResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteBuslineResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteBuslineResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}

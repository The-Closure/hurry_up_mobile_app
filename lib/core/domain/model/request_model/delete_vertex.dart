import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class DeleteVertexResponseModel extends Model {
  String message;

  DeleteVertexResponseModel({
    required this.message,
  });

  DeleteVertexResponseModel copyWith({
    String? message,
  }) =>
      DeleteVertexResponseModel(
        message: message ?? this.message,
      );

  factory DeleteVertexResponseModel.fromJson(String str) =>
      DeleteVertexResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteVertexResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteVertexResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}

class DeleteVertexModel extends Model {
  int busLineId;

  DeleteVertexModel({
    required this.busLineId,
  });

  DeleteVertexModel copyWith({
    int? busLineId,
  }) =>
      DeleteVertexModel(
        busLineId: busLineId ?? this.busLineId,
      );

  factory DeleteVertexModel.fromJson(String str) =>
      DeleteVertexModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteVertexModel.fromMap(Map<String, dynamic> json) =>
      DeleteVertexModel(
        busLineId: json["bus_line_id"],
      );

  Map<String, dynamic> toMap() => {
        "bus_line_id": busLineId,
      };
}

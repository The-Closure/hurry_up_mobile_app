import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class FeedbackModel extends Model {
  int vertexId;

  FeedbackModel({
    required this.vertexId,
  });

  FeedbackModel copyWith({
    int? vertexId,
  }) =>
      FeedbackModel(
        vertexId: vertexId ?? this.vertexId,
      );

  factory FeedbackModel.fromJson(String str) =>
      FeedbackModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromMap(Map<String, dynamic> json) => FeedbackModel(
        vertexId: json["vertex_id"],
      );

  Map<String, dynamic> toMap() => {
        "vertex_id": vertexId,
      };
}

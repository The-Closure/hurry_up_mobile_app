
import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class FeedbackModel extends Model{
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

    factory FeedbackModel.fromJson(String str) => FeedbackModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeedbackModel.fromMap(Map<String, dynamic> json) => FeedbackModel(
        vertexId: json["vertex_id"],
    );

    Map<String, dynamic> toMap() => {
        "vertex_id": vertexId,
    };
}

class FeedbackResponseModel extends Model{
    String message;

    FeedbackResponseModel({
        required this.message,
    });

    FeedbackResponseModel copyWith({
        String? message,
    }) => 
        FeedbackResponseModel(
            message: message ?? this.message,
        );

    factory FeedbackResponseModel.fromJson(String str) => FeedbackResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeedbackResponseModel.fromMap(Map<String, dynamic> json) => FeedbackResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
    };
}

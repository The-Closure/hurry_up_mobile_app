import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class FeedbackModel extends Model{
    int? vertexId;
    String? massage;

    FeedbackModel({
        this.vertexId,
        this.massage,
    });

    FeedbackModel copyWith({
        int? vertexId,
        String? massage,
    }) => 
        FeedbackModel(
            vertexId: vertexId ?? this.vertexId,
            massage: massage ?? this.massage,
        );

    factory FeedbackModel.fromJson(String str) => FeedbackModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeedbackModel.fromMap(Map<String, dynamic> json) => FeedbackModel(
        vertexId: json["vertex_id"],
        massage: json["massage"],
    );

    Map<String, dynamic> toMap() => {
        "vertex_id": vertexId,
        "massage": massage,
    };
}


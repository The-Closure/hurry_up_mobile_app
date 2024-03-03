import 'dart:convert';

import 'package:riide/core/domain/model/model.dart';

class ShortestPathModel extends Model {
  String source_id;
  String target_id;

  ShortestPathModel({
    required this.source_id,
    required this.target_id,
  });

  ShortestPathModel copyWith({
    String? sourceName,
    String? targetName,
  }) =>
      ShortestPathModel(
        source_id: sourceName ?? this.source_id,
        target_id: targetName ?? this.target_id,
      );

  factory ShortestPathModel.fromJson(String str) =>
      ShortestPathModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShortestPathModel.fromMap(Map<String, dynamic> json) =>
      ShortestPathModel(
        source_id: json["source_id"],
        target_id: json["target_id"],
      );

  Map<String, dynamic> toMap() => {
        "source_id": source_id,
        "target_id": target_id,
      };
}

class ShortPathRespunseModel extends Model {
  List<dynamic> shortPath;

  ShortPathRespunseModel({
    required this.shortPath,
  });
}

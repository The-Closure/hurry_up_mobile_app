// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostShortestPathModel {
  int source_id;
  int target_id;
  PostShortestPathModel({
    required this.source_id,
    required this.target_id,
  });

  PostShortestPathModel copyWith({
    int? source_id,
    int? target_id,
  }) {
    return PostShortestPathModel(
      source_id: source_id ?? this.source_id,
      target_id: target_id ?? this.target_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source_id': source_id,
      'target_id': target_id,
    };
  }

  factory PostShortestPathModel.fromMap(Map<String, dynamic> map) {
    return PostShortestPathModel(
      source_id: map['source_id'] as int,
      target_id: map['target_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostShortestPathModel.fromJson(String source) =>
      PostShortestPathModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostShortestPathModel(source_id: $source_id, target_id: $target_id)';

  @override
  bool operator ==(covariant PostShortestPathModel other) {
    if (identical(this, other)) return true;

    return other.source_id == source_id && other.target_id == target_id;
  }

  @override
  int get hashCode => source_id.hashCode ^ target_id.hashCode;
}

class PostShortestPathModelResponse {
  List<int> paths;
  PostShortestPathModelResponse({
    required this.paths,
  });

  PostShortestPathModelResponse copyWith({
    List<int>? paths,
  }) {
    return PostShortestPathModelResponse(
      paths: paths ?? this.paths,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paths': paths,
    };
  }

  factory PostShortestPathModelResponse.fromMap(Map<String, dynamic> map) {
    return PostShortestPathModelResponse(
      paths: List<int>.from((map['paths'] as List<int>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory PostShortestPathModelResponse.fromJson(String source) => PostShortestPathModelResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostShortestPathModelResponse(paths: $paths)';

  @override
  bool operator ==(covariant PostShortestPathModelResponse other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.paths, paths);
  }

  @override
  int get hashCode => paths.hashCode;
}

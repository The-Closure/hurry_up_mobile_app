// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class PostFeedback {
  int vertex_id;
  PostFeedback({
    required this.vertex_id,
  });

  PostFeedback copyWith({
    int? vertex_id,
  }) {
    return PostFeedback(
      vertex_id: vertex_id ?? this.vertex_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vertex_id': vertex_id,
    };
  }

  factory PostFeedback.fromMap(Map<String, dynamic> map) {
    return PostFeedback(
      vertex_id: map['vertex_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostFeedback.fromJson(String source) => PostFeedback.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostFeedback(vertex_id: $vertex_id)';

  @override
  bool operator ==(covariant PostFeedback other) {
    if (identical(this, other)) return true;
  
    return 
      other.vertex_id == vertex_id;
  }

  @override
  int get hashCode => vertex_id.hashCode;
}

class PostFeedbackResponse extends ErrorModel{
  PostFeedbackResponse({required super.messaeg});
  
}

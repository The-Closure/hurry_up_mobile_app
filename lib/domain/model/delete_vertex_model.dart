// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class DeleteVertexModelResponse extends ResultModel {
  dynamic message;
  DeleteVertexModelResponse({
    required this.message,
  });

  DeleteVertexModelResponse copyWith({
    dynamic? message,
  }) {
    return DeleteVertexModelResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory DeleteVertexModelResponse.fromMap(Map<String, dynamic> map) {
    return DeleteVertexModelResponse(
      message: map['message'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteVertexModelResponse.fromJson(String source) =>
      DeleteVertexModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteVertexModelResponse(message: $message)';

  @override
  bool operator ==(covariant DeleteVertexModelResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

//////////////////////
class DeleteVertexModel {
  int id;
  DeleteVertexModel({
    required this.id,
  });

  DeleteVertexModel copyWith({
    int? id,
  }) {
    return DeleteVertexModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory DeleteVertexModel.fromMap(Map<String, dynamic> map) {
    return DeleteVertexModel(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteVertexModel.fromJson(String source) => DeleteVertexModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteVertexModel(id: $id)';

  @override
  bool operator ==(covariant DeleteVertexModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

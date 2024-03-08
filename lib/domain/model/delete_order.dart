// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class DeleteOrder {
  int id;
  DeleteOrder({
    required this.id,
  });

  DeleteOrder copyWith({
    int? id,
  }) {
    return DeleteOrder(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory DeleteOrder.fromMap(Map<String, dynamic> map) {
    return DeleteOrder(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteOrder.fromJson(String source) => DeleteOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteOrder(id: $id)';

  @override
  bool operator ==(covariant DeleteOrder other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DeleteOrderResponse extends ErrorModel{
  DeleteOrderResponse({required super.messaeg});
}
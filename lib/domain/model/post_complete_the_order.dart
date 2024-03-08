// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_app/token_model/token_model.dart';

class PostCompleteTheOrder {
  int id;
  PostCompleteTheOrder({
    required this.id,
  });

  PostCompleteTheOrder copyWith({
    int? id,
  }) {
    return PostCompleteTheOrder(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory PostCompleteTheOrder.fromMap(Map<String, dynamic> map) {
    return PostCompleteTheOrder(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCompleteTheOrder.fromJson(String source) =>
      PostCompleteTheOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostCompleteTheOrder(id: $id)';

  @override
  bool operator ==(covariant PostCompleteTheOrder other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class PostCompleteTheOrderResponse extends ErrorModel {
  PostCompleteTheOrderResponse({required super.messaeg});
}

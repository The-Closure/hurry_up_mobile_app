// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetHistoryResponse {
  int id;
  List user_ids;
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  int estimated_price;
  bool is_hurry;
  String status;
  String genders;
  String created_at;
  String updated_at;
  GetHistoryResponse({
    required this.id,
    required this.user_ids,
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.estimated_price,
    required this.is_hurry,
    required this.status,
    required this.genders,
    required this.created_at,
    required this.updated_at,
  });

  GetHistoryResponse copyWith({
    int? id,
    List? user_ids,
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    int? estimated_price,
    bool? is_hurry,
    String? status,
    String? genders,
    String? created_at,
    String? updated_at,
  }) {
    return GetHistoryResponse(
      id: id ?? this.id,
      user_ids: user_ids ?? this.user_ids,
      top_passenger_count: top_passenger_count ?? this.top_passenger_count,
      current_passenger_count: current_passenger_count ?? this.current_passenger_count,
      destination_vertices_id: destination_vertices_id ?? this.destination_vertices_id,
      estimated_price: estimated_price ?? this.estimated_price,
      is_hurry: is_hurry ?? this.is_hurry,
      status: status ?? this.status,
      genders: genders ?? this.genders,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_ids': user_ids,
      'top_passenger_count': top_passenger_count,
      'current_passenger_count': current_passenger_count,
      'destination_vertices_id': destination_vertices_id,
      'estimated_price': estimated_price,
      'is_hurry': is_hurry,
      'status': status,
      'genders': genders,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory GetHistoryResponse.fromMap(Map<String, dynamic> map) {
    return GetHistoryResponse(
      id: map['id'] as int,
      user_ids: List.from((map['user_ids'] as List)),
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      estimated_price: map['estimated_price'] as int,
      is_hurry: map['is_hurry'] as bool,
      status: map['status'] as String,
      genders: map['genders'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetHistoryResponse.fromJson(String source) => GetHistoryResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetHistoryResponse(id: $id, user_ids: $user_ids, top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, estimated_price: $estimated_price, is_hurry: $is_hurry, status: $status, genders: $genders, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant GetHistoryResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      listEquals(other.user_ids, user_ids) &&
      other.top_passenger_count == top_passenger_count &&
      other.current_passenger_count == current_passenger_count &&
      other.destination_vertices_id == destination_vertices_id &&
      other.estimated_price == estimated_price &&
      other.is_hurry == is_hurry &&
      other.status == status &&
      other.genders == genders &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_ids.hashCode ^
      top_passenger_count.hashCode ^
      current_passenger_count.hashCode ^
      destination_vertices_id.hashCode ^
      estimated_price.hashCode ^
      is_hurry.hashCode ^
      status.hashCode ^
      genders.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}

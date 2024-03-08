// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostJoinOrder {
  int order_id;
  int num_of_people;
  PostJoinOrder({
    required this.order_id,
    required this.num_of_people,
  });

  PostJoinOrder copyWith({
    int? order_id,
    int? num_of_people,
  }) {
    return PostJoinOrder(
      order_id: order_id ?? this.order_id,
      num_of_people: num_of_people ?? this.num_of_people,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_id': order_id,
      'num_of_people': num_of_people,
    };
  }

  factory PostJoinOrder.fromMap(Map<String, dynamic> map) {
    return PostJoinOrder(
      order_id: map['order_id'] as int,
      num_of_people: map['num_of_people'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostJoinOrder.fromJson(String source) =>
      PostJoinOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostJoinOrder(order_id: $order_id, num_of_people: $num_of_people)';

  @override
  bool operator ==(covariant PostJoinOrder other) {
    if (identical(this, other)) return true;

    return other.order_id == order_id && other.num_of_people == num_of_people;
  }

  @override
  int get hashCode => order_id.hashCode ^ num_of_people.hashCode;
}

class PostJoinOrderResponse {
  int id;
  List user_ids;
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  dynamic estimated_price;
  bool is_hurry;
  String status;
  String genders;
  String created_at;
  String updated_at;
  PostJoinOrderResponse({
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

  PostJoinOrderResponse copyWith({
    int? id,
    List? user_ids,
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    dynamic? estimated_price,
    bool? is_hurry,
    String? status,
    String? genders,
    String? created_at,
    String? updated_at,
  }) {
    return PostJoinOrderResponse(
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

  factory PostJoinOrderResponse.fromMap(Map<String, dynamic> map) {
    return PostJoinOrderResponse(
      id: map['id'] as int,
      user_ids: List.from((map['user_ids'] as List)),
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      estimated_price: map['estimated_price'] as dynamic,
      is_hurry: map['is_hurry'] as bool,
      status: map['status'] as String,
      genders: map['genders'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostJoinOrderResponse.fromJson(String source) => PostJoinOrderResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostJoinOrderResponse(id: $id, user_ids: $user_ids, top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, estimated_price: $estimated_price, is_hurry: $is_hurry, status: $status, genders: $genders, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant PostJoinOrderResponse other) {
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

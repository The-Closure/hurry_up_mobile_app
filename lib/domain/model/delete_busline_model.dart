// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class DeleteBusLineModel {
  int bus_line_id;
  DeleteBusLineModel({
    required this.bus_line_id,
  });

  DeleteBusLineModel copyWith({
    int? bus_line_id,
  }) {
    return DeleteBusLineModel(
      bus_line_id: bus_line_id ?? this.bus_line_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bus_line_id': bus_line_id,
    };
  }

  factory DeleteBusLineModel.fromMap(Map<String, dynamic> map) {
    return DeleteBusLineModel(
      bus_line_id: map['bus_line_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteBusLineModel.fromJson(String source) =>
      DeleteBusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteBusLineModel(bus_line_id: $bus_line_id)';

  @override
  bool operator ==(covariant DeleteBusLineModel other) {
    if (identical(this, other)) return true;

    return other.bus_line_id == bus_line_id;
  }

  @override
  int get hashCode => bus_line_id.hashCode;
}


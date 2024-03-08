import 'package:hurry_app/domain/model/get_history.dart';

class GetPendingOrdersResponse extends GetHistoryResponse{
  GetPendingOrdersResponse({required super.id, required super.user_ids, required super.top_passenger_count, required super.current_passenger_count, required super.destination_vertices_id, required super.estimated_price, required super.is_hurry, required super.status, required super.genders, required super.created_at, required super.updated_at});
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pending_order_bloc.dart';

@immutable
sealed class PendingOrderEvent {}

class Pending extends PendingOrderEvent {
  String sourceId;
  Pending({
    required this.sourceId,
  });
}

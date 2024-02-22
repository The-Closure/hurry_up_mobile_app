// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'complete_order_bloc.dart';

@immutable
sealed class CompleteOrderEvent {}

class CompleteTheOrder extends CompleteOrderEvent {
  CompleteOrderModel complete;
  CompleteTheOrder({required this.complete});
}

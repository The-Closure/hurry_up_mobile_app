// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'join_order_bloc.dart';

@immutable
sealed class JoinOrderEvent {}

class JoinToOrder extends JoinOrderEvent {
  JoinOrderModel joinOrder;
  JoinToOrder({required this.joinOrder});
}

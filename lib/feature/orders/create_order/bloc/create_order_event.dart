// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_order_bloc.dart';

@immutable
sealed class CreateOrderEvent {}

class CreateNewOrder extends CreateOrderEvent {
  OrdersModel order;
  CreateNewOrder({required this.order});
}

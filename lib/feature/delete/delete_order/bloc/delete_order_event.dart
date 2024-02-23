// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_order_bloc.dart';

@immutable
sealed class DeleteOrderEvent {}

class CancelOrder extends DeleteOrderEvent {
  DeleteOrderModel theOrder;
  CancelOrder({required this.theOrder});
}

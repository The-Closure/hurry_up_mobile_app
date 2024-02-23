// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_order_bloc.dart';

@immutable
sealed class DeleteOrderState {}

final class DeleteOrderInitial extends DeleteOrderState {}

class SuccessDeleteOrder extends DeleteOrderState {}

class ErrorInDeleteOrder extends DeleteOrderState {
  ErrorModel error;
  ErrorInDeleteOrder({required this.error});
}

class ExcptionInDeteleOrder extends DeleteOrderState {
  ExcptionModel excption;
  ExcptionInDeteleOrder({required this.excption});
}

class LoadingToDeleteOrder extends DeleteOrderState {}

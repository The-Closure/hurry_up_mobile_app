// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_order_bloc.dart';

@immutable
sealed class CreateOrderState {}

final class CreateOrderInitial extends CreateOrderState {}

class SuccessInCreateOrder extends CreateOrderState {
  OrdersResponseModel order;
  SuccessInCreateOrder({
    required this.order,
  });
}

class ErrorInCreateOrder extends CreateOrderState {
  ErrorModel error;
  ErrorInCreateOrder({required this.error});
}

class ExcptionInCreateOrder extends CreateOrderState {
  ExcptionModel ecxption;
  ExcptionInCreateOrder({required this.ecxption});
}

class LoadingToCreateOrder extends CreateOrderState {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'complete_order_bloc.dart';

@immutable
sealed class CompleteOrderState {}

final class CompleteOrderInitial extends CompleteOrderState {}

class SuccessCompleteOrder extends CompleteOrderState {}

class ErrorINCompleteOrder extends CompleteOrderState {
  ErrorModel error;
  ErrorINCompleteOrder({required this.error});
}

class ExcptionInCompleteOrder extends CompleteOrderState {
  ExcptionModel excption;
  ExcptionInCompleteOrder({required this.excption});
}

class LoadingToCompleteOrder extends CompleteOrderState {}

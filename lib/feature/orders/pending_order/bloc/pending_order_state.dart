// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pending_order_bloc.dart';

@immutable
sealed class PendingOrderState {}

final class PendingOrderInitial extends PendingOrderState {}

class SuccessPendingOrder extends PendingOrderState {
  List<PendingAndHistoryModel> pendingOrder;
  SuccessPendingOrder({
    required this.pendingOrder,
  });
}

class ErrorInPendingOrder extends PendingOrderState {
  ErrorModel error;
  ErrorInPendingOrder({required this.error});
}

class ExcptionInPendingOrder extends PendingOrderState {
  ExcptionModel excption;
  ExcptionInPendingOrder({required this.excption});
}

class LoadingToPendingOrder extends PendingOrderState {}

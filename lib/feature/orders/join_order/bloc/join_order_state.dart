// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'join_order_bloc.dart';

@immutable
sealed class JoinOrderState {}

final class JoinOrderInitial extends JoinOrderState {}

class SuccessJoinOrder extends JoinOrderState {}

class ErrorInJoinOrder extends JoinOrderState {
  ErrorModel error;
  ErrorInJoinOrder({required this.error});
}

class ExceptionJoinOrder extends JoinOrderState {
  ExcptionModel excption;
  ExceptionJoinOrder({required this.excption});
}

class LoadingToJoinOrder extends JoinOrderState {}

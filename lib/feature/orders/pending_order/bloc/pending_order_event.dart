part of 'pending_order_bloc.dart';

@immutable
sealed class PendingOrderEvent {}

class Pending extends PendingOrderEvent {}
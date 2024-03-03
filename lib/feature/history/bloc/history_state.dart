// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

class SuccessGetHistory extends HistoryState {
  List<PendingAndHistoryModel> history;
  SuccessGetHistory({required this.history});
}

class ErrorInGettingHistory extends HistoryState {
  ErrorModel error;
  ErrorInGettingHistory({required this.error});
}

class ExcptionInGettingHistory extends HistoryState {
  ExcptionModel excption;
  ExcptionInGettingHistory({required this.excption});
}

class LoadingToHistory extends HistoryState {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shortest_path_bloc.dart';

@immutable
sealed class ShortestPathState {}

final class ShortestPathInitial extends ShortestPathState {}

class SuccessToCreatePath extends ShortestPathState {}

class ErrorInCreatePath extends ShortestPathState {
  ErrorModel error;
  ErrorInCreatePath({required this.error});
}

class ExcptionInCreatePath extends ShortestPathState {
  ExcptionModel excption;
  ExcptionInCreatePath({required this.excption});
}

class LoadingToCreatePath extends ShortestPathState {}

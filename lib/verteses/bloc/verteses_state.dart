// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verteses_bloc.dart';

// @immutable
sealed class VertesesState {
  VertesesState();
}

final class VertesesInitial extends VertesesState {}

class LoadingVerteses extends VertesesState {}

class ErrorFetchingVerteses extends VertesesState {}

class SuccessDeletingVertex extends VertesesState {
  DeleteVertexModelResponse deleteVertexModelResponse;
  SuccessDeletingVertex({
    required this.deleteVertexModelResponse,
  });
}

class SuccessFetchingVerteses extends VertesesState {
  List<GetVertesesModelResponse> getVertesesModelResponse;
  SuccessFetchingVerteses({
    required this.getVertesesModelResponse,
  });
}

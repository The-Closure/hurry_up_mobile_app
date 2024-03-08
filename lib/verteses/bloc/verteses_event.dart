// // ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verteses_bloc.dart';

// @immutable
sealed class VertesesEvent {}

class DeleteVertex extends VertesesEvent {
  DeleteVertexModel intIndex;
  DeleteVertex({
    required this.intIndex,
  });
}

class GetDataVerteses extends VertesesEvent {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shortest_path_bloc.dart';

@immutable
sealed class ShortestPathEvent {}

class CreateNewPath extends ShortestPathEvent {
  ShortestPathModel path;
  CreateNewPath({required this.path});
}

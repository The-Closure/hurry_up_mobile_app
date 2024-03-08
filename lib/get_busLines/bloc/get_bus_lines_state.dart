part of 'get_bus_lines_bloc.dart';

@immutable
sealed class GetBusLinesState {}

final class GetBusLinesInitial extends GetBusLinesState {}

class LoadingBusLinesData extends GetBusLinesState{}

class ErrorFetchingBusLinesData extends GetBusLinesState {}

class SuccessFetchingBusLinesData extends GetBusLinesState{}


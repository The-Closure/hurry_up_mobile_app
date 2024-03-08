// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'store_bus_line_bloc.dart';

// @immutable
sealed class StoreBusLineState {}

final class StoreBusLineInitial extends StoreBusLineState {}

class LoadingDataa extends StoreBusLineState {}

class ErrorFetchingBusLine extends StoreBusLineState {}

class SuccessFetchingBusLine extends StoreBusLineState {
  StoreBusLineModelResponse storeBusLineModelResponse;
  SuccessFetchingBusLine({
    required this.storeBusLineModelResponse,
  });
}

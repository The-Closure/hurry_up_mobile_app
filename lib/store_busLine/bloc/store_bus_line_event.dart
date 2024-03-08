// import 'package:hurry_app/domain/model/store_busLine_model.dart';

part of 'store_bus_line_bloc.dart';

// @immutable
sealed class StoreBusLineEvent {}

class PostBusLineData extends StoreBusLineEvent {
  Map<String, Object> deta;
  PostBusLineData({
    required this.deta,
  });
}

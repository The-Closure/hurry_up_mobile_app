import 'package:bloc/bloc.dart';
import 'package:hurry_app/domain/model/store_busLine_model.dart';
import 'package:hurry_app/store_busLine/service/busLine_service.dart';
import 'package:hurry_app/token_model/token_model.dart';

part 'store_bus_line_event.dart';
part 'store_bus_line_state.dart';

class StoreBusLineBloc extends Bloc<StoreBusLineEvent, StoreBusLineState> {
  StoreBusLineBloc() : super(StoreBusLineInitial()) {
    on<PostBusLineData>((event, emit) async {
      emit(LoadingDataa());

      ResultModel temp = await ImpBusLineService().storeBusline(event.deta);

      if (temp is ErrorModel) {
        emit(ErrorFetchingBusLine());
      } else if (temp is StoreBusLineModelResponse) {
        emit(SuccessFetchingBusLine(
            storeBusLineModelResponse: temp as StoreBusLineModelResponse));
      }
    });
  }
}

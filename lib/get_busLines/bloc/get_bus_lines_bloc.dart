import 'package:bloc/bloc.dart';
import 'package:hurry_app/domain/model/get_busLine_model.dart';
import 'package:hurry_app/get_busLines/service/getBusLinesService.dart';
import 'package:hurry_app/token_model/token_model.dart';
import 'package:meta/meta.dart';

part 'get_bus_lines_event.dart';
part 'get_bus_lines_state.dart';

class GetBusLinesBloc extends Bloc<GetBusLinesEvent, GetBusLinesState> {
  GetBusLinesBloc() : super(GetBusLinesInitial()) {
    on<GetBusLinesEvent>((event, emit) async {
      emit(LoadingBusLinesData());

      List<ResultModel> temp = await ImpGetBusLinesService().GetBusLines();
      if (temp is List<ErrorModel>) {
        emit(ErrorFetchingBusLinesData());
      } else if (temp is List<GetBusLinesModelResponse>) {
        emit(SuccessFetchingBusLinesData());
      }
    });
  }
}

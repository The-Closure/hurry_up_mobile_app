import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/pending_history_orders.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/domain/service/get_service/history_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GetAllHistory>((event, emit) async {
      emit(LoadingToHistory());
      dynamic temp = await HistoryService().getHistory();

      if (temp is List<PendingAndHistoryModel>) {
        emit(SuccessGetHistory(history: temp as List<PendingAndHistoryModel>));
      } else if (temp is ErrorModel) {
        emit(ErrorInGettingHistory(error: temp));
      } else {
        emit(ExcptionInGettingHistory(excption: temp as ExcptionModel));
      }
    });
  }

  String? getVertexNameById(
      {required int id, required List<VertexModel> vertex}) {
    for (var v in vertex) {
      if (v.id == id) {
        return v.name;
      }
    }
    return null;
  }
}

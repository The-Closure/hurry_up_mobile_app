import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/join_an_order.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/domain/service/post_service/join_order_service.dart';

part 'join_order_event.dart';
part 'join_order_state.dart';

class JoinOrderBloc extends Bloc<JoinOrderEvent, JoinOrderState> {
  JoinOrderBloc() : super(JoinOrderInitial()) {
    on<JoinToOrder>((event, emit) async {
      emit(LoadingToJoinOrder());
      Model temp = await JoinOrderService().join(model: event.joinOrder);
      if (temp is JoinOrderResponseModel) {
        emit(SuccessJoinOrder());
      } else if (temp is ErrorModel) {
        emit(ErrorInJoinOrder(error: temp));
      } else {
        emit(ExceptionJoinOrder(excption: temp as ExcptionModel));
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

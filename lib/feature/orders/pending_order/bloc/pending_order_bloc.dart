import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/pending_orders.dart';
import 'package:riide/core/domain/service/get_service/pending_order_service.dart';

part 'pending_order_event.dart';
part 'pending_order_state.dart';

class PendingOrderBloc extends Bloc<PendingOrderEvent, PendingOrderState> {
  PendingOrderBloc() : super(PendingOrderInitial()) {
    on<Pending>((event, emit) {
      emit(LoadingToPendingOrder());

      Model temp = PendingOrderService().pendingOrder();

      if (temp is PendingOrderModel) {
        emit(SuccessPendingOrder());
      } else if (temp is ErrorModel) {
        emit(ErrorInPendingOrder(error: temp));
      } else {
        emit(ExcptionInPendingOrder(excption: temp as ExcptionModel));
      }
    });
  }
}

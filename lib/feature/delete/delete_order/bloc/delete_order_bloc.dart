import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/delete_order.dart';
import 'package:riide/core/domain/service/delet_service/delete_order_service.dart';

part 'delete_order_event.dart';
part 'delete_order_state.dart';

class DeleteOrderBloc extends Bloc<DeleteOrderEvent, DeleteOrderState> {
  DeleteOrderBloc() : super(DeleteOrderInitial()) {
    on<CancelOrder>((event, emit) async {
      emit(LoadingToDeleteOrder());
      Model temp =
          await DeleteOrderService().deleteTheOrder(model: event.theOrder);
      if (temp is DeleteOrderResponseModel) {
        emit(SuccessDeleteOrder());
      } else if (temp is ErrorModel) {
        emit(ErrorInDeleteOrder(error: temp));
      } else {
        emit(ExcptionInDeteleOrder(excption: temp as ExcptionModel));
      }
    });
  }
}

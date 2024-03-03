import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/orders.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/domain/service/post_service/orders_service.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  int? selectedSourceIndex;
  int? selectedTargetIndex;

  CreateOrderBloc() : super(CreateOrderInitial()) {
    on<CreateNewOrder>((event, emit) async {
      emit(LoadingToCreateOrder());
      Model temp = await OrdersService().createOrder(model: event.order);
      if (temp is OrdersResponseModel) {
        emit(SuccessInCreateOrder(order: temp));
      } else if (temp is ErrorModel) {
        emit(ErrorInCreateOrder(error: temp));
      } else {
        emit(ExcptionInCreateOrder(ecxption: temp as ExcptionModel));
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

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/orders.dart';
import 'package:riide/core/domain/service/post_Service/orders_service.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitial()) {
    on<CreateNewOrder>((event, emit) async {
      emit(LoadingToCreateOrder());
      Model temp = await OrdersService().createOrder(model: event.order);
      if (temp is OrdersModel) {
        emit(SuccessInCreateOrder());
      } else if (temp is ErrorModel) {
        emit(ErrorInCreateOrder(error: temp));
      } else {
        emit(ExcptionInCreateOrder(ecxption: temp as ExcptionModel));
      }
    });
  }
}

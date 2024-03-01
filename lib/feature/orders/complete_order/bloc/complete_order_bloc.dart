import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/complete_the_order.dart';
import 'package:riide/core/domain/service/post_service/complete_order_service.dart';

part 'complete_order_event.dart';
part 'complete_order_state.dart';

class CompleteOrderBloc extends Bloc<CompleteOrderEvent, CompleteOrderState> {
  CompleteOrderBloc() : super(CompleteOrderInitial()) {
    on<CompleteTheOrder>((event, emit) async {
      emit(LoadingToCompleteOrder());

      Model temp = await CompleteOrderService().complete(model: event.complete);

      if (temp is CompleteOrderResponseModel) {
        emit(SuccessCompleteOrder());
      } else if (temp is ErrorModel) {
        emit(ErrorINCompleteOrder(error: temp));
      } else {
        emit(ExcptionInCompleteOrder(excption: temp as ExcptionModel));
      }
    });
  }
}

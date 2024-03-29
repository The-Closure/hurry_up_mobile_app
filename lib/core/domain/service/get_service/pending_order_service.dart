import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/pending_history_orders.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class PendingOrderService extends Service {
  pendingOrder({required String sourceVerticesId}) async {
    try {
      response = await dio.get(
          Url().baseUrl +
              Url().pendingOrders +
              Url().pendingOrderId +
              sourceVerticesId,
          options: options);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        List<PendingAndHistoryModel> result = List.generate(
          temp.length,
          (index) => PendingAndHistoryModel.fromMap(temp[index]),
        );
        ListModel pending = ListModel(listOfModel: result);

        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

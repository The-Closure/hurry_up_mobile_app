import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/request_model/pending_orders.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class PendingOrderService extends Service {
  /*Future<Model> */ pendingOrder() async {
    try {
      response = await dio.get(Url().baseUrl + Url().pendingOrders);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        // List<PendingOrderModel> result = List.generate(
        //   temp.length,
        //   (index) => PendingOrderModel.fromMap(temp[index]),
        // );
        // ListModel pending = ListModel(listOfModel: result);

        // return pending;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/orders.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class OrdersService extends Service {
  Future<Model> createOrder({required OrdersModel model}) async {
    try {
      response = await dio.post(Url().url + Url().orders, data: model.toJson());
      if (response.statusCode == 200) {
        dynamic temp = response.data;

        OrdersModel result = OrdersModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

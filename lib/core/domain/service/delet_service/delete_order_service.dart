import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/delete_order.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class DeleteOrderService extends Service {
  Future<Model> deleteTheOrder({required DeleteOrderModel model}) async {
    try {
      response = await dio.delete(Url().baseUrl + Url().deleteOrder,
          data: model.toJson(), options: options);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        DeleteOrderModel result = DeleteOrderModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

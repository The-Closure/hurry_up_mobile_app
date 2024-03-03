import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/pending_history_orders.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class HistoryService extends Service {
  getHistory() async {
    try {
      response = await dio.get(Url().baseUrl + Url().history, options: options);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        List<PendingAndHistoryModel> result = List.generate(
          temp.length,
          (index) => PendingAndHistoryModel.fromMap(temp[index]),
        );
        ListModel history = ListModel(listOfModel: result);

        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

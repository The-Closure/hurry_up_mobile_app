import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class LoginService extends Service {
  Future<Model> login({required LoginModel model}) async {
    try {
      response =
          await dio.post(Url().url + Url().loginUrl, data: model.toJson());
      dynamic temp = response.data;
      if (temp.hashCode == 200) {
        LoginModel result = LoginModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

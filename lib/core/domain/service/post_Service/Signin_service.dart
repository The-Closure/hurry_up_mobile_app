import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/model/response_model/token_model.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class LoginService extends Service {
  Future<TheFatherModel> login({required LoginModel model}) async {
    try {
      response =
          await dio.post(Url().baseUrl + Url().loginUrl, data: model.toJson());

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        TokenModel result = TokenModel(token: temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}

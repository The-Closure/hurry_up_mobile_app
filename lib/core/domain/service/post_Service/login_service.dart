import 'package:riide/core/config/get_it.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/model/token_model.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends Service {
  Future<Model /*dynamic*/ > login({required LoginModel model}) async {
    try {
      response =
          await dio.post(Url().baseUrl + Url().loginUrl, data: model.toJson());

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        TokenModel result = TokenModel.fromMap(temp);
        config.get<SharedPreferences>().setString('token', result.token);

        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      print(e.toString());
      return ExcptionModel(excption: e.toString());
    }
  }
}

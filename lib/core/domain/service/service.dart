import 'package:dio/dio.dart';
import 'package:riide/core/config/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Service {
  Dio dio = Dio();
  late Response response;
  Options options = Options(
    validateStatus: (status) => true,
    headers: {
      "authorization":
          "Bearer ${config.get<SharedPreferences>().getString('token')}"
    },
  );
}

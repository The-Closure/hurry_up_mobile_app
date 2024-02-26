import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/model/token_model.dart';
import 'package:riide/core/domain/service/post_service/login_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<Login>((event, emit) async {
      emit(LoadingToLogin());
      Model temp = await LoginService().login(model: event.user);

      if (temp is TokenModel) {
        emit(SuccessInLogin());
      } else if (temp is ErrorModel) {
        emit(ErrorInLogin(error: temp));
      } else if (temp is ExcptionModel) {
        emit(ExcptionInLogin(excption: temp));
      }
    });
  }
}

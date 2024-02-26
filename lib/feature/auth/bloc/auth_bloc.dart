import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/model/response_model/register.dart';
import 'package:riide/core/domain/model/response_model/token_model.dart';
import 'package:riide/core/domain/service/post_Service/Signin_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(LoadingAuthState());
      TheFatherModel temp = await LoginService().login(model: event.user);
      if (temp is TokenModel) {
        emit(SuccessToSgininAuthState());
      } else if (temp is ErrorModel) {
        emit(ErrorInSigninAuthState(error: temp));
      // } else {
      //   emit(ExcptionInLogin(excption: temp as ExcptionModel));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/register.dart';
import 'package:riide/core/domain/service/post_service/register_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAnAccount>((event, emit) async {
      emit(LoadingCreateAnAccount());
      Model temp = await RegisterService().signUp(model: event.user);
      if (temp is RegisterModel) {
        emit(SuccessCreateAnAccount());
      } else if (temp is ErrorModel) {
        emit(ErrorInCreateAnAccount(error: temp));
      } else {
        emit(ExcptionInCreateAnAccount(excption: temp as ExcptionModel));
      }
    });
  }
}

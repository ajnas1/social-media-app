import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginScreenRegisterClickedEvent>(loginScreenRegisterClickedEvent);
    on<LoginScreenForgotPasswordClickedEvent>(loginScreenForgotPasswordClickedEvent);
    on<LoginScreenLoginButtonClickedEvent>(loginScreenLoginButtonClickedEvent);
  }

  FutureOr<void> loginScreenRegisterClickedEvent(LoginScreenRegisterClickedEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenRegisterClickedActionState());
  }

  FutureOr<void> loginScreenForgotPasswordClickedEvent(LoginScreenForgotPasswordClickedEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenForgotPasswordClickedActionState());
  }
  
  FutureOr<void> loginScreenLoginButtonClickedEvent(LoginScreenLoginButtonClickedEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenLoginButtonClickedActionState());
  }
}

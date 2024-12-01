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
    // on<LoginEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  FutureOr<void> loginScreenRegisterClickedEvent(LoginEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenRegisterClickedActionState());
  }

  FutureOr<void> loginScreenForgotPasswordClickedEvent(LoginEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenForgotPasswordClickedActionState());
  }
  
  FutureOr<void> loginScreenLoginButtonClickedEvent(LoginEvent event,Emitter<LoginState> emit) {
    emit(LoginScreenLoginButtonClickedActionState());
  }
}

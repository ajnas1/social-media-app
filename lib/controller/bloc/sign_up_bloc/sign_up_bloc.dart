import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);
    on<SignUpContinueButtonClickedEvent>(signUpContinueButtonClickedEvent);
    on<SignUpLoginButtonClickedEvent>(signUpLoginButtonClickedEvent);
  }

  //for signUpInitial event it emit a success state
  FutureOr<void> signUpInitialEvent(SignUpEvent  event,Emitter<SignUpState> emit) async{
   emit(SignUpSuccessState());
  }

  //for user clicked continue button then emit continue button action state
  FutureOr<void> signUpContinueButtonClickedEvent(SignUpEvent  event,Emitter<SignUpState> emit) async{
   emit(SignUpContinueButtonClickedActionState());
  }

  //for user clicked continue button then emit login button action state
  FutureOr<void> signUpLoginButtonClickedEvent(SignUpEvent  event,Emitter<SignUpState> emit) async{
   emit(SignUpLoginButtonClickedActionState());
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/services/firebase_auth_services.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);
    on<SignUpContinueButtonClickedEvent>(signUpContinueButtonClickedEvent);
    on<SignUpLoginButtonClickedEvent>(signUpLoginButtonClickedEvent);
  }

  //for signUpInitial event it emit a success state
  FutureOr<void> signUpInitialEvent(SignUpInitialEvent  event,Emitter<SignUpState> emit) async{
   emit(SignUpSuccessState());
  }

  //for user clicked continue button then emit continue button action state
  FutureOr<void> signUpContinueButtonClickedEvent(SignUpContinueButtonClickedEvent  event,Emitter<SignUpState> emit) async{
    
   await FirebaseAuthServices().verifyPhoneNumber(event.phoneNumber, event.phoneNumber,event.context);
  
  }

  //for user clicked continue button then emit login button action state
  FutureOr<void> signUpLoginButtonClickedEvent(SignUpLoginButtonClickedEvent  event,Emitter<SignUpState> emit) async{
   emit(SignUpLoginButtonClickedActionState());
  }
}

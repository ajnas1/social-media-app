import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordScreenContinueButtonClickedEvent>(forgotPasswordScreenContinueButtonClickedEvent);
    // on<ForgotPasswordEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
  FutureOr<void> forgotPasswordScreenContinueButtonClickedEvent(ForgotPasswordEvent event ,Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordScreenContinueButtonClickedActionState());
  }
}

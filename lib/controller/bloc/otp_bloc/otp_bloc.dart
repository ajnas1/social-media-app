import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpContinueButtonClickedEvent>(otpContinueButtonClickedEvent);
    on<OtpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  FutureOr<void> otpContinueButtonClickedEvent(OtpEvent event,Emitter<OtpState> emit) async {
    emit(OtpContinueButtonClickedActionState());
  }
}

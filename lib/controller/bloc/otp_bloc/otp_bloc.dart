import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/services/firebase_auth_services.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpContinueButtonClickedEvent>(otpContinueButtonClickedEvent);
  }
  FutureOr<void> otpContinueButtonClickedEvent(OtpContinueButtonClickedEvent event,Emitter<OtpState> emit) async {
    var isSuccess = await FirebaseAuthServices().submitOtp(event.verificationId,event.smsCode,event.username);
    if(isSuccess) {
      FirebaseAuthServices().addUsername(event.username);
      emit(OtpContinueButtonClickedActionState());
    }
    
  }
}

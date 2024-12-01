import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/controller/bloc/reset_password_bloc.dart/reset_password_bloc.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPasswordContinueButtonClickedEvent>(resetPasswordContinueButtonClickedEvent);
    on<ResetPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  FutureOr<void> resetPasswordContinueButtonClickedEvent(ResetPasswordEvent event,Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordContinueButtonClickedActionState());
  }
  }


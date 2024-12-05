part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

final class OtpContinueButtonClickedEvent extends OtpEvent {
  final String verificationId;
  final String username;
  final String smsCode;

  OtpContinueButtonClickedEvent({required this.verificationId, required this.username, required this.smsCode});
}


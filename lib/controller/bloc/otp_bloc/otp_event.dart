part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

final class OtpContinueButtonClickedEvent extends OtpEvent {}
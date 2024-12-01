part of 'otp_bloc.dart';

@immutable
sealed class OtpState {}

@immutable
sealed class OtpActionState extends OtpState {}

final class OtpInitial extends OtpState {}

final class OtpContinueButtonClickedActionState extends OtpActionState {}
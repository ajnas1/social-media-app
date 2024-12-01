part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

@immutable
sealed class ForgotPasswordActionState extends ForgotPasswordState{}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordScreenContinueButtonClickedActionState extends ForgotPasswordActionState {}


part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {}

@immutable
sealed class ResetPasswordActionState extends ResetPasswordState{}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordContinueButtonClickedActionState extends ResetPasswordActionState{}
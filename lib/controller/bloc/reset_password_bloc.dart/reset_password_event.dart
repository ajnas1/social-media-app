part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class ResetPasswordContinueButtonClickedEvent extends ResetPasswordEvent {}
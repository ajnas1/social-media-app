part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginScreenRegisterClickedEvent extends LoginEvent {}

final class LoginScreenLoginButtonClickedEvent extends LoginEvent {}

final class LoginScreenForgotPasswordClickedEvent extends LoginEvent {}
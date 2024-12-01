part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

@immutable
sealed class LoginActionState extends LoginState {}

final class LoginScreenLoginButtonClickedActionState extends LoginActionState {}

final class LoginScreenRegisterClickedActionState extends LoginActionState {}

final class LoginScreenForgotPasswordClickedActionState extends LoginActionState {}
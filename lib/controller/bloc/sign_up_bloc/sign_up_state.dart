part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

@immutable
sealed class SignUpActionState extends SignUpState{}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpContinueButtonClickedActionState extends SignUpActionState {}

final class SignUpLoginButtonClickedActionState extends SignUpActionState {}
part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpInitialEvent extends SignUpEvent {}

final class SignUpContinueButtonClickedEvent extends SignUpEvent {}

final class SignUpLoginButtonClickedEvent extends SignUpEvent {}
part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpInitialEvent extends SignUpEvent {}

final class SignUpContinueButtonClickedEvent extends SignUpEvent {
  final String username;
  final String phoneNumber;
  final BuildContext context;

  SignUpContinueButtonClickedEvent({
    required this.username, 
    required this.phoneNumber,
    required this.context
  });
}

final class SignUpLoginButtonClickedEvent extends SignUpEvent {}
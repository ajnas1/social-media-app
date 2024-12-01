import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/controller/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:social_media_app/controller/bloc/login_bloc/login_bloc.dart';
import 'package:social_media_app/controller/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:social_media_app/controller/bloc/otp_bloc/otp_bloc.dart';
import 'package:social_media_app/controller/bloc/reset_password_bloc.dart/reset_password_bloc.dart';
import 'package:social_media_app/controller/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:provider/single_child_widget.dart';

enum NavigationStatus  {
  initial,
  loading,
  loaded,
  error
}

final List<SingleChildWidget> provider = [
  BlocProvider(
    create: (context) => NavigationBloc(),
  ),
  BlocProvider(
    create:(context) => SignUpBloc(),
  ),
  BlocProvider(
    create:(context) => OtpBloc(),
  ),
  BlocProvider(
    create:(context) => LoginBloc(),
  ),
  BlocProvider(
    create:(context) => ForgotPasswordBloc(),
  ),
  BlocProvider(
    create:(context) => ResetPasswordBloc(),
  ),
];

//authentication screens 

const double authenticationLargeTitleSize  = 50;

const double authenticationMediumTitleSize = 20;

const double authenticationSmallTitleSize = 15;

const double authenticationPadding = 15;

const double authenticationTextFieldBorderWidth = 2.0;

const double authenticationTextFieldBorderRadius = 15;

const double authenticationElevatedButtonBorderRadius = 40;
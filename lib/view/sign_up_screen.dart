import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:social_media_app/controller/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/view/login_screen.dart';
import 'package:social_media_app/view/otp_code_screen.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController usernameController;

  late final TextEditingController phoneNumberController;

  late final TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    BlocProvider.of<SignUpBloc>(context).add(SignUpInitialEvent());
    super.initState();
  }

  void callBack(BuildContext context) {
    print('fj');
    BlocProvider.of<SignUpBloc>(context).add(SignUpContinueButtonClickedEvent());
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if(state is SignUpContinueButtonClickedActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => OtpCodeScreen()));
        }else if (state is SignUpLoginButtonClickedActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SignUpSuccessState:
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: authenticationPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset('assets/lottie/signup.json'),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: authenticationLargeTitleSize,
                          color: authenticationLargeTitleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFieldWidget(
                      usernameController,
                      icon: IconsaxPlusLinear.user,
                      label: 'Enter your Username',
                    ),
                    TextFieldWidget(
                      phoneNumberController,
                      icon: IconsaxPlusLinear.call,
                      label: 'Enter your Phone number',
                    ),
                    TextFieldWidget(
                      passwordController,
                      icon: IconsaxPlusLinear.lock,
                      label: 'Enter your Password',
                    ),
                    authenticationFinishButton(
                        context: context,
                        title: 'Continue',
                        callBack: callBack),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.295),
                      child: Row(
                        children: [
                          const Text('Joined as before?'),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<SignUpBloc>(context).add(SignUpLoginButtonClickedEvent());
                            },
                            child: const Text(
                              ' Login',
                              style: TextStyle(
                                  color: authenticationClickableTextColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          default:
           return SizedBox();
        }
      },
    );
  }
}

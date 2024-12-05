import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/controller/bloc/login_bloc/login_bloc.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  void callBack(BuildContext context) {
     BlocProvider.of<LoginBloc>(context).add(LoginScreenLoginButtonClickedEvent());
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginScreenRegisterClickedActionState) {
          Navigator.pop(context);
        }else if(state is LoginScreenForgotPasswordClickedActionState) {
        
        }else if(state is LoginScreenLoginButtonClickedActionState) {
        //  Navigator.push(context, MaterialPageRoute(builder:(context) => OtpCodeScreen()));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: authenticationPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/lottie/signup.json'),
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: authenticationLargeTitleSize,
                    color: authenticationLargeTitleColor,
                    fontWeight: FontWeight.bold),
              ),
              TextFieldWidget(
                phoneNumberController,
                icon: IconsaxPlusLinear.call,
                label: 'Enter your Phone number',
              ),
              authenticationFinishButton(
                  context: context, title: 'Login', callBack: callBack),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.18),
                child: Row(
                  children: [
                    const Text('New to Social media app?'),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginScreenRegisterClickedEvent());
                      },
                      child: const Text(
                        ' Register',
                        style:
                            TextStyle(color: authenticationClickableTextColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

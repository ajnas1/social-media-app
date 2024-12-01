import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/controller/bloc/reset_password_bloc.dart/reset_password_bloc.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/view/login_screen.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController conformNewPasswordController = TextEditingController();
  void callBack(BuildContext context) {
    BlocProvider.of<ResetPasswordBloc>(context).add(ResetPasswordContinueButtonClickedEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.white,),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: authenticationPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset('assets/lottie/lock.json'),
                const Text(
                  'Reset\nPassword',
                  style: TextStyle(
                    fontSize: authenticationLargeTitleSize,
                    color: authenticationLargeTitleColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextFieldWidget(newPasswordController,icon: IconsaxPlusLinear.lock,label: 'New Password'),
                const SizedBox(height: 29),
                TextFieldWidget(conformNewPasswordController,icon: IconsaxPlusLinear.lock,label: 'Conform New Password'),
                const SizedBox(height: 40),
                authenticationFinishButton(context:  context,title: 'Continue',callBack: callBack),
              ],
            ),
          ),
        ),
    );
  }
}
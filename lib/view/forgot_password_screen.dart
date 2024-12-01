import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/view/navigation.dart';
import 'package:social_media_app/view/reset_password_screen.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authenticationPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Lottie.asset('assets/lottie/forget_password.json'),
            const Text(
              'Forgot\nPassword?',
              style: TextStyle(
                fontSize: authenticationLargeTitleSize,
                color: authenticationLargeTitleColor,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text('Don\'t worry! it happens. Please enter the\naddress associated with your account.',
              style: TextStyle(
                color: authenticationSmallTitleColor,
                fontSize: authenticationSmallTitleSize,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(phoneNumberController,icon: IconsaxPlusLinear.call,label: 'Enter your Phone number',),
            const SizedBox(height: 40),
            authenticationFinishButton(context:  context,title: 'Continue',navigationRoute: ResetPasswordScreen()),
          ],
        ),
      ),
    );
  }
}
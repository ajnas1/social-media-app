import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/view/forgot_password_screen.dart';
import 'package:social_media_app/view/otp_code_screen.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authenticationPadding),
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
                fontWeight: FontWeight.bold
              ),
            ),
            TextFieldWidget(phoneNumberController,icon: IconsaxPlusLinear.call,label: 'Enter your Phone number',),
            TextFieldWidget(passwordController,icon: IconsaxPlusLinear.lock,label: 'Enter your Password',),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.63),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  ForgotPasswordScreen()));
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(color: authenticationClickableTextColor),
                ),
              ),
            ),
            authenticationFinishButton(context: context,title: 'Login',navigationRoute: OtpCodeScreen()),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.18),
              child: Row(
                children: [
                  const Text('New to Social media app?'),
                  GestureDetector(
                    onTap: (){}, 
                    child: const Text(
                      ' Register',
                      style: TextStyle(
                        color: authenticationClickableTextColor
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
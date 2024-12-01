import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/view/login_screen.dart';
import 'package:social_media_app/view/otp_code_screen.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
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
              'Sign up',
              style: TextStyle(
                fontSize: authenticationLargeTitleSize,
                color: authenticationLargeTitleColor,
                fontWeight: FontWeight.bold
              ),
            ),
            TextFieldWidget(usernameController,icon: IconsaxPlusLinear.user,label: 'Enter your Username',),
            TextFieldWidget(phoneNumberController,icon: IconsaxPlusLinear.call,label: 'Enter your Phone number',),
            TextFieldWidget(passwordController,icon: IconsaxPlusLinear.lock,label: 'Enter your Password',),
            authenticationFinishButton(context:  context,title: 'Continue',navigationRoute: OtpCodeScreen()),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.295),
              child: Row(
                children: [
                  const Text('Joined as before?'),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => const LoginScreen()));
                    }, 
                    child: const Text(
                      ' Login',
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
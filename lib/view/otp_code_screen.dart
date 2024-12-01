import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';
import 'package:social_media_app/view/navigation.dart';
import 'package:social_media_app/widget/authentiation_finish_widget.dart';
import 'package:social_media_app/widget/otp_input_widget.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({super.key});
   // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authenticationPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset('assets/lottie/verification_code.json'),
            const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: authenticationLargeTitleSize,
                  color: authenticationLargeTitleColor,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OtpInput(_fieldOne, autoFocus: true),
              OtpInput(_fieldTwo, autoFocus: false),
              OtpInput(_fieldThree, autoFocus: false),
              OtpInput(_fieldFour, autoFocus: false),
              OtpInput(_fieldFive, autoFocus: false),
              OtpInput(_fieldSix, autoFocus: false),
            ],
          ),
          const SizedBox(height: 20),
          authenticationFinishButton(context: context,title: 'Continue',navigationRoute: const Navigation()),
          ],
        ),
      ),
    );
  }
}
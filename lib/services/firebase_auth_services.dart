import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/controller/navigator_key.dart';
import 'package:social_media_app/view/otp_code_screen.dart';

class FirebaseAuthServices {
  
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber,String username,BuildContext context) async {
     
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpCodeScreen(verificationId: verificationId,username: username)));
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> submitOtp(String verificationId,String smsCode,String username) async {
      bool isSuccess = false;
      print(smsCode);
      try {
          // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential =  PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
       
        isSuccess = true;

      } catch (e) {
        print(e);
        print('something went wrong');
        isSuccess = false;
      }
      return isSuccess;
  }

  void addUsername(String username) async {
    if(auth.currentUser != null){
      auth.currentUser!.updateDisplayName(username);
    }
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/view/navigation.dart';
import 'package:social_media_app/view/sign_up_screen.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder:(context, snapshot) {
        if(snapshot.hasData){
          return const Navigation();
        }
        return const SignUpScreen();
      },
    );
  }
}
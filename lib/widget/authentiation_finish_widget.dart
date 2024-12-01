import 'package:flutter/material.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';

Widget authenticationFinishButton(
    {required BuildContext context,
    required String title,
    required Widget navigationRoute}) {
  return ElevatedButton(
    onPressed: () {
      // print(usernameController.text);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => navigationRoute));
    },
    style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius:
              BorderRadius.circular(authenticationElevatedButtonBorderRadius),
        ),
        backgroundColor: authenticationButtonColor,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.95,
            MediaQuery.of(context).size.height * 0.08)),
    child: Text(
      title,
      style: const TextStyle(
          color: authenticationButtonTextColor,
          fontSize: authenticationMediumTitleSize,
          fontWeight: FontWeight.bold),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:social_media_app/utilities/colors.dart';
import 'package:social_media_app/utilities/constants.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(this._controller,{super.key,required this.icon,required,required this.label });
  final IconData icon;
  final TextEditingController _controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
    decoration:  InputDecoration(
    prefixIcon: Icon(icon,color: authenticationIconColor,),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: authenticationTextFieldBorderColor, width: authenticationTextFieldBorderWidth),
      borderRadius: BorderRadius.circular(authenticationTextFieldBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: authenticationTextFieldFocusedBorderColor, width: authenticationTextFieldBorderWidth),
      borderRadius: BorderRadius.circular(authenticationTextFieldBorderRadius),
    ),
    labelText: label,
    labelStyle: const TextStyle(color: authenticationFocusedTextColor)
    ),
  );
  }
}
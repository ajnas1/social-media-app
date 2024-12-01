import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  const OtpInput(this._controller,{required this.autoFocus, super.key});
  final TextEditingController _controller;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: _controller,
        maxLength: 1,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          counterText: '',
          hintStyle: const TextStyle(color: Colors.black,fontSize: 20),
        ),
        onChanged: (value) {
          //if the textfield has a value that time it focus on next textfield
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
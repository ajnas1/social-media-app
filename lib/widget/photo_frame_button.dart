import 'package:flutter/material.dart';

Widget photoFrameButton(IconData icon,String title) {
  return TextButton(
    onPressed: (){}, 
    style: TextButton.styleFrom(
      backgroundColor: Colors.redAccent
    ),
    child:  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,color: Colors.red,),
        Text(title),
      ],
    )
  );
}
import 'package:flutter/material.dart';

Widget storyBar() {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 60,
          width: 60,
          color: Colors.red,
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network('https://i.pinimg.com/originals/7a/d8/5f/7ad85f810b2abcdb1f9954cfc0f6c274.jpg',fit: BoxFit.cover,),
          ),
        ),
      ),
      Text('Ajnas'),
    ],
  );
}
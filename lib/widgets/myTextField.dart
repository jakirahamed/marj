import 'package:flutter/material.dart';

Widget myTextField (String hinText,keyBoardType,controller){
  return TextField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hinText),
  );
}
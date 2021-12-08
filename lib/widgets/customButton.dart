import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marj/const/Appscolor.dart';

Widget customButton(String buttontext,onPressed) {
  return SizedBox(
    width: 350.w,
    height: 50.h,
    child: ElevatedButton(
      onPressed: onPressed,
      child : Text(
        buttontext,
        style: TextStyle(fontSize: 18.sp),
      ),
      style: ElevatedButton.styleFrom(
          primary: AppColors.deep_orange, elevation: 2),
    ),
  );
}

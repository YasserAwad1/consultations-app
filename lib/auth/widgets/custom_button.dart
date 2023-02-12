import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onPressedFunction;
  CustomButton(
      {required this.text,
      required this.onPressedFunction,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusDirectional.circular(15.sp),
      ),
      width: 200.w,
      height: 60.h,
      child: TextButton(
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.sp,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  Icon icon;
  Color color;
  TextEditingController controller;
  Container? preIcon;
  bool? isTextLong;
  TextInputType? textInputType;
  CustomTextFormField(
      {required this.icon,
      required this.label,
      required this.color,
      required this.controller,
      this.preIcon,
      this.isTextLong,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: TextFormField(
        keyboardType: textInputType ?? textInputType,
        controller: controller,
        maxLines: isTextLong != null ? 4 : 1,
        cursorColor: color,
        decoration: InputDecoration(
          prefixIcon: preIcon,
          labelText: label,
          labelStyle: TextStyle(color: color),
          suffixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              width: 2,
              color: color,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              width: 1,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

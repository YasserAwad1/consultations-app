import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSmallButton extends StatelessWidget {
  Icon icon;
  VoidCallback onPressedFunction;
   CustomSmallButton({required this.icon, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 40.h,
      width: 40.w,
      child: IconButton(
        onPressed: onPressedFunction,
        icon: icon
      ),
    );
  }
}

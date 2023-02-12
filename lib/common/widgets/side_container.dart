import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideContainer extends StatelessWidget {
  String title;
  SideContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 130.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.1, 0.7],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.sp,
          ),
        ),
      ),
    );
  }
}

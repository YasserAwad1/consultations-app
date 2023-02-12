import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          // topRight: Radius.circular(30),
          bottomRight: Radius.circular(80),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.1, 0.7],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 18.w),
        child: Text(
          'Create your account!',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderContainer extends StatelessWidget {
  String title;
  double height;
  double? fontSize;
  HeaderContainer({required this.title, required this.height, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
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
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(150),
          bottomStart: Radius.circular(150),
        ),
      ),
      width: double.infinity,
      height: height.h,
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            fontSize: fontSize != null ? fontSize!.sp : 25.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

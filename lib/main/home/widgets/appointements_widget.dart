import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointementsWidget extends StatelessWidget {
  const AppointementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Appointements',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'View All',
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 20.sp,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent,
          elevation: 7,
          shadowColor: Theme.of(context).colorScheme.primary,
          child: Container(
            margin: EdgeInsets.symmetric(
              // horizontal: 12.sp,
              vertical: 7.sp,
            ),
            padding: EdgeInsets.all(7.sp),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            width: 300.w,
            height: 200.h,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/person.png'),
                    ),
                  ),
                  title: Text(
                    'Expert Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    'consultation type',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  leading:
                      Icon(Icons.location_on_outlined, color: Colors.white),
                  title: Text(
                    'mazzeh hwy',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  title: Text(
                    '10:30 PM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/main/settings/screens/settings_screen.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBalanceWidget extends StatelessWidget {
  UserModel user;
  double wallet;
  PageController controller;
  ProfileBalanceWidget({
    required this.user,
    required this.wallet,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 110.h,
            width: 150.w,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: user.image != null
                          ? Image(
                              image: NetworkImage(
                                  '${Endpoints.baseUrl}${user.image}'),
                            )
                          : Image.asset(
                              'assets/images/person.png',
                            ),
                    ),
                  ),
                  title: Text(
                    '${user.first_name} ${user.last_name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(2,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Manage Profile',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 75.h,
            width: 120.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Balance',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                Text(
                  '${NumberFormat().format(wallet)} SYP',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

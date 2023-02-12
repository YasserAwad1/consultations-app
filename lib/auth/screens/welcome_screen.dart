import 'dart:ui';

import 'package:consultation_project/auth/screens/login_screen.dart';
import 'package:consultation_project/auth/screens/signup_page_view.dart';
import 'package:consultation_project/auth/screens/signup_screen.dart';
import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/auth/widgets/header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  @override
  Widget build(BuildContext context) {
    var purple = Theme.of(context).colorScheme.primary;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderContainer(
              title: 'Welcome To The Digital Consulting Platform', height: 150),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Image.asset(
              'assets/images/welcome.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          CustomButton(
            color: purple,
            text: 'Login',
            onPressedFunction: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            color: Colors.indigo,
            text: 'SignUp',
            onPressedFunction: () {
              Navigator.of(context).pushNamed(SignUpPageView.routeName);
            },
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    ));
  }
}

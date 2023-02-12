import 'package:consultation_project/auth/screens/expert_signup_details_screen.dart';
import 'package:consultation_project/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignUpPageView extends StatelessWidget {
  static const routeName = '/sign-up-page-view';
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            SignUpScreen(
              pageController: pageController,
            ),
            ExpertSignUpDetailsScreen(),
          ],
        ),
      ),
    );
  }
}

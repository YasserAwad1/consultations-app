import 'package:consultation_project/auth/providers/auth_provider.dart';
import 'package:consultation_project/auth/screens/signup_page_view.dart';
import 'package:consultation_project/auth/screens/signup_screen.dart';
import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/auth/widgets/custom_textfrom_field.dart';
import 'package:consultation_project/auth/widgets/header_container.dart';
import 'package:consultation_project/main/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var purple = Theme.of(context).colorScheme.primary;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading
                ? CircularProgressIndicator(
                    color: purple,
                  )
                : CustomButton(
                    text: 'Login',
                    onPressedFunction: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final success = await Provider.of<AuthProvider>(context,
                              listen: false)
                          .login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (success) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context)
                            .pushReplacementNamed(HomePageView.routeName);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'invalid credentiols',
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    color: purple,
                  ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderContainer(title: 'Login to your account!', height: 110.h),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 220.h,
                width: double.infinity,
                child: Image.asset('assets/images/login.png'),
              ),
              CustomTextFormField(
                controller: emailController,
                icon: Icon(
                  Icons.mail,
                  color: purple,
                ),
                label: 'E-mail',
                color: purple,
              ),
              CustomTextFormField(
                controller: passwordController,
                icon: Icon(Icons.password, color: purple),
                label: 'Password',
                color: purple,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpPageView.routeName);
                    },
                    child: Text(
                      'SignUp Now!',
                      style: TextStyle(
                        color: purple,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

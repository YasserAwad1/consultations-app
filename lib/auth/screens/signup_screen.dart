import 'dart:io';

import 'package:consultation_project/auth/providers/auth_provider.dart';
import 'package:consultation_project/features/category_details/screens/consultation_details_tab_bar_view.dart';
import 'package:consultation_project/features/category_details/screens/category_experts_screen.dart';
import 'package:consultation_project/main/home_page_view.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:consultation_project/auth/screens/expert_signup_details_screen.dart';
import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/auth/widgets/custom_textfrom_field.dart';
import 'package:consultation_project/auth/widgets/signup_header.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  PageController? pageController;
  SignUpScreen({this.pageController});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  int? role;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final ImagePicker imagePicker = ImagePicker();
  File? image;

  void selectImage() async {
    XFile? selectedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null) {
      image = File(selectedImage.path);
    }
    setState(() {});
  }

  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });
    final success =
        await Provider.of<AuthProvider>(context, listen: false).register(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
      role!,
      // address: 'address',
      image: image,
      // phoneNumber: '09123123123'
    );
    if (success) {
      await Provider.of<AuthProvider>(context, listen: false)
          .login(emailController.text, passwordController.text);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacementNamed(HomePageView.routeName);
    } else {
      setState(() {
        isLoading = false;
      });
      print('error');
      return;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var purple = Theme.of(context).colorScheme.primary;
    var indigo = Theme.of(context).colorScheme.secondary;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    const SignUpHeader(),
                    SizedBox(
                      width: 80.w,
                    ),
                    Stack(children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: image != null
                              ? Image.file(File(image!.path))
                              : Image.asset('assets/images/profile.jpg'),
                        ),
                      ),
                      Positioned(
                        top: 65.h,
                        left: 60.w,
                        child: IconButton(
                          onPressed: () {
                            selectImage();
                          },
                          icon: Icon(
                            Icons.upload,
                            color: indigo,
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: CustomTextFormField(
                          controller: firstNameController,
                          icon: Icon(
                            Icons.person,
                            color: indigo,
                          ),
                          label: 'First Name',
                          color: indigo),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: CustomTextFormField(
                          controller: lastNameController,
                          icon: Icon(
                            Icons.person,
                            color: indigo,
                          ),
                          label: 'Last Name',
                          color: indigo),
                    )
                  ],
                ),
                CustomTextFormField(
                  controller: emailController,
                  icon: Icon(
                    Icons.mail,
                    color: indigo,
                  ),
                  label: 'E-mail',
                  color: indigo,
                ),
                CustomTextFormField(
                    controller: passwordController,
                    icon: Icon(
                      Icons.password,
                      color: indigo,
                    ),
                    label: 'Password',
                    color: indigo),
                CustomTextFormField(
                    controller: confirmController,
                    icon: Icon(
                      Icons.password,
                      color: indigo,
                    ),
                    label: 'Confirm Password',
                    color: indigo),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Role',
                      style: TextStyle(color: indigo, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: indigo,
                          value: 1,
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value!;
                            });
                            print(role);
                          },
                        ),
                        Text('User'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: indigo,
                          value: 2,
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value!;
                            });
                            print(role);
                          },
                        ),
                        Text('Expert'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        text: role == null || role == 1 ? 'SignUp' : 'Next',
                        onPressedFunction: () {
                          role == 1
                              ? signUp()
                              : Navigator.of(context).pushNamed(
                                  ExpertSignUpDetailsScreen.routeName,
                                  arguments: {
                                      "first_name": firstNameController.text,
                                      "last_name": lastNameController.text,
                                      "email": emailController.text,
                                      "password": passwordController.text,
                                      "image": image
                                    });
                        },
                        color: indigo,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

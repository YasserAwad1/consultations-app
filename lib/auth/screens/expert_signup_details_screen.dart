import 'dart:io';

import 'package:consultation_project/auth/providers/auth_provider.dart';
import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/auth/widgets/custom_textfrom_field.dart';
import 'package:consultation_project/auth/widgets/header_container.dart';
import 'package:consultation_project/common/widgets/side_container.dart';
import 'package:consultation_project/main/home_page_view.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExpertSignUpDetailsScreen extends StatefulWidget {
  static const routeName = 'expert-sign-up-details-screen';

  @override
  State<ExpertSignUpDetailsScreen> createState() =>
      _ExpertSignUpDetailsScreenState();
}

class _ExpertSignUpDetailsScreenState extends State<ExpertSignUpDetailsScreen> {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  File? image;
  bool isLoading = false;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    firstName = args['first_name'];
    lastName = args['last_name'];
    email = args['email'];
    password = args['password'];
    image = args['image'];

    var purple = Theme.of(context).colorScheme.primary;
    var indigo = Theme.of(context).colorScheme.secondary;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainer(
                fontSize: 22,
                title: 'Tell us more about yourself!',
                height: 120,
              ),
              SizedBox(
                height: 50.h,
              ),
              //PHONE NUMBER TEXT FORM FIELD
              CustomTextFormField(
                controller: phoneNumberController,
                color: indigo,
                icon: Icon(
                  Icons.phone,
                  color: indigo,
                ),
                label: 'Phone Number',
                preIcon: Container(
                  margin: EdgeInsets.only(left: 7.w),
                  width: 50,
                  child: CountryCodePicker(
                    textStyle:
                        TextStyle(color: indigo, fontWeight: FontWeight.bold),
                    showFlag: false,
                    flagWidth: 15,
                    onChanged: print,
                    padding: EdgeInsets.zero,
                    initialSelection: 'SY',
                    favorite: ['+963', 'SY'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: true,
                  ),
                ),
              ),
              // ADDRESS TEXT FORM FIELD
              CustomTextFormField(
                controller: addressController,
                icon: Icon(
                  Icons.location_on_outlined,
                  color: indigo,
                ),
                label: 'Address',
                color: indigo,
              ),
              SizedBox(
                height: 50.h,
              ),
              // //EXPERIENCE CONTAINER
              // SideContainer(
              //   title: 'Experience',
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Type',
              //         style: TextStyle(
              //           fontSize: 20.sp,
              //           fontWeight: FontWeight.bold,
              //           color: indigo,
              //         ),
              //       ),
              //       DropdownButton(
              //         items: [],
              //         onChanged: null,
              //         hint: Text('Choose'),
              //       )
              //     ],
              //   ),
              // ),
              // CustomTextFormField(
              //   controller: detailsController,
              //   isTextLong: true,
              //   icon: Icon(
              //     Icons.more_horiz_outlined,
              //     color: indigo,
              //   ),
              //   label: 'Details',
              //   color: indigo,
              // ),
              // // AVAILABLE TIMES
              // SizedBox(
              //   height: 15.h,
              // ),
              //SIGNUP BUTTON
              Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : CustomButton(
                        text: 'Signup',
                        onPressedFunction: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final success = await Provider.of<AuthProvider>(
                                  context,
                                  listen: false)
                              .register(
                            firstName!,
                            lastName!,
                            email!,
                            password!,
                            2,
                            address: addressController.text,
                            image: image,
                            phoneNumber: phoneNumberController.text,
                          );
                          if (success) {
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .login(email!, password!);
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.of(context)
                                .pushReplacementNamed(HomePageView.routeName);
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
                        },
                        color: indigo,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
